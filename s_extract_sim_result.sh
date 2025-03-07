#!/bin/sh
BASE_PATH="/home/yuaqin/dynamatic-scripts/z_compare"
TARGET_DIR="fpga20-verilog-6ns"
TARGET_PATH="${BASE_PATH}/${TARGET_DIR}"
if [ ! -d "${TARGET_PATH}" ]; then
    echo "Error: directory ${TARGET_PATH} does not exist!"
    exit 1
fi
RESULT_DIR="${BASE_PATH}/result"
mkdir -p "${RESULT_DIR}"
base_name=$(echo "$TARGET_DIR" | sed 's/[0-9]*$//')
output_file_integration="${RESULT_DIR}/sim-${base_name}.txt"
> "${output_file_integration}"
process_benchmark() {
    bench_dir="$1"
    bench_name="$2"
    output_file="$3"
    if [ ! -d "${bench_dir}/out" ]; then
        return
    fi
    report_file="${bench_dir}/out/sim/report.txt"
    if [ ! -f "${report_file}" ]; then
        echo "${bench_name} simulation failed" >> "${output_file}"
        return
    fi
    note_line=$(grep -n "Note: simulation done!" "${report_file}" | head -n 1 | cut -d: -f1)
    if [ -z "${note_line}" ]; then
        echo "${bench_name} simulation failed" >> "${output_file}"
    else
        next_line_num=$((note_line + 1))
        sim_line=$(sed -n "${next_line_num}p" "${report_file}")
        echo "${sim_line}" >> "${output_file}"
    fi
}
if [ -d "${TARGET_PATH}/integration-test" ]; then
    for bench_dir in "${TARGET_PATH}/integration-test"/*; do
        [ -d "${bench_dir}" ] || continue
        bench_name=$(basename "${bench_dir}")
        if [ "${bench_name}" = "memory" ] || [ "${bench_name}" = "sharing" ]; then
            for sub_bench_dir in "${bench_dir}"/*; do
                [ -d "${sub_bench_dir}" ] || continue
                sub_bench_name=$(basename "${sub_bench_dir}")
                process_benchmark "${sub_bench_dir}" "${sub_bench_name}" "${output_file_integration}"
            done
        else
            process_benchmark "${bench_dir}" "${bench_name}" "${output_file_integration}"
        fi
    done
fi
output_file_integration0="${RESULT_DIR}/sim-${TARGET_DIR}-0.txt"
> "${output_file_integration0}"
if [ -d "${TARGET_PATH}/integration-test0" ]; then
    for bench_dir in "${TARGET_PATH}/integration-test0"/*; do
        [ -d "${bench_dir}" ] || continue
        bench_name=$(basename "${bench_dir}")
        if [ "${bench_name}" = "memory" ] || [ "${bench_name}" = "sharing" ]; then
            for sub_bench_dir in "${bench_dir}"/*; do
                [ -d "${sub_bench_dir}" ] || continue
                sub_bench_name=$(basename "${sub_bench_dir}")
                process_benchmark "${sub_bench_dir}" "${sub_bench_name}" "${output_file_integration0}"
            done
        else
            process_benchmark "${bench_dir}" "${bench_name}" "${output_file_integration0}"
        fi
    done
fi