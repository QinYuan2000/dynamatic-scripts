#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp


if __name__ == "__main__":
    benchmark_directory = Path("./dynamatic/integration-test")
    benchmark = "fir"

    dfg = DFG(
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
    
    # Remove mem_controllers
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
    conpl_units = []                # Constant latency pipelined unit
    varpl_units = []                # Variable latency pipelined unit
    dfg_dict = {}                   # DFG datasheet indexed by units
    for unit in dfg:
        if dfg.get_latency(unit) > 0:
            dfg_dict[unit + '_plin'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plout'] = dfg.gen_dict(unit)
            conpl_units.append(unit)
            pl_units.append(unit)

        elif dfg.get_delay(unit) > to_pl:
            dfg_dict[unit + '_plin'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plout'] = dfg.gen_dict(unit)
            dfg_dict[unit + '_plin']['delay'] /= 2
            dfg_dict[unit + '_plout']['delay'] /= 2
            varpl_units.append(unit)
            pl_units.append(unit)
            
        else:
            dfg_dict[unit] = dfg.gen_dict(unit)
        # print("the latency of ", unit, "is", dfg.get_latency(unit))
        # print("the delay of ", unit, "is", dfg.get_delay(unit))



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

    # Required Constants
    CFDFC_NUM = len(cfdfcs)
    CFDFC_Weight = np.ones(CFDFC_NUM)/CFDFC_NUM     # TODO: Now just assume equal weights


    # Input constants of the model.
    # TODO: Each of them not completed and verified, especially the Bc 
    # "Merge" not found but kept here, 
    CP = 3
    CPmax = 100
    Bc = {}                 # Indexed by edges
    for e in dfg_edges:
        Bc[e] = ((dfg_dict[e[0]]["bbID"] > dfg_dict[e[1]]["bbID"] and 
                dfg_dict[e[1]]["bbID"] != 0) or                         # Exclude sinks    
                (dfg_dict[e[0]]["bbID"] == dfg_dict[e[1]]["bbID"] and
                dfg_dict[e[0]]["type"] in ["Branch"] and
                dfg_dict[e[1]]["type"] in ["Mux", "Merge", "CntrlMerge"])
                )
    # And unit delays are represented by dfg_dict[unit]["delay"]

# This is to test Bc function
# for i in Bc:
#     if Bc[i] == True:
#         print(i)


    # Generate channel pairs for path constraints
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


    varpl_origin = {}
    for u in varpl_units:
        varpl_origin[u + '_plin'] = u
        varpl_origin[u + '_plout'] = u
        varpl_origin[(u + '_plin', u + '_plout')] = u

            
    Lu_con = {}
    for u in dfg_dict:
        if '_plin' in u:
            for e in dfg_edges_conpl:
                if u == e[0]:
                    Lu_con[e] = dfg_dict[u]['latency']
                    break


    model = gp.Model()

    # Output variables of the model.
    Var_Rc = model.addVars(
        dfg_edges_nopl, 
        vtype=gp.GRB.BINARY, 
        name='Rc',
    )

    Var_Nc = model.addVars(
        dfg_edges_nopl, 
        vtype=gp.GRB.INTEGER, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Nc',
    )

    Var_plRc = model.addVars(
        varpl_units, 
        vtype=gp.GRB.BINARY, 
        name='plRc',
    )
    
    Lu_ub = 10
    Lu = model.addVars(                 # Indexed by pipelined units
        varpl_units, 
        vtype=gp.GRB.INTEGER, 
        lb=0, 
        ub=Lu_ub, 
        name='Lu',
    )

    # TODO: Not used until I understand sometimes it is good to be larger when we could have minimized it
    # II_ub = 2
    # II = model.addVars(                 # Indexed by pipelined channels
    #     dfg_edges_varpl, 
    #     vtype=gp.GRB.INTEGER, 
    #     lb=0, 
    #     ub=II_ub, 
    #     name='II',
    # )


    # Internal variables of the model.
    Var_Throughput = model.addVars(
        CFDFC_NUM, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=1, 
        name='Theta',
    )

    Var_Token = model.addVars(
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_1',
    )

    Var_Bubble = model.addVars(
        dfg_edges_nopl, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_0',
    )

    Var_Retiming = model.addVars(
        list(dfg_dict), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='ru',
    )

    Var_Tin = model.addVars(
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tin',
    )

    Var_Tout = model.addVars(
        dfg_edges, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tout',
    )


    # Set Objective
    # TODO: Pipelined unit buffers not included
    Lambda = 1e-5
    Objective = gp.LinExpr()
    for i in range(CFDFC_NUM):
        Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])

    for e in dfg_edges_nopl:
        Objective.addTerms(-Lambda, Var_Nc[e])
    model.setObjective(Objective, gp.GRB.MAXIMIZE)



    # Path constraints.
    PathConstr1 = model.addConstrs(
        (Var_Tout[e] >= Var_Tin[e] - CPmax * Var_Rc[e] for e in dfg_edges_nopl), 
        name='PathConstr1',
    )

    # Since there must be no constraints here on constant pipelined units, we skip them

    PathConstr1_pl = model.addConstrs(
        (Var_Tout[e] >= Var_Tin[e] - CPmax * Var_plRc[varpl_origin[e]] for e in dfg_edges_varpl), 
        name='PathConstr1_pl',
    )

    PathConstr2 = model.addConstrs(
        (Var_Tin[e] <= CP for e in dfg_edges), 
        name='PathConstr2',
    )
    
    for pn in path_pair_nopl:
        for prev in path_pair_nopl[pn]["prev"]:
            for succ in path_pair_nopl[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]), 
                    name='PathConstr3_nopl',
                )

    for pn in path_pair_conpl:                              # Currently same as nopl but the model can be easily modified.
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
                    (Var_Tin[succ] * (Lu[varpl_origin[pn]] + 1) >= 
                    Var_Tout[prev] * (Lu[varpl_origin[pn]] + 1) + 
                    # Delay already * 0.5 in dictionary generation
                    dfg_dict[pn]["delay"] + dfg_dict[pn]["delay"] * Var_plRc[varpl_origin[pn]]        
                    ),         
                    name='PathConstr3_varpl',
                )


    # Throughput constraints.
    ThroughputConstr1 = model.addConstrs(
        (Var_Token[e] == Bc[e] + Var_Retiming[e[1]] - Var_Retiming[e[0]] for e in dfg_edges), 
        name='ThroughputConstr1',
    )

    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1), 
                name='ThroughputConstr2_nopl',
            )



    # Buffer sizing constraints.
    SizingConstr1 = model.addConstrs(
        (Var_Nc[e] == Var_Token[e] + Var_Bubble[e] for e in dfg_edges_nopl), 
        name='SizingConstr1',
    )

    for i in range(CFDFC_NUM):
        for e in cfdfcs_nopl[i]:
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1), 
                name='SizingConstr2_nopl',
            )

  

    # Pipeline specific constraints.
    PipelineConstr1 = model.addConstrs((Var_plRc[varpl_origin[e]] <= Lu[varpl_origin[e]] for e in dfg_edges_varpl), name='PipelineConstr1')
    
    
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


    model.optimize()

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
