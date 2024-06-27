#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp
import subprocess
import networkx as nx
import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch
import random


date = "May_22"           # Date for output files in 'gurobi_out'

def draw_graph(graph,num):
    pos = nx.nx_agraph.graphviz_layout(graph, prog='neato')
    plt.figure(figsize=(12, 8))
    

    nx.draw_networkx_nodes(graph, pos, node_color='lightblue', node_size=200)
    nx.draw_networkx_labels(graph, pos)


    rad_increment = 0.1
    default_rad = 0.3
    edge_rads = {}
    for (u, v, data) in graph.edges(data=True):
        if (v, u) in edge_rads:
            edge_rads[(u, v)] = -edge_rads[(v, u)]
        else:
            edge_rads[(u, v)] = default_rad + random.uniform(-rad_increment, rad_increment)
    
    for (u, v) in graph.edges():
        edge = FancyArrowPatch(pos[u], pos[v], arrowstyle='-|>', color='k', mutation_scale=30, connectionstyle=f'arc3,rad={edge_rads[(u, v)]}', linestyle='-', linewidth=2)
        plt.gca().add_patch(edge)

    plt.axis('off')
    plt.savefig("cfc" + str(num) + ".png")
    plt.close()

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

    cfdfcs = dfg.generate_cfdfcs()
    for i,cfc in enumerate(cfdfcs):
        draw_graph(cfc,i)