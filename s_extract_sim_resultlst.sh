#!/bin/sh
BASE_PATH="z_compare"
TARGET_DIRS="supGSA"
FILELIST="filelist2_all.lst"

RESULT_DIR="${BASE_PATH}/result"
mkdir -p "${RESULT_DIR}"

process_benchmark() {
    bench_dir="$1"
    bench_name="$2"
    output_file="$3"

    # Skip if benchmark output directory does not exist
    if [ ! -d "${bench_dir}/out" ]; then
        return
    fi

    report_file="${bench_dir}/out/sim/report.txt"
    if [ ! -f "${report_file}" ]; then
        echo "${bench_name} simulation failed (no report)" >> "${output_file}"
        return
    fi

    # Parse latency and verification status
    # Case 1: find "Note: Simulation done! Latency = N cycles"
    # Case 2: after that, look for "[INFO  HLS_VERIFIER] C and VHDL outputs match"
    # Result categories:
    #   OK        → both latency and verification line found
    #   NOVERIFY  → latency found but no verification line
    #   NOLATENCY → no latency line found
    res="$(
        awk '
        /Note: Simulation done! Latency = [0-9]+ cycles/ {
            if (!sim) {
                if (match($0, /Latency = ([0-9]+) cycles/, a)) {
                    latency=a[1]; sim=1
                }
            }
            next
        }
        sim && /\[INFO[[:space:]]+HLS_VERIFIER\][[:space:]]+C and VHDL outputs match/ {
            verified=1
        }
        END {
            if (sim && verified) {
                status="OK"
            } else if (sim && !verified) {
                status="NOVERIFY"
            } else {
                status="NOLATENCY"
            }
            print (latency ? latency : "") "|" status
        }' "${report_file}"
    )"

    latency="${res%%|*}"
    status="${res##*|}"

    case "$status" in
        OK)
            echo "${bench_name}: Latency = ${latency} cycles" >> "${output_file}"
            ;;
        NOVERIFY)
            if [ -n "${latency}" ]; then
                echo "${bench_name} verification failed (has latency ${latency} but no C/VHDL match)" >> "${output_file}"
            else
                echo "${bench_name} verification failed (no latency parsed)" >> "${output_file}"
            fi
            ;;
        NOLATENCY)
            echo "${bench_name} simulation failed (no latency)" >> "${output_file}"
            ;;
        *)
            echo "${bench_name} simulation failed (unknown status)" >> "${output_file}"
            ;;
    esac
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

    # Process integration-test benchmarks
    if [ -d "${TARGET_PATH}/integration-test" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            bench_dir="${TARGET_PATH}/integration-test/${line}"
            if [ -d "${bench_dir}" ]; then
                bench_name=$(basename "${bench_dir}")
                process_benchmark "${bench_dir}" "${bench_name}" "${output_file_integration}"
            fi
        done < "${FILELIST}"
    fi

    # Process integration-test0 benchmarks
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