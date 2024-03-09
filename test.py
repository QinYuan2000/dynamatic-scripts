#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp


if __name__ == "__main__":
    benchmark_directory = Path("./dynamatic/integration-test")
    benchmark = "fir"                       # Choose circuit benchmark.

    dfg = DFG(                              # Generate dfg object from .dot file.
        AGraph(
            benchmark_directory
            / benchmark
            / "out"
            / "comp"
            / (benchmark + ".dot"),
            strict=False,
            directed=True,
        )
    )
    
    # Remove mem_controllers node and edges from dfg graph 
    to_remove = []
    for n in dfg.nodes():
        if "mem_controller" in n:
            to_remove.append(n)

    for i in to_remove:
        dfg.remove_nodes_from([i])


    # Create datasheet for dfg

    # If delay longer than to_pl, we pipeline the unit
    to_pl = 1
    pl_units = []                   # Pipelined unit
    conpl_units = []                # Constant latency pipelined units, latency already shown in dot file
    varpl_units = []                # Variable latency pipelined units, which have long delays
    dfg_dict = {}                   # DFG datasheet indexed by units
    # Here pipelined units will be splitted to two nodes and a channel connecting them. 
    # Relation to previous and successor nodes unchanged.
    for unit in dfg:
        if dfg.get_latency(unit) > 0:
            dfg_dict[unit + '_plin'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plout'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plin']['delay']
            dfg_dict[unit + '_plout']['delay']
            conpl_units.append(unit)
            pl_units.append(unit)

        elif dfg.get_delay(unit) > to_pl:
            dfg_dict[unit + '_plin'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plout'] = dfg.gen_dict(unit)
            varpl_units.append(unit)
            pl_units.append(unit)
            
        else:
            dfg_dict[unit] = dfg.gen_dict(unit)
        # print("the latency of ", unit, "is", dfg.get_latency(unit))
        # print("the delay of ", unit, "is", dfg.get_delay(unit))


    # Gain four types of channel list
    # Total / exclude channels in pipeline / constant latency pipeline / variable latency pipeline
    dfg_edges = list(dfg.edges())
    dfg_edges_nopl = list(dfg.edges())
    dfg_edges_conpl, dfg_edges_varpl = [], []
    for i, e in enumerate(dfg_edges):
        if e[0] in pl_units and e[1] in pl_units:
            dfg_edges[i] = (e[0] + '_plout', e[1] + '_plin')
            dfg_edges_nopl[i] = (e[0] + '_plout', e[1] + '_plin')

        elif e[0] in pl_units:
            dfg_edges[i] = (e[0] + '_plout', e[1])
            dfg_edges_nopl[i] = (e[0] + '_plout', e[1])

        elif e[1] in pl_units:
            dfg_edges[i] = (e[0], e[1] + '_plin')
            dfg_edges_nopl[i] = (e[0], e[1] + '_plin')

    # for u in pl_units:
    #     dfg_edges.append( (u + '_plin', u + '_plout') )

    for u in conpl_units:
        dfg_edges.append( (u + '_plin', u + '_plout') )
        dfg_edges_conpl.append( (u + '_plin', u + '_plout') ) 

    for u in varpl_units:
        dfg_edges.append( (u + '_plin', u + '_plout') )
        dfg_edges_varpl.append( (u + '_plin', u + '_plout') )


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
                cfdfc_nopl[i] = (e[0] + '_plout', e[1] + '_plin')

            elif e[0] in pl_units:
                cfdfc_nopl[i] = (e[0] + '_plout', e[1])

            elif e[1] in pl_units:
                cfdfc_nopl[i] = (e[0], e[1] + '_plin')

        for u in cfc.nodes():
            if u in conpl_units:
                cfdfc_conpl.append( (u + '_plin', u + '_plout') )

            if u in varpl_units:
                cfdfc_varpl.append( (u + '_plin', u + '_plout') )

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
    CFDFC_NUM = len(cfdfcs)
    CFDFC_Weight = np.ones(CFDFC_NUM)/CFDFC_NUM     # TODO: Now just assume equal weights


    # Set input constants of the model.
    # TODO: Each of them not completed and verified, especially the Bc 
    CP = 4
    CPmax = 100
    Bc = {}                 # Whether it is the back edge, indexed by edges
    for e in dfg_edges:
        Bc[e] = ((dfg_dict[e[0]]["bbID"] > dfg_dict[e[1]]["bbID"] and 
                dfg_dict[e[1]]["bbID"] != 0) or                             # To exclude sinks    
                (dfg_dict[e[0]]["bbID"] == dfg_dict[e[1]]["bbID"] and
                dfg_dict[e[0]]["type"] in ["Branch"] and
                dfg_dict[e[1]]["type"] in ["Mux", "Merge", "CntrlMerge"])   # "Merge" not found but kept here, 
                )
    # And unit delays are represented by dfg_dict[unit]["delay"]

# This is to test Bc function
# for i in Bc:
#     if Bc[i] == True:
#         print(i)


    # Generate neighbouring channel pairs for path timing constraints.
    # Split in three ways, since the delay of pipelined units can be different fuctions.
    # TODO: To be improved; Efficiency; Whether it is good if there exist self loops.
    path_pair_nopl, path_pair_conpl, path_pair_varpl = {}, {}, {}
    conpl_units_ext = [ u + '_plin' for u in conpl_units ] + [ u + '_plout' for u in conpl_units ]
    varpl_units_ext = [ u + '_plin' for u in varpl_units ] + [ u + '_plout' for u in varpl_units ]
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
        varpl_origin[u + '_plin'] = u
        varpl_origin[u + '_plout'] = u
        varpl_origin[(u + '_plin', u + '_plout')] = u


    # Prepare constant latencies for opt model
    Lu_con = {}
    for u in dfg_dict:
        if '_plin' in u:
            for e in dfg_edges_conpl:
                if u == e[0]:
                    Lu_con[e] = dfg_dict[u]['latency']
                    break


    # Initialize model
    model = gp.Model()


    # Output variables of the model.
    Var_Rc = model.addVars(             # Insert non-tran buffer or not.
        dfg_edges, 
        vtype=gp.GRB.BINARY, 
        name='Rc',
    )

    Var_Nc = model.addVars(             # The buffer size. Rc = 0, Nc > 0 means transparent buffer.
        dfg_edges, 
        vtype=gp.GRB.INTEGER, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Nc',
    )
    
    Lu_ub = 100                         # Latency upbound.
    Lu = model.addVars(                 # Pipelined unit latency. Indexed by pipelined units.
        varpl_units, 
        vtype=gp.GRB.INTEGER, 
        lb=0, 
        ub=Lu_ub, 
        name='Lu',
    )

    # TODO: Not used until I understand sometimes it is good to be larger when we could have minimized it
    # II_ub = 2                           # Initiation interval upbound
    # II = model.addVars(                 # Pipelined unit initiation interval. Indexed by pipelined units.
    #     varpl_units, 
    #     vtype=gp.GRB.INTEGER, 
    #     lb=0, 
    #     ub=II_ub, 
    #     name='II',
    # )


    # Internal variables of the model.
    Var_Throughput = model.addVars(     # Throughput of each cfdfc
        CFDFC_NUM, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=1, 
        name='Theta',
    )

    Var_Token = model.addVars(          # Average occupancy of channel c.
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_1',
    )

    Var_Bubble = model.addVars(         # Average emptiness of channel c.
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_0',
    )

    Var_Retiming = model.addVars(       # Fluid retiming of tokens across unit u.
        list(dfg_dict), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='ru',
    )

    Var_Tin = model.addVars(            # Arrival time at the the input of channel c.
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tin',
    )

    Var_Tout = model.addVars(           # Arrival time at the the output of channel c.
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tout',
    )


    # Set Objective
    Lambda = 1e-5                       # Weight of total buffer size relative to throughputs
    Objective = gp.LinExpr()
    for i in range(CFDFC_NUM):          # Weighted sum of throughputs of cfdfcs
        Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])
    for e in dfg_edges:                 # Total buffer size
        Objective.addTerms(-Lambda, Var_Nc[e])
    model.setObjective(Objective, gp.GRB.MAXIMIZE)


    # Path timing constraints.

    # A buffer reset comb delay otherwise accumulate.
    PathConstr1 = model.addConstrs(
        (Var_Tout[e] >= Var_Tin[e] - CPmax * Var_Rc[e] for e in dfg_edges), 
        name='PathConstr1',
    )

    # Clock period constraints.
    PathConstr2 = model.addConstrs(
        (Var_Tin[e] <= CP for e in dfg_edges), 
        name='PathConstr2',
    )
    
    # Unit delay of not pipelined / constant pipelined / variable pipelined units.
    for pn in path_pair_nopl:
        for prev in path_pair_nopl[pn]["prev"]:
            for succ in path_pair_nopl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]), 
                    name='PathConstr3_nopl',
                )

    for pn in path_pair_conpl:                              # Currently same as nopl but the model can change later.
        for prev in path_pair_conpl[pn]["prev"]:
            for succ in path_pair_conpl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]), 
                    name='PathConstr3_conpl',
                )

    for pn in path_pair_varpl:
        for prev in path_pair_varpl[pn]["prev"]:
            for succ in path_pair_varpl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] * (Lu[varpl_origin[pn]] + 1) >= Var_Tout[prev] * (Lu[varpl_origin[pn]] + 1) + dfg_dict[pn]["delay"]), 
                    name='PathConstr3_varpl',
                )


    # Throughput constraints.

    # Retiming constraints.
    ThroughputConstr1 = model.addConstrs(
        (Var_Token[e] == Bc[e] + Var_Retiming[e[1]] - Var_Retiming[e[0]] for e in dfg_edges), 
        name='ThroughputConstr1',
    )

    # CFDFC throughputs confined by channel throughputs in each cfdfc.
    # Split pipelined and not pipelined units so model can be easily modified.
    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1), 
                name='ThroughputConstr2_nopl',
            )

        for e in cfdfcs_conpl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1), 
                name='ThroughputConstr2_conpl',
            )

        # TODO: Should we change it to Lu >= Rc ?
        for e in cfdfcs_varpl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1), 
                name='ThroughputConstr2_varpl',
            )


    # Buffer sizing constraints.

    # Buffer size constraints.
    SizingConstr1 = model.addConstrs(
        (Var_Nc[e] == Var_Token[e] + Var_Bubble[e] for e in dfg_edges), 
        name='SizingConstr1',
    )

    # Bubbles needed to avoid deadlocks.
    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1), 
                name='SizingConstr2_nopl',
            )

        for e in cfdfcs_conpl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1), 
                name='SizingConstr2_conpl',
            )

        for e in cfdfcs_varpl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1), 
                name='SizingConstr2_varpl',
            )


    # Pipeline specific constraints.

    # Constant pipelined units must have buffers.
    PipelineConstr1 = model.addConstrs((Var_Rc[e] == 1 for e in dfg_edges_conpl), name='PipelineConstr1')
    
    # Throughput constraints inside pipelined units. Including latency, and initiation interval (not applied now).
    for i in range(CFDFC_NUM):
        for e in cfdfcs_conpl[i]:
            model.addConstr(
                (Var_Throughput[i] * Lu_con[e] <= Var_Token[e]), 
                name='PipelineConstr2_conpl',
            )
            model.addConstr(
                (Var_Token[e] <= Lu_con[e]), 
                name='PipelineConstr3_conpl',
            )

        for e in cfdfcs_varpl[i]:
            model.addConstr(
                (Var_Throughput[i] * Lu[varpl_origin[e]] <= Var_Token[e]), 
                name='PipelineConstr2_varpl',
            )
            model.addConstr(
                (Var_Token[e] <= Lu[varpl_origin[e]]), 
                name='PipelineConstr3_varpl',
            )


    # Run solver.
    model.optimize()

    # File name to record model and results
    record_key = '_Mar09_1'

    # View constraints in this file.
    model.write("gurobi_out/model" + record_key + ".lp")

    # View solutions and results in this file.
    with open("gurobi_out/solution" + record_key + ".txt", "w") as f:
        f.write('Optimal solution:\n')
        for v in model.getVars():
            f.write(f'{v.VarName} = {v.x}\n')
        f.write(f'Objective value: {model.objVal}\n')

# Some testing codes.
#     vars_list = model.getVars()
#     for var in vars_list:
#         print(f"{var.VarName} {var.X:g}")

# for i in Var_Nc:
#     print(Var_Nc[i].X)

# for i in dfg_dict:
#     print(dfg_dict[i]["delay"])

# constr = model.getConstrByName('PathConstr3')
# constr.getAttr('LExpr')


# for n in dfg_dict:
#     if dfg_dict[n]["latency"] > 0:
#         print(n)
#         print(dfg_dict[n]["type"])
#         print(dfg_dict[n]["latency"])
