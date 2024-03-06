import numpy as np
import scipy.io as sio
import matplotlib.pyplot as plt
import gurobipy as gp

MODE = 0        # 0: Original Funciton; 1: New Function

# Required Constants
# TODO: Wait to be connected to previous steps.
UNIT_NUM = 1000
CHANNEL_NUM = 10000
CFDFC_NUM = 10
CFDFC_Weight = np.zeros(CFDFC_NUM)
CFDFC_Channel_Match = np.zeros((CFDFC_NUM, CHANNEL_NUM))    # If not match, set 1, otherwise set 0
Unit_at_End = np.zeros(CHANNEL_NUM)        # Based on CHANNEL index
Unit_at_Start = np.zeros(CHANNEL_NUM)      # Based on CHANNEL index
Lambda = 1e-5


# Input constants of the model.
# TODO: Wait to be connected to previous steps.
CP = 5000   #ns
CPmax = 1000000 #ns
Bc = np.zeros(CHANNEL_NUM)
Du = np.zeros(UNIT_NUM)


# Generate Channel pairs for path constraints
# TODO: I will do this when I know which types of data I can acquire directly
GenPath = np.array(10000)
PATH_NUM = 10000



MILP_Model = gp.Model()

# Output variables of the model.
Var_Rc = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.BINARY, name='Rc')
Var_Nc = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.INTEGER, lb=0, ub=gp.GRB.INFINITY, name='Nc')


# Internal variables of the model.
Var_Throughput = MILP_Model.addVars(CFDFC_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=1, name='Theta')
Var_Token = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=1, name='Theta_1')
Var_Bubble = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=gp.GRB.INFINITY, name='Theta_0')
Var_Retiming = MILP_Model.addVars(UNIT_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=1, name='ru')
Var_Tin = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=gp.GRB.INFINITY, name='Tin')
Var_Tout = MILP_Model.addVars(CHANNEL_NUM, vtype=gp.GRB.CONTINUOUS, lb=0, ub=gp.GRB.INFINITY, name='Tout')


# Set Objective
Objective = gp.LinExpr()
for i in range(CFDFC_NUM):
    Objective.addTerms(CFDFC_Weight[i], Var_Throughput[i])
for i in range(CHANNEL_NUM):
    Objective.addTerms(-Lambda, Var_Nc[i])
MILP_Model.setObjective(Objective, gp.GRB.MAXIMIZE)


# Path constraints.
PathConstr1 = MILP_Model.addConstrs((Var_Tout[i] >= Var_Tin[i] - CPmax * Var_Rc for i in range(CHANNEL_NUM)), name='PathConstr1')
# TODO: If it's necessary to exclude channels which are already at the end.
PathConstr2 = MILP_Model.addConstrs((Var_Tin[i] <= CP for i in range(CHANNEL_NUM)), name='PathConstr2')
# TODO: If it's okay to base on the index of Generated Paths.
PathConstr3 = MILP_Model.addConstrs((Var_Tin[GenPath[i]] >= Var_Tout[GenPath[i]] + Du[GenPath[i]] for i in range(PATH_NUM)), name='PathConstr3')


# Throughput constraints.
ThroughputConstr1 = MILP_Model.addConstrs((Var_Token[i] == Bc[i] + Var_Retiming[Unit_at_End[i]] - Var_Retiming[Unit_at_Start[i]] for i in range(CHANNEL_NUM)), name='ThroughputConstr1')
# TODO: It depends on which form of data I can acquire.
ThroughputConstr2 = MILP_Model.addConstrs((Var_Throughput[j] <= Var_Token[i] - Var_Rc[i] + 1 + CFDFC_Channel_Match[j, i] for i in range(CHANNEL_NUM) for j in range(CFDFC_NUM)), name='ThroughputConstr2')

# Buffer sizing constraints.
SizingConstr1 = MILP_Model.addConstrs((Var_Nc[i] == Var_Token[i] + Var_Bubble[i] for i in range(CHANNEL_NUM)), name='SizingConstr1')
SizingConstr2 = MILP_Model.addConstrs((Var_Throughput[j] <= Var_Bubble[i] - Var_Rc[i] + 1 + CFDFC_Channel_Match[j, i] for i in range(CHANNEL_NUM) for j in range(CFDFC_NUM)), name='SizingConstr2')


MILP_Model.optimize()

