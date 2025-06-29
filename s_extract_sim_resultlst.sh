#!/bin/sh
BASE_PATH="/home/yuaqin/dynamatic-scripts/z_compare"
TARGET_DIRS="costaware-vhdl-6ns costaware-verilog-6ns"
FILELIST="filelist_small2.lst"

RESULT_DIR="${BASE_PATH}/result"
mkdir -p "${RESULT_DIR}"

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
        # Replace /tb with /<bench_name>_wrapper_tb
        sim_line_with_name=$(echo "$sim_line" | sed "s|Instance: /tb|Instance: /${bench_name}_wrapper_tb|")
        echo "$sim_line_with_name" >> "${output_file}"
    fi
}

for TARGET_DIR in ${TARGET_DIRS}; do
    TARGET_PATH="${BASE_PATH}/${TARGET_DIR}"
    if [ ! -d "${TARGET_PATH}" ]; then
        echo "Error: directory ${TARGET_PATH} does not exist!"
        exit 1
    fi

    base_name=$(echo "$TARGET_DIR" | sed 's/[0-9]*$//')
    output_file_integration="${RESULT_DIR}/sim-${base_name}.txt"
    > "${output_file_integration}"
    
    if [ -d "${TARGET_PATH}/integration-test" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            bench_dir="${TARGET_PATH}/integration-test/${line}"
            if [ -d "${bench_dir}" ]; then
                bench_name=$(basename "${bench_dir}")
                process_benchmark "${bench_dir}" "${bench_name}" "${output_file_integration}"
            fi
        done < "${FILELIST}"
    fi

    output_file_integration0="${RESULT_DIR}/sim-${TARGET_DIR}-0.txt"
    > "${output_file_integration0}"
    if [ -d "${TARGET_PATH}/integration-test0" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            bench_dir="${TARGET_PATH}/integration-test0/${line}"
            if [ -d "${bench_dir}" ]; then
                bench_name=$(basename "${bench_dir}")
                process_benchmark "${bench_dir}" "${bench_name}" "${output_file_integration0}"
            fi
        done < "${FILELIST}"
    fi
done