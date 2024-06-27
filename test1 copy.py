#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp
import subprocess


date = "Mar_25"           # Date for output files in 'gurobi_out'


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

    # Remove mem_controllers node and edges from dfg graph
    to_remove = []
    for n in dfg.nodes():
        if "mem_controller" in n or ("LSQ" in n and "load" not in n and "store" not in n):
            to_remove.append(n)

    for i in to_remove:
        dfg.remove_nodes_from([i])

    # Clock period and maximum clock period
    CP = 8
    CPmax = 100

    # Create datasheet for dfg
    # If delay longer than to_pl, we pipeline the unit
    to_pl = 100
    pl_units = []  # Pipelined unit
    conpl_units = (
        []
    )  # Constant latency pipelined units, latency already shown in dot file
    varpl_units = []  # Variable latency pipelined units, which have long delays
    dfg_dict = {}  # DFG datasheet indexed by units
    # Here pipelined units will be splitted to two nodes and a channel connecting them.
    # Relationship with previous and successor nodes unchanged.
    for unit in dfg:
        if dfg.get_latency(unit) > 0:
            dfg_dict[unit + "_plin"] = dfg.gen_dict(unit)
            dfg_dict[unit + "_plout"] = dfg.gen_dict(unit)
            conpl_units.append(unit)
            pl_units.append(unit)

        elif dfg.get_delay(unit) > to_pl:
            dfg_dict[unit + "_plin"] = dfg.gen_dict(unit)
            dfg_dict[unit + "_plout"] = dfg.gen_dict(unit)
            dfg_dict[unit + "_plin"][
                "delay"
            ] /= 2  # Splitted nodes have halved delays
            dfg_dict[unit + "_plout"]["delay"] /= 2
            varpl_units.append(unit)
            pl_units.append(unit)

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

    for u in varpl_units:
        dfg_edges.append((u + "_plin", u + "_plout"))
        dfg_edges_varpl.append((u + "_plin", u + "_plout"))

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

    # This is to change dfg structure but currently not compatible with other functions
    # for unit in pl_units:
    #     predecessors = list(dfg.predecessors(unit))
    #     successors = list(dfg.successors(unit))

    #     node_in = unit + '_plin'
    #     node_out = unit + '_plout'
    #     dfg.add_node(node_in)
    #     dfg.add_node(node_out)

    #     for predecessor in predecessors:
    #         for edge_key in dfg[predecessor][unit]:
    #             dfg.add_edge(predecessor, node_in, key = edge_key)

    #     for successor in successors:
    #         for edge_key in dfg[unit][successor]:
    #             dfg.add_edge(node_out, successor, key = edge_key)

    #     dfg.remove_node(unit)
    #     dfg.add_edge(node_in, node_out)

    # The same way to get channel lists in each cfdfc in four forms as in dfg channels
    cfdfcs = dfg.generate_cfdfcs()
    cfdfcs_nopl, cfdfcs_conpl, cfdfcs_varpl = [], [], []
    for cfc in cfdfcs:
        # TODO: When multiple cfdfcs, index sequence consistency not verified yet.
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

            if u in varpl_units:
                cfdfc_varpl.append((u + "_plin", u + "_plout"))

        cfdfcs_nopl.append(cfdfc_nopl)
        cfdfcs_conpl.append(cfdfc_conpl)
        cfdfcs_varpl.append(cfdfc_varpl)
    # for i, cfc in enumerate(cfdfcs):
    #     for unit in cfc:
    #         print("the", i + 1, "-th extracted cfdfc has node:", unit)

    #     for pred, succ in cfc.edges():
    #         print(
    #             "the",
    #             i + 1,
    #             "-th extracted cfdfc has edge:",
    #             f"{pred}-->{succ}",
    #         )

    # CFDFC numbers and weights
    # TODO: Sequence not match!
    CFDFC_NUM = len(cfdfcs)
    cfdfc_file = f'dynamatic/integration-test/{benchmark}/out/comp/buffer-placement/{benchmark}/placement.log'
    execution_counts = []
    CFDFC_Weight = []

    try:
        with open(cfdfc_file, 'r') as file:
            lines = file.readlines()
        
        for i in range(len(lines) - 1):
            if lines[i].startswith("CFDFC #"):
                next_line = lines[i + 1]
                if next_line.startswith("  - Number of executions:"):
                    num_executions = int(next_line.split(":")[1].strip())
                    execution_counts.append(num_executions)
        
        total_executions = sum(execution_counts)
        
        if total_executions > 0:
            CFDFC_Weight = [count / total_executions for count in execution_counts]

    except FileNotFoundError:
        print(f"The file {cfdfc_file} does not exist.")


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
    # TODO: To be improved; Efficiency; Whether it is good if there exist self loops.
    path_pair_nopl, path_pair_conpl, path_pair_varpl = {}, {}, {}
    conpl_units_ext = [u + "_plin" for u in conpl_units] + [
        u + "_plout" for u in conpl_units
    ]
    varpl_units_ext = [u + "_plin" for u in varpl_units] + [
        u + "_plout" for u in varpl_units
    ]
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
            elif n in varpl_units_ext:
                path_pair_varpl[n] = {"succ": succ_edge, "prev": prev_edge}
            else:
                path_pair_nopl[n] = {"succ": succ_edge, "prev": prev_edge}

    # Build a dictionary to find the original name of pipelined units. Used for latency variable and constraints.
    varpl_origin = {}
    for u in varpl_units:
        varpl_origin[u + "_plin"] = u
        varpl_origin[u + "_plout"] = u
        varpl_origin[(u + "_plin", u + "_plout")] = u

    # Prepare constant latencies for opt model
    Lu_con = {}
    for u in dfg_dict:
        if "_plin" in u:
            for e in dfg_edges_conpl:
                if u == e[0]:
                    Lu_con[e] = dfg_dict[u]["latency"]
                    break

    # Initialize model
    model = gp.Model()

    # Output variables of the model.
    Var_Rc = model.addVars(  # Insert non-tran buffer or not.
        dfg_edges_nopl,  # Exclude channels inside the pipelined units
        vtype=gp.GRB.BINARY,
        name="Rc",
    )

    Var_Nc = model.addVars(  # The buffer size. Rc = 0, Nc > 0 means transparent buffer.
        dfg_edges_nopl,  # Exclude channels inside the pipelined units
        vtype=gp.GRB.INTEGER,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Nc",
    )

    Var_plRc = model.addVars(  # Indicate whether the unit is pipelined
        varpl_units,
        vtype=gp.GRB.BINARY,
        name="plRc",
    )

    Lu_ub = 10  # Latency upbound.
    Lu = model.addVars(  # Pipelined unit latency. Indexed by pipelined units.
        varpl_units,
        vtype=gp.GRB.INTEGER,
        lb=0,
        ub=Lu_ub,
        name="Lu",
    )

    # Initiation interval.
    # TODO: Not used until I understand sometimes it is good to be larger when we could have minimized it.
    # II_ub = 2                           # Initiation interval upbound
    # II = model.addVars(                 # Pipelined unit initiation interval. Indexed by pipelined units.
    #     varpl_units,
    #     vtype=gp.GRB.INTEGER,
    #     lb=0,
    #     ub=II_ub,
    #     name='II',
    # )

    # Internal variables of the model.
    Var_Throughput = model.addVars(  # Throughput of each cfdfc
        CFDFC_NUM,
        vtype=gp.GRB.CONTINUOUS,
        lb=0.001,
        ub=1,
        name="Theta",
    )

    Var_Token = model.addVars(  # Average occupancy of channel c.
        dfg_edges,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Theta_1",
    )

    Var_Bubble = model.addVars(  # Average emptiness of channel c.
        dfg_edges_nopl,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Theta_0",
    )

    Var_Retiming = model.addVars(  # Fluid retiming of tokens across unit u.
        list(dfg_dict),
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="ru",
    )

    Var_Tin = model.addVars(  # Arrival time at the the input of channel c.
        dfg_edges,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Tin",
    )

    Var_Tout = model.addVars(  # Arrival time at the the output of channel c.
        dfg_edges,
        vtype=gp.GRB.CONTINUOUS,
        lb=0,
        ub=gp.GRB.INFINITY,
        name="Tout",
    )

    # Set Objective
    # TODO: Constant latency pipelined unit buffers not included, add it after optimization.
    Lambda = 1e-5  # Weight of total buffer size relative to throughputs
    Objective = gp.LinExpr()
    for i in range(CFDFC_NUM):  # Weighted sum of throughputs of cfdfcs
        Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])

    for e in dfg_edges_nopl:  # Not pipelined buffer size
        Objective.addTerms(-Lambda, Var_Nc[e])

    for e in multi_edges:  # Multiple edges between the same unit pair
        Objective.addTerms(-Lambda * multi_edges[e], Var_Nc[e])

    for (
        u
    ) in varpl_units:  # Pipelined buffer size. TODO: Complicated if II added.
        Objective.addTerms(-Lambda, Lu[u])

    model.setObjective(Objective, gp.GRB.MAXIMIZE)

    # Path timing constraints.

    # A buffer reset comb delay otherwise accumulate.
    PathConstr1 = model.addConstrs(
        (Var_Tout[e] >= Var_Tin[e] - CPmax * Var_Rc[e] for e in dfg_edges_nopl),
        name="PathConstr1",
    )

    # Since there must be no constraints here on constant pipelined units, we skip them

    PathConstr1_pl = model.addConstrs(
        (
            Var_Tout[e] >= Var_Tin[e] - CPmax * Var_plRc[varpl_origin[e]]
            for e in dfg_edges_varpl
        ),
        name="PathConstr1_pl",
    )
    # Clock period constraints.
    PathConstr2 = model.addConstrs(
        (Var_Tin[e] <= CP for e in dfg_edges),
        name="PathConstr2",
    )

    # Unit delay of not pipelined / constant pipelined / variable pipelined units.
    for pn in path_pair_nopl:
        for prev in path_pair_nopl[pn]["prev"]:
            for succ in path_pair_nopl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]),
                    name="PathConstr3_nopl",
                )

    for (
        pn
    ) in (
        path_pair_conpl
    ):  # Currently same as nopl but the model can be easily modified.
        for prev in path_pair_conpl[pn]["prev"]:
            for succ in path_pair_conpl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]),
                    name="PathConstr3_conpl",
                )

    for pn in path_pair_varpl:
        for prev in path_pair_varpl[pn]["prev"]:
            for succ in path_pair_varpl[pn]["succ"]:
                model.addConstr(
                    (
                        Var_Tin[succ] * (Lu[varpl_origin[pn]] + 1)
                        >= Var_Tout[prev] * (Lu[varpl_origin[pn]] + 1) +
                        # Delay already * 0.5 in dictionary generation
                        dfg_dict[pn]["delay"]
                        + dfg_dict[pn]["delay"] * Var_plRc[varpl_origin[pn]]
                    ),
                    name="PathConstr3_varpl",
                )

    # Throughput constraints.

    # Retiming constraints.
    ThroughputConstr1 = model.addConstrs(
        (
            Var_Token[e] == Bc[e] + Var_Retiming[e[1]] - Var_Retiming[e[0]]
            for e in dfg_edges
        ),
        name="ThroughputConstr1",
    )

    # CFDFC throughputs confined by channel throughputs in each cfdfc.
    # Split pipelined and not pipelined units so model can be easily modified.
    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1),
                name="ThroughputConstr2_nopl",
            )

    # Buffer sizing constraints.

    # Buffer size constraints.
    SizingConstr1 = model.addConstrs(
        (Var_Nc[e] == Var_Token[e] + Var_Bubble[e] for e in dfg_edges_nopl),
        name="SizingConstr1",
    )
    # Bubbles needed to avoid deadlocks.
    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1),
                name="SizingConstr2_nopl",
            )

    # Pipeline specific constraints.

    # If latency > 0, then it is pipelined (in optimal situation plRc = 1 if L = 1), and vice versa.
    PipelineConstr1 = model.addConstrs(
        (
            Var_plRc[varpl_origin[e]] <= Lu[varpl_origin[e]]
            for e in dfg_edges_varpl
        ),
        name="PipelineConstr1",
    )

    # Throughput constraints inside pipelined units. Including latency, and initiation interval (not applied now).
    for i in range(CFDFC_NUM):
        for e in cfdfcs_conpl[i]:
            model.addConstr(
                (Var_Throughput[i] * Lu_con[e] <= Var_Token[e]),
                name="PipelineConstr2_conpl",
            )
            model.addConstr(
                (Var_Token[e] <= Lu_con[e]),
                name="PipelineConstr3_conpl",
            )

        for e in cfdfcs_varpl[i]:
            model.addConstr(
                (Var_Throughput[i] * Lu[varpl_origin[e]] <= Var_Token[e]),
                name="PipelineConstr2_varpl",
            )
            model.addConstr(
                (Var_Token[e] <= Lu[varpl_origin[e]]),
                name="PipelineConstr3_varpl",
            )






    # TODO: This is just temporary.
    ExtraConstr = model.addConstrs(
        (Var_Nc[e] >= Var_Rc[e] for e in dfg_edges_nopl),
        name="ExtraConstr",
    )


    # model.setParam(gp.GRB.Param.PoolSolutions, 2)
    # model.setParam(gp.GRB.Param.PoolGap, 0)
    # model.setParam(gp.GRB.Param.PoolSearchMode, 2)  
    # model.setParam('OptimalityTol', 1e-9)
    model.setParam('MIPGap', 1e-5)


    # File name to record model and results
    record_key = date + "_" + benchmark + "_" + str(to_pl) + "_" + str(CP)

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
        slots = int(Var_Nc[e].x)
        type_ = "oehb" if Var_Rc[e].x == 1 else "tehb"
        # TODO: Function not verified
        for i in dfg[pred][succ]:
            outid = int(dfg[pred][succ][i]["from"].replace("out", "")) - 1
            # a HACK for inverted output channels of the mc_load port (and perhaps
            # also lsq_load ports) in MILR convention vs in DOT convention.
            if outid == 0 and "mc_load" in pred:
                outid = 1
            if slots >= 1 and (("start" not in pred) and ("return" not in pred)):
                # cmd2 = f"--handshake-placebuffers-custom=pred={pred} outid={outid} slots=1 type=tehb"
                cmd1 = f"--handshake-placebuffers-custom=pred={pred} outid={outid} slots={slots} type=oehb"
                cmds.append(cmd1)
                # cmds.append(cmd2)
                # cmd = f"--handshake-placebuffers-custom=pred={pred} outid={outid} slots={slots} type={type_}"
                # cmds.append(cmd)

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

