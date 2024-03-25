#!/usr/bin/env python3

from dhls_utils import *
from pathlib import Path
import subprocess
import re


if __name__ == "__main__":
    benchmark_directory = Path("./dynamatic/integration-test")
    benchmark = "image_resize"  # Choose circuit benchmark.
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

    dfg_nodes = list(dfg.nodes())
    # In case some benchmarks have the start node named 'c'
    dfg_nodes = [node for node in dfg_nodes if len(node) > 1]
    # In case extsi23 is matched as extsi2, or similar things
    dfg_nodes.sort(key=len, reverse=True)
    file_path = f'dynamatic/integration-test/{benchmark}/out/comp/buffer-placement/{benchmark}/placement.log'
    pred_succ_pairs = {}
    duplicated_info_count = {}

    cmds = []
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        for i, line in enumerate(lines):
            pred = next((node for node in dfg_nodes if line.startswith(node)), None)
            if pred:
                rest_of_line = line[len(pred):].strip()
                succ = next((node for node in dfg_nodes if node in rest_of_line), None)
                if not succ:
                    raise ValueError("Succ not found in the line.")

                pred_succ_key = (pred, succ)
                if pred_succ_key in duplicated_info_count:
                    duplicated_info_count[pred_succ_key] = duplicated_info_count.get(pred_succ_key, 1) + 1
                    print(f"Duplicate information for {pred_succ_key} occurred {duplicated_info_count[pred_succ_key]} times.")
                    continue

                slots = None
                for j in range(i+1, min(i+9, len(lines))):
                    if 'decision:' in lines[j]:
                        slots_match = re.search(r'decision:\s*(\d+)', lines[j])
                        if slots_match:
                            slots = int(slots_match.group(1))
                            break
                if slots is None:
                    raise ValueError("Slots not found within the next 8 lines.")

                pred_succ_pairs[pred_succ_key] = slots

                for k in dfg[pred][succ]:
                    outid = int(dfg[pred][succ][k]["from"].replace("out", "")) - 1
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

    except FileNotFoundError:
        print(f"The file {file_path} does not exist.")


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

