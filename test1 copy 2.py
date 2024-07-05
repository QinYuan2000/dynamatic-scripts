#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp
import subprocess


date = "Jun_28"           # Date for output files in 'gurobi_out'


if __name__ == "__main__":
    benchmark_directory = Path("./dynamatic/integration-test")
    benchmark = "histogram"  # Choose circuit benchmark.
    # =============================================================================================================#
    dotfile = (
        benchmark_directory / benchmark / "out" / "comp" / (benchmark + ".dot")
    )

    # get the unbuffered DOT file: in this way, we don't need to modify
    # dynamatic script to generate unbuffered dot
    unbuffered_mlir = (
        benchmark_directory
        / benchmark
        / "out"
        / "comp"
        / "handshake_transformed.mlir"
    )
    exported_mlir = (
        benchmark_directory
        / benchmark
        / "out"
        / "comp"
        / "handshake_export.mlir"
    )
    buffered_mlir = (
        benchmark_directory
        / benchmark
        / "out"
        / "comp"
        / "handshake_buffered.mlir"
    )
    with open(exported_mlir, "w") as f:
        f.write(
            subprocess.run(
                [
                    "./dynamatic/bin/dynamatic-opt",
                    unbuffered_mlir,
                    "--handshake-canonicalize",
                ],
                stdout=subprocess.PIPE,
                universal_newlines=True,
            ).stdout
        )
    with open(dotfile, "w") as f:
        f.write(
            subprocess.run(
                [
                    "./dynamatic/bin/export-dot",
                    exported_mlir,
                    "--mode=legacy",
                    "--edge-style=spline",
                    "--timing-models=./dynamatic/data/components.json",
                ],
                stdout=subprocess.PIPE,
                universal_newlines=True,
            ).stdout
        )
    # =============================================================================================================#

    dfg = DFG(  # Generate dfg object from .dot file.
        AGraph(
            dotfile,
            strict=False,
            directed=True,
        )
    )

    # Remove mem_controllers and LSQ node and edges from dfg graph
    to_remove = []
    for n in dfg.nodes():
        if "mem_controller" in n or ("LSQ" in n and "load" not in n and "store" not in n):
            to_remove.append(n)

    for i in to_remove:
        dfg.remove_nodes_from([i])

    # Clock period and maximum clock period
    CP = 5.5
    CPmax = 100

    # Create datasheet for dfg
    # If delay longer than to_pl, we pipeline the unit
    # to_pl = 100000
    pl_units = []  # Pipelined unit
    conpl_units = (
        []
    )  # Constant latency pipelined units, latency already shown in dot file
    # varpl_units = []  # Variable latency pipelined units, which have long delays
    dfg_dict = {}  # DFG datasheet indexed by units
    # Here pipelined units will be splitted to two nodes and a channel connecting them.
    # Relationship with previous and successor nodes unchanged.
    for unit in dfg:
        if dfg.get_latency(unit) > 0:
            dfg_dict[unit + "_plin"] = dfg.gen_dict(unit)
            dfg_dict[unit + "_plout"] = dfg.gen_dict(unit)
            conpl_units.append(unit)
            pl_units.append(unit)

        # elif dfg.get_delay(unit) > to_pl:
        #     dfg_dict[unit + "_plin"] = dfg.gen_dict(unit)
        #     dfg_dict[unit + "_plout"] = dfg.gen_dict(unit)
        #     dfg_dict[unit + "_plin"][
        #         "delay"
        #     ] /= 2  # Splitted nodes have halved delays
        #     dfg_dict[unit + "_plout"]["delay"] /= 2
        #     varpl_units.append(unit)
        #     pl_units.append(unit)

        else:
            dfg_dict[unit] = dfg.gen_dict(unit)
            # To avoid combinational loop.
            if dfg_dict[unit]["delay"] == 0:
                dfg_dict[unit]["delay"] += 0.0001
        # print("the latency of ", unit, "is", dfg.get_latency(unit))
        # print("the delay of ", unit, "is", dfg.get_delay(unit))

    # This is the test code
    # for u in dfg_dict:
    #     print(dfg_dict[u]['delay'])

    # Gain four types of channel list
    # Total / exclude channels in pipeline / constant latency pipeline / variable latency pipeline
    dfg_edges = list(dfg.edges())
    dfg_edges_nopl = list(dfg.edges())
    dfg_edges_conpl, dfg_edges_varpl = [], []
    for i, e in enumerate(dfg_edges):
        if e[0] in pl_units and e[1] in pl_units:
            dfg_edges[i] = (e[0] + "_plout", e[1] + "_plin")
            dfg_edges_nopl[i] = (e[0] + "_plout", e[1] + "_plin")

        elif e[0] in pl_units:
            dfg_edges[i] = (e[0] + "_plout", e[1])
            dfg_edges_nopl[i] = (e[0] + "_plout", e[1])

        elif e[1] in pl_units:
            dfg_edges[i] = (e[0], e[1] + "_plin")
            dfg_edges_nopl[i] = (e[0], e[1] + "_plin")
    # for u in pl_units:
    #     dfg_edges.append( (u + '_plin', u + '_plout') )
    for u in conpl_units:
        dfg_edges.append((u + "_plin", u + "_plout"))
        dfg_edges_conpl.append((u + "_plin", u + "_plout"))

    # for u in varpl_units:
    #     dfg_edges.append((u + "_plin", u + "_plout"))
    #     dfg_edges_varpl.append((u + "_plin", u + "_plout"))

    # Extract multiple edges between the same unit pair and count their occurence
    single_edges = []
    multi_edges = {}
    for e in dfg_edges_nopl:
        if e in single_edges:
            if e in multi_edges:
                multi_edges[e] += 1

            else:
                multi_edges[e] = 1

        else:
            single_edges.append(e)
    dfg_edges_nopl = single_edges
    if multi_edges:
        # single_edges = []
        # for e in dfg_edges:
        #     if e not in single_edges:
        #         single_edges.append(e)
        # dfg_edges = single_edges
        dfg_edges = set(dfg_edges)

    # The same way to get channel lists in each cfdfc in four forms as in dfg channels
    cfdfcs = dfg.generate_cfdfcs()
    # CFDFC numbers and weights before filtering
    CFDFC_NUM = len(cfdfcs)
    cfdfc_file = f'dynamatic/integration-test/{benchmark}/out/comp/buffer-placement/{benchmark}/placement.log'
    execution_counts = []
    CFDFC_Weight = []

    try:
        with open(cfdfc_file, 'r') as file:
            lines = file.readlines()
        
        bb_numbers = {}  # Dictionary to store bbID numbers associated with each CFDFC
        execution_counts = []
        
        for i in range(len(lines) - 1):
            if lines[i].startswith("CFDFC #"):
                parts = lines[i].split(':')
                cfdfc_id = int(parts[0].strip()[-1])
                numbers = parts[1].strip()
                number_set = set(map(lambda x: int(x) + 1, numbers.replace('->', ' ').split()))
                bb_numbers[cfdfc_id] = set(sorted(number_set))
                
                next_line = lines[i + 1]
                if next_line.startswith("  - Number of executions:"):
                    num_executions = int(next_line.split(":")[1].strip())
                    execution_counts.append(num_executions)
        
        total_executions = sum(execution_counts)
        
        if total_executions > 0:
            CFDFC_Weight_unsorted = [count / total_executions for count in execution_counts]

        bbID_dict = {}
        for num in range(CFDFC_NUM):
            cfdfc_set = set()
            for i in cfdfcs[num]:
                if i in dfg_dict:
                    cfdfc_set.add(dfg_dict[i]['bbID'])
                else:
                    cfdfc_set.add(dfg_dict[i+'_plin']['bbID'])
            bbID_dict[num] = cfdfc_set

        check_duplicated_bb_path = set()
        CFDFC_Weight = []
        CFDFC_delete = []
        for index0, num in bbID_dict.items():
            flag = 0
            for index, num2 in bb_numbers.items():
                if num == num2:
                    CFDFC_Weight.append(CFDFC_Weight_unsorted[index])
                    check_duplicated_bb_path.add(index)
                    flag = 1
            if flag == 0:
                CFDFC_delete.append(index0)

        assert (
            len(CFDFC_Weight) == len(CFDFC_Weight_unsorted) and 
            len(CFDFC_Weight) == len(check_duplicated_bb_path)
        ), "CFDFC alignment fault!"

    except FileNotFoundError:
        print(f"The file {cfdfc_file} does not exist.")

    # Filter cfdfcs if not executed
    cfdfcs = [item for index, item in enumerate(cfdfcs) if index not in CFDFC_delete]

    # CFDFC numbers and weights after filtering
    CFDFC_NUM = len(cfdfcs)
    cfdfcs_nopl, cfdfcs_conpl = [], []
    cfc_nodes = []
    for cfc in cfdfcs:
        cfdfc_nopl, cfdfc_conpl, cfdfc_varpl = list(cfc.edges()), [], []
        for i, e in enumerate(cfc.edges()):
            if e[0] in pl_units and e[1] in pl_units:
                cfdfc_nopl[i] = (e[0] + "_plout", e[1] + "_plin")

            elif e[0] in pl_units:
                cfdfc_nopl[i] = (e[0] + "_plout", e[1])

            elif e[1] in pl_units:
                cfdfc_nopl[i] = (e[0], e[1] + "_plin")

        for u in cfc.nodes():
            if u in conpl_units:
                cfdfc_conpl.append((u + "_plin", u + "_plout"))

        cfdfcs_nopl.append(cfdfc_nopl)
        cfdfcs_conpl.append(cfdfc_conpl)

        cfc_node = list(cfc)
        for u in conpl_units:
            if u in cfc_node:
                cfc_node.remove(u)
                cfc_node.append(u + "_plin")
                cfc_node.append(u + "_plout")
        cfc_nodes.append(cfc_node)


    # Find back edges
    Bc = {}  # Whether it is the back edge, indexed by edges
    for e in dfg_edges:
        Bc[e] = (
            dfg_dict[e[0]]["bbID"] > dfg_dict[e[1]]["bbID"]
            and dfg_dict[e[1]]["bbID"] != 0
        ) or (  # To exclude sinks
            dfg_dict[e[0]]["bbID"] == dfg_dict[e[1]]["bbID"]
            and dfg_dict[e[0]]["type"] in ["Branch"]
            and dfg_dict[e[1]]["type"] in ["Mux", "Merge", "CntrlMerge"]
        )  # "Merge" not found but kept here,
    # And unit delays are represented by dfg_dict[unit]["delay"]

    # This is to test Bc function
    # for i in Bc:
    #     if Bc[i] == True:
    #         print(i)

    # Generate neighbouring channel pairs for path timing constraints.
    # Split in three ways, since the delay of pipelined units can be different fuctions.
    # TODO: To be improved in efficiency; Whether it is good if there exist self loops.
    path_pair_nopl, path_pair_conpl, path_pair_varpl = {}, {}, {}
    conpl_units_ext = [u + "_plin" for u in conpl_units] + [
        u + "_plout" for u in conpl_units
    ]
    # varpl_units_ext = [u + "_plin" for u in varpl_units] + [
    #     u + "_plout" for u in varpl_units
    # ]
    for n in dfg_dict:
        succ_edge, prev_edge = [], []
        for e in dfg_edges:
            if e[0] == n:
                succ_edge.append(e)
            if e[1] == n:
                prev_edge.append(e)
        if len(succ_edge) and len(prev_edge):
            if n in conpl_units_ext:
                path_pair_conpl[n] = {"succ": succ_edge, "prev": prev_edge}
            # elif n in varpl_units_ext:
            #     path_pair_varpl[n] = {"succ": succ_edge, "prev": prev_edge}
            else:
                path_pair_nopl[n] = {"succ": succ_edge, "prev": prev_edge}

    # Build a dictionary to find the original name of pipelined units. Used for latency variable and constraints.
    # varpl_origin = {}
    # for u in varpl_units:
    #     varpl_origin[u + "_plin"] = u
    #     varpl_origin[u + "_plout"] = u
    #     varpl_origin[(u + "_plin", u + "_plout")] = u

    # Prepare constant latencies for opt model
    Lu_con = {}
    for u in dfg_dict:
        if "_plin" in u:
            for e in dfg_edges_conpl:
                if u == e[0]:
                    Lu_con[e] = dfg_dict[u]["latency"]
                    break

    signal_num = 3  # Index sequence: DATA, VALID, READY
    buffertype_num = 4 # Index sequence: OB TB FT PL ; TODO: Indexed by name
    buffertype = ['oehb', 'tehb', 'full', 'pipeline']   # TODO
    # Initialize model
    model = gp.Model()

    # Output variables of the model.
    Var_Rc = model.addVars(  # Insert non-tran buffer or not.
        dfg_edges_nopl, signal_num,  # Exclude channels inside the pipelined units
        vtype=gp.GRB.BINARY,
        name="Rc",
    )

    Var_Nc = model.addVars(  # The buffer size. Rc = 0, Nc > 0 means transparent buffer.
        dfg_edges_nopl, buffertype_num, # Exclude channels inside the pipelined units
        vtype=gp.GRB.INTEGER,
        lb=0,
        ub=1000,                # May need a larger upbound for large circuits
        name="Nc",
    )

    # Internal variables of the model.
    Var_Throughput = model.addVars(  # Throughput of each cfdfc
        CFDFC_NUM,
        vtype=gp.GRB.CONTINUOUS,
        lb=0.001,
        ub=1,
        name="Theta",
    )

    Var_Token = {}
    Var_Tokenpl = {}
    num = 0
    for i in cfdfcs_nopl:
        Var_Token[num] = model.addVars(  # Average occupancy of channels
            i,
            vtype=gp.GRB.CONTINUOUS,
            lb=0,
            ub=gp.GRB.INFINITY,
            name="Theta1_" + str(num),
        )
        num += 1

    num = 0
    for i in cfdfcs_conpl:
        Var_Tokenpl[num] = model.addVars(  # Average occupancy of pipelined units
            i,
            vtype=gp.GRB.CONTINUOUS,
            lb=0,
            ub=gp.GRB.INFINITY,
            name="Theta1pl_" + str(num),
        )
        num += 1

    Var_Retiming = {}
    num = 0
    for i in cfc_nodes:
        Var_Retiming[num] = model.addVars(  # Fluid retiming of tokens across unit u.
            i, 
            vtype=gp.GRB.CONTINUOUS,
            lb=0,
            ub=gp.GRB.INFINITY,
            name="ru_" + str(num),
        )
        num += 1

    Var_Tin = model.addVars(  # Arrival time at the the input of channel c.
        dfg_edges, signal_num,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Tin",
    )

    Var_Tout = model.addVars(  # Arrival time at the the output of channel c.
        dfg_edges, signal_num,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Tout",
    )

    # Set Objective
    # TODO: A new lambda needed.
    Lambda = 1e-5  # Weight of total buffer size relative to throughputs
    Objective = gp.LinExpr()
    for i in range(CFDFC_NUM):  # Weighted sum of throughputs of cfdfcs
        Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])

    for num in range(signal_num):
        for e in dfg_edges_nopl:  # Not pipelined buffer size
            Objective.addTerms(-Lambda, Var_Nc[e[0],e[1],num])

    for num in range(signal_num):
        for e in multi_edges:  # Multiple edges between the same unit pair
            Objective.addTerms(-Lambda * multi_edges[e], Var_Nc[e[0],e[1],num])

    # for (
    #     u
    # ) in varpl_units:  # Pipelined buffer size. TODO: Complicated if II added.
    #     Objective.addTerms(-Lambda, Lu[u])

    model.setObjective(Objective, gp.GRB.MAXIMIZE)

    # Path timing constraints.

    # A buffer reset comb delay otherwise accumulate.
    PathConstr1 = model.addConstrs(
        (Var_Tout[e[0],e[1],num] >= Var_Tin[e[0],e[1],num] - CPmax * Var_Rc[e[0],e[1],num] for num in range(signal_num) for e in dfg_edges_nopl),
        name="PathConstr1",
    )

    # Since there must be no constraints here on constant pipelined units, we skip them

    # Clock period constraints.
    PathConstr2 = model.addConstrs(
        (Var_Tin[e[0],e[1],num] <= CP for num in range(signal_num) for e in dfg_edges),
        name="PathConstr2",
    )

    # Unit delay of not pipelined / pipelined units.
    # READY signal constraints are symmetric, we can keep signal directions uniform by flipping the directions of unit READY delays.
    num2 = 0
    for pn in path_pair_nopl:
        for prev in path_pair_nopl[pn]["prev"]:
            for succ in path_pair_nopl[pn]["succ"]:
                model.addConstrs(
                    (Var_Tin[succ[0],succ[1],num] >= Var_Tout[prev[0],prev[1],num] + dfg_dict[pn]["delay"] for num in range(signal_num)),
                    name="PathConstr3_nopl_" + str(num2),
                )
                num2 += 1

    num2 = 0
    for pn in path_pair_conpl:  # Currently same as nopl but the model can be easily modified.
        for prev in path_pair_conpl[pn]["prev"]:
            for succ in path_pair_conpl[pn]["succ"]:
                model.addConstrs(
                    (Var_Tin[succ[0],succ[1],num] >= Var_Tout[prev[0],prev[1],num] + dfg_dict[pn]["delay"] for num in range(signal_num)),
                    name="PathConstr3_conpl_" + str(num2),
                )
                num2 += 1

    # whenever it’s necessary to cut the timing path of a specific signal type in a channel, 
    # there is a buffer within that channel capable of performing this cut.
    buffercut = np.array([
        [1,1,0],    #OB
        [0,0,1],    #TB
        [0,0,0],    #FT
        [1,1,0],    #PL
    ])
    model.addConstrs(
        (
            gp.quicksum(
                buffercut[i, num] * Var_Nc[e[0],e[1],i] for i in range(buffertype_num)
            ) >= Var_Rc[e[0],e[1],num]
            for num in range(signal_num) 
            for e in dfg_edges_nopl
        ),
        name="buffercut_nopl",
    )


    # The following are Throughput constraints.
    # Retiming constraints.
    model.addConstrs(
        (
            Var_Token[num][e] == Bc[e] + Var_Retiming[num][e[1]] - Var_Retiming[num][e[0]]
            for num in range(CFDFC_NUM) for e in cfdfcs_nopl[num]
        ),
        name="ThroughputConstr1",
    )

    model.addConstrs(
        (
            Var_Tokenpl[num][e] == Bc[e] + Var_Retiming[num][e[1]] - Var_Retiming[num][e[0]]
            for num in range(CFDFC_NUM) for e in cfdfcs_conpl[num]
        ),
        name="ThroughputConstr1",
    )

    # CFDFC throughputs confined by channel throughputs in each cfdfc.
    # Buffer latency upperbound & lowerbound for each channel.
    # Lower bound
    model.addConstrs(
        (
            Var_Token[num][e] >= 
            Var_Nc[e[0],e[1],0] * Var_Throughput[num] + 
            Var_Nc[e[0],e[1],3] * Var_Throughput[num]
            for num in range(CFDFC_NUM)
            for e in cfdfcs_nopl[num]
        ),
        name="lowerbound_nopl",
    )

    model.addConstrs(
        (
            Var_Tokenpl[num][e] >= 
            Lu_con[e] * Var_Throughput[num]
            for num in range(CFDFC_NUM)
            for e in cfdfcs_conpl[num]
        ),
        name="lowerbound_conpl",
    )

    # Upperbound
    # Pipeline's ceiling function need auxiliary variables.
    # Minimizing ceiling requires integer variables strictly less than the real values plus one
    # Ceilingpl is used when we model pipelined units as a pipeline buffer in the internal channel
    Ceiling = {}
    # Ceilingpl = {}
    for num in range(CFDFC_NUM):
        Ceiling[num] = model.addVars( 
            cfdfcs_nopl[num],
            vtype=gp.GRB.INTEGER,
            lb=0,
            ub=gp.GRB.INFINITY,
            name="Ceiling_" + str(num),
        )

    # for num in range(CFDFC_NUM):
    #     Ceilingpl[num] = model.addVars( 
    #         cfdfcs_conpl[num],
    #         vtype=gp.GRB.INTEGER,
    #         lb=0,
    #         ub=gp.GRB.INFINITY,
    #         name="Ceilingpl_" + str(num),
    #     )

    model.addConstrs(
        (
            Ceiling[num][e] <= Var_Nc[e[0],e[1],3] * Var_Throughput[num] + 1 - 1e-5
            for num in range(CFDFC_NUM)
            for e in cfdfcs_nopl[num]
        ),
        name="CeilingConstr",
    )

    # model.addConstrs(
    #     (
    #         Ceilingpl[num][e] < Lu_con[e] * Var_Throughput[num] + 1
    #         for num in range(CFDFC_NUM)
    #         for e in cfdfcs_conpl[num]
    #     ),
    #     name="CeilingConstrpl",
    # )

    model.addConstrs(
        (
            Var_Token[num][e] <= 
            Var_Nc[e[0],e[1],0] + Var_Nc[e[0],e[1],1] * (1 - Var_Throughput[num]) +
            Var_Nc[e[0],e[1],2] + Ceiling[num][e]
            for num in range(CFDFC_NUM)
            for e in cfdfcs_nopl[num]
        ),
        name="upperbound_nopl",
    )

    model.addConstrs(
        (
            Var_Tokenpl[num][e] <= Lu_con[e]
            for num in range(CFDFC_NUM)
            for e in cfdfcs_conpl[num]
        ),
        name="upperbound_conpl",
    )

    # model.setParam(gp.GRB.Param.PoolSolutions, 2)
    # model.setParam(gp.GRB.Param.PoolGap, 0)
    # model.setParam(gp.GRB.Param.PoolSearchMode, 2)  
    # model.setParam('OptimalityTol', 1e-9)
    # model.setParam('MIPGap', 1e-5)


    # File name to record model and results
    record_key = date + "_" + benchmark + "_" + str(CP)

    # Output logfile
    model.setParam("LogFile", "gurobi_out/log/" + record_key + ".log")

    # Run solver.
    model.optimize()

    # View model in this file.
    model.write("gurobi_out/model/" + record_key + ".lp")

    # View solutions and results in this file.
    with open("gurobi_out/solution/" + record_key + ".txt", "w") as f:
        f.write("Optimal solution:\n")
        for v in model.getVars():
            f.write(f"{v.VarName} = {v.x}\n")
        f.write(f"Objective value: {model.objVal}\n")

    # =============================================================================================================#
    cmds = []
    for e in dfg_edges_nopl:
        pred, succ = e
        pred = pred.removesuffix("_plin")
        pred = pred.removesuffix("_plout")
        succ = succ.removesuffix("_plin")
        succ = succ.removesuffix("_plout")
        # TODO: Function not verified
        for i in dfg[pred][succ]:
            outid = int(dfg[pred][succ][i]["from"].replace("out", "")) - 1
            # a HACK for inverted output channels of the mc_load port (and perhaps
            # also lsq_load ports) in MILR convention vs in DOT convention.
            if outid == 0 and "mc_load" in pred:
                outid = 1
            for num in range(buffertype_num):
                slots = int(Var_Nc[e[0],e[1],num].x)
                if slots >= 1 and (("start" not in pred) and ("return" not in pred)):
                    cmd = f"--handshake-placebuffers-custom=pred={pred} outid={outid} slots={slots} type={buffertype[i]}"
                    cmds.append(cmd)

    # insert buffers into the mlir file that has no buffer inside
    print("\n".join(cmds))
    result = subprocess.run(
        [
            "./dynamatic/bin/dynamatic-opt",
            unbuffered_mlir,
        ]
        + cmds,
        stdout=subprocess.PIPE,
        universal_newlines=True,
    )
    # write the generated mlir file into handshake_buffered.mlir
    with open(
        buffered_mlir,
        "w",
    ) as f:
        f.write(result.stdout)

    with open(exported_mlir, "w") as f:
        f.write(
            subprocess.run(
                [
                    "./dynamatic/bin/dynamatic-opt",
                    buffered_mlir,
                    "--handshake-canonicalize",
                ],
                stdout=subprocess.PIPE,
                universal_newlines=True,
            ).stdout
        )

    with open(dotfile, "w") as f:
        f.write(
            subprocess.run(
                [
                    "./dynamatic/bin/export-dot",
                    exported_mlir,
                    "--mode=legacy",
                    "--edge-style=spline",
                    "--timing-models=./dynamatic/data/components.json",
                ],
                stdout=subprocess.PIPE,
                universal_newlines=True,
            ).stdout
        )
    # run simulation

    # =============================================================================================================#

