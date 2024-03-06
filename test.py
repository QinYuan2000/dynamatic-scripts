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

    dfg_dict = {}               # Indexed by units
    for unit in dfg:
        dfg_dict[unit] = dfg.gen_dict(unit)
        #print("the latency of ", unit, "is", dfg.get_latency(unit))
        #print("the delay of ", unit, "is", dfg.get_delay(unit))


    cfdfcs = dfg.generate_cfdfcs()
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



    OPT_MODE = 0        # 0: Original Funciton; 1: New Function

    # Required Constants
    CFDFC_NUM = len(cfdfcs)
    CFDFC_Weight = np.ones(CFDFC_NUM)/CFDFC_NUM     # TODO: Now just assume equal weights
    Lambda = 0


    # Input constants of the model.
    # TODO: Each of them not completed and verified, especially the Bc 
    # "Merge" not found but kept here, 
    # Using "Fork" is to find ('fork3', 'mux2') but under debate
    CP = 4
    CPmax = 100
    Bc = {}                 # Indexed by edges
    for e in dfg.edges():
        Bc[e] = ((dfg_dict[e[0]]["bbID"] > dfg_dict[e[1]]["bbID"] and 
                dfg_dict[e[1]]["bbID"] != -1) or        # Here I initially choose != 0 to avoid
                                                        # things like 
                                                        # ('mc_load0', 'mem_controller0')
                                                        # ('mc_load1', 'mem_controller1')
                                                        # ('cond_br0', 'sink0')
                                                        # ('cond_br3', 'sink1') 
                                                        # to be set back edge
                                                        # But actually things like 
                                                        # ('mc_load0', 'mem_controller0') or
                                                        # ('mem_controller0', 'mc_load0') 
                                                        # looks like real back edges 
                                                        # but currently I cannot find them using the uniform way.
                (dfg_dict[e[0]]["bbID"] == dfg_dict[e[1]]["bbID"] and
                dfg_dict[e[0]]["type"] in ["Branch", "Fork"] and
                dfg_dict[e[1]]["type"] in ["Mux", "Merge", "CntrlMerge"])
                )
    # Du is represented by dfg_dict[unit]["delay"]


# This is to test Bc function
# for i in Bc:
#     if Bc[i] == True:
#         print(i)


    # Generate Channel pairs for path constraints
    # TODO: To be verified; Efficiency; Whether it is good if there exist self loops.
    path_pair = {}
    for n in dfg.nodes():
        succ_edge, prev_edge = [], []
        for e in dfg.edges():
            if e[0] == n:
                succ_edge.append(e)
            if e[1] == n:
                prev_edge.append(e)
        if len(succ_edge) and len(prev_edge):
            path_pair[n] = {"succ": succ_edge, "prev": prev_edge}
            

    model = gp.Model()

    # Output variables of the model.
    Var_Rc = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.BINARY, 
        name='Rc',
    )
    Var_Nc = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.INTEGER, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Nc',
    )
    

    # Internal variables of the model.
    Var_Throughput = model.addVars(
        CFDFC_NUM, 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=1, 
        name='Theta',
    )
    Var_Token = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_1',
    )
    Var_Bubble = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Theta_0',
    )
    Var_Retiming = model.addVars(
        list(dfg.nodes()), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='ru',
    )
    Var_Tin = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tin',
    )
    Var_Tout = model.addVars(
        list(dfg.edges()), 
        vtype=gp.GRB.CONTINUOUS, 
        lb=0, 
        ub=gp.GRB.INFINITY, 
        name='Tout',
    )


    # Set Objective
    Objective = gp.LinExpr()
    for i in range(CFDFC_NUM):
        Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])
    for e in dfg.edges():
        Objective.addTerms(-Lambda, Var_Nc[e])
    model.setObjective(Objective, gp.GRB.MAXIMIZE)


    # Path constraints.
    PathConstr1 = model.addConstrs(
        (Var_Tout[e] >= Var_Tin[e] - CPmax * Var_Rc[e] for e in dfg.edges()), 
        name='PathConstr1',
    )

    PathConstr2 = model.addConstrs(
        (Var_Tin[e] <= CP for e in dfg.edges()), 
        name='PathConstr2',
    )
    
    for pn in path_pair:
        for prev in path_pair[pn]["prev"]:
            for succ in path_pair[pn]["succ"]:
                model.addConstr(
                    (Var_Tin[succ] >= Var_Tout[prev] + dfg_dict[pn]["delay"]), 
                    name='PathConstr3',
                )


    # Throughput constraints.
    ThroughputConstr1 = model.addConstrs(
        (Var_Token[e] == Bc[e] + Var_Retiming[e[1]] - Var_Retiming[e[0]] for e in dfg.edges()), 
        name='ThroughputConstr1',
    )
    for i in range(CFDFC_NUM):
        for e in cfdfcs[i].edges():
            model.addConstr(
                (Var_Throughput[i] <= Var_Token[e] - Var_Rc[e] + 1 ), 
                name='ThroughputConstr2',
            )

    # Buffer sizing constraints.
    SizingConstr1 = model.addConstrs(
        (Var_Nc[e] == Var_Token[e] + Var_Bubble[e] for e in dfg.edges()), 
        name='SizingConstr1',
    )

    for i in range(CFDFC_NUM):
        for e in cfdfcs[i].edges():
            model.addConstr(
                (Var_Throughput[i] <= Var_Bubble[e] - Var_Rc[e] + 1 ), 
                name='SizingConstr2',
            )

    model.optimize()

#     vars_list = model.getVars()
#     for var in vars_list:
#         print(f"{var.VarName} {var.X:g}")


# for i in Var_Tout:
#     print(Var_Tout[i].X)

# for i in dfg_dict:
#     print(dfg_dict[i]["delay"])

# constr = model.getConstrByName('PathConstr3')
# constr.getAttr('LExpr')