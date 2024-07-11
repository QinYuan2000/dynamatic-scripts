#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import numpy as np
import gurobipy as gp
import subprocess


date = "Jul_10"           # Date for output files in 'gurobi_out'


if __name__ == "__main__":
    benchmark_directory = Path("./dynamatic/integration-test")
    # Choose circuit benchmark.
    benchmark = "bicg"  
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

    # cmds = [
    #     "--handshake-placebuffers-custom=pred=fork2 outid=1 slots=1 type=tehb",#
    #     "--handshake-placebuffers-custom=pred=fork3 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=fork3 outid=0 slots=1 type=oehb",
    #     "--handshake-placebuffers-custom=pred=fork4 outid=1 slots=1 type=oehb",#
    #     "--handshake-placebuffers-custom=pred=fork4 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=fork4 outid=0 slots=1 type=oehb",
    #     "--handshake-placebuffers-custom=pred=control_merge2 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=control_merge2 outid=0 slots=1 type=oehb",
    #     "--handshake-placebuffers-custom=pred=addi2 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=addi2 outid=0 slots=1 type=oehb",
    # ]
    # cmds = [
    #     "--handshake-placebuffers-custom=pred=mux3 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=fork2 outid=1 slots=1 type=tehb",#
    #     "--handshake-placebuffers-custom=pred=fork3 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=fork3 outid=0 slots=1 type=oehb",
    #     "--handshake-placebuffers-custom=pred=fork4 outid=0 slots=1 type=oehb",#
    #     "--handshake-placebuffers-custom=pred=fork6 outid=1 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=fork6 outid=1 slots=1 type=oehb",
    #     "--handshake-placebuffers-custom=pred=addi2 outid=0 slots=1 type=tehb",
    #     "--handshake-placebuffers-custom=pred=addi2 outid=0 slots=1 type=oehb",
    # ]
    cmds = [
        "--handshake-placebuffers-custom=pred=mux5 outid=0 slots=1 type=tehb",
        "--handshake-placebuffers-custom=pred=mux5 outid=0 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=fork3 outid=0 slots=1004 type=oehb",#
        "--handshake-placebuffers-custom=pred=extsi12 outid=0 slots=1004 type=oehb",#
        "--handshake-placebuffers-custom=pred=fork4 outid=1 slots=1005 type=oehb",#
        "--handshake-placebuffers-custom=pred=mux2 outid=0 slots=1 type=tehb",
        "--handshake-placebuffers-custom=pred=mux2 outid=0 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=mux6 outid=0 slots=1 type=tehb",
        "--handshake-placebuffers-custom=pred=mux6 outid=0 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=fork5 outid=2 slots=1004 type=oehb",#
        "--handshake-placebuffers-custom=pred=control_merge5 outid=0 slots=1 type=tehb",
        "--handshake-placebuffers-custom=pred=control_merge5 outid=0 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=fork6 outid=2 slots=1009 type=oehb",#
        "--handshake-placebuffers-custom=pred=fork11 outid=2 slots=1009 type=oehb",#
        "--handshake-placebuffers-custom=pred=extsi21 outid=0 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=fork14 outid=1 slots=1 type=oehb",
        "--handshake-placebuffers-custom=pred=addi7 outid=0 slots=1 type=oehb",
    ]



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

