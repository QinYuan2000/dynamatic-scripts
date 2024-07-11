#!/bin/bash

# which python3

# python3 -m pip list

# exit

benchmarks=("image_resize" "matrix" "gcd")
clock_period=6
if_synthesize=1


function process_dynamatic1() {
    local benchmark=$1
    local tag=$2
    local tag2=$3

    echo "set-dynamatic-path ./dynamatic" > run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-clock-period $clock_period" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-src ./dynamatic/integration-test/${benchmark}/${benchmark}.c" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "compile" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "write-hdl" >> run${tag}.sh
    echo "" >> run${tag}.sh
    # echo "simulate" >> run${tag}.sh
    # if [ "$if_synthesize" -eq 1 ]; then
    #     echo "" >> run${tag}.sh
    #     echo "synthesize" >> run${tag}.sh
    # fi
    # echo "" >> run${tag}.sh
    echo "exit" >> run${tag}.sh

    # Execute the Dynamatic script
    dynamatic/bin/dynamatic --run run${tag}.sh

    # # Process the output
    # next_line=false
    # while IFS= read -r line; do
    #     if $next_line; then
    #         echo "$line" >> output.txt
    #         break
    #     fi
    #     if [[ "$line" == "# ** Note: simulation done!" ]]; then
    #         next_line=true
    #     fi
    # done < "dynamatic/integration-test/${benchmark}/out/sim/report.txt"

    # rsync -av --delete dynamatic/integration-test/${benchmark}/out/ dynamatic/integration-test/${benchmark}/out${tag2}/

    # if [ "$if_synthesize" -eq 1 ]; then
    #     mkdir -p report/${benchmark}_$tag2
    #     cp dynamatic/integration-test/${benchmark}/out/synth/timing_post_syn.rpt report/${benchmark}_${tag2}/
    #     cp dynamatic/integration-test/${benchmark}/out/synth/utilization_post_syn.rpt report/${benchmark}_${tag2}/
    # fi
}

function process_dynamatic2() {
    local benchmark=$1
    local tag=$2

    echo "set-dynamatic-path ./dynamatic" > run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-src ./dynamatic/integration-test/${benchmark}/${benchmark}.c" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "write-hdl" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "exit" >> run${tag}.sh

    # Execute the Dynamatic script
    dynamatic/bin/dynamatic --run run${tag}.sh

    dynamatic/bin/export-dot "./dynamatic/integration-test/${benchmark}/out/comp/handshake_export.mlir" --mode=legacy --timing-models=./dynamatic/data/components.json > ./dynamatic/integration-test/${benchmark}/out/comp/${benchmark}.dot

    dot -Tpng "./dynamatic/integration-test/${benchmark}/out/comp/${benchmark}.dot" > "./dynamatic/integration-test/${benchmark}/out/comp/${benchmark}.png"
}

function process_dynamatic3() {
    local benchmark=$1
    local tag=$2
    local tag2=$3

    echo "set-dynamatic-path ./dynamatic" > run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-src ./dynamatic/integration-test/${benchmark}/${benchmark}.c" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "simulate" >> run${tag}.sh
    if [ "$if_synthesize" -eq 1 ]; then
        echo "" >> run${tag}.sh
        echo "synthesize" >> run${tag}.sh
    fi
    echo "" >> run${tag}.sh
    echo "exit" >> run${tag}.sh

    # Execute the Dynamatic script
    dynamatic/bin/dynamatic --run run${tag}.sh

    # Process the output
    next_line=false
    while IFS= read -r line; do
        if $next_line; then
            echo "$line" >> output.txt
            break
        fi
        if [[ "$line" == "# ** Note: simulation done!" ]]; then
            next_line=true
        fi
    done < "dynamatic/integration-test/${benchmark}/out/sim/report.txt"

    rsync -av --delete dynamatic/integration-test/${benchmark}/out/ dynamatic/integration-test/${benchmark}/out${tag2}/

    if [ "$if_synthesize" -eq 1 ]; then
        mkdir -p report/${benchmark}_$tag2
        cp dynamatic/integration-test/${benchmark}/out/synth/timing_post_syn.rpt report/${benchmark}_${tag2}/
        cp dynamatic/integration-test/${benchmark}/out/synth/utilization_post_syn.rpt report/${benchmark}_${tag2}/
    fi
}

function process_dynamatic4() {
    local benchmark=$1
    local tag=""
    echo "set-dynamatic-path ./dynamatic" > run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-clock-period $clock_period" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "set-src ./dynamatic/integration-test/${benchmark}/${benchmark}.c" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "compile" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "write-hdl" >> run${tag}.sh
    echo "" >> run${tag}.sh
    echo "exit" >> run${tag}.sh

    # Execute the Dynamatic script
    dynamatic/bin/dynamatic --run run.sh
}

# Function to update Python test scripts
function update_python_script() {
    local benchmark=$1
    local script_name=$2

    sed -i "s/benchmark = \".*\"/benchmark = \"$benchmark\"/" $script_name
    sed -i "s/CP = .*/CP = $clock_period/" $script_name
    python3 $script_name
}

function update_python_script2() {
    local benchmark=$1
    local script_name=$2

    sed -i "s/benchmark = \".*\"/benchmark = \"$benchmark\"/" $script_name
    python3 $script_name
}


# Iterate over each benchmark
for benchmark in "${benchmarks[@]}"; do
    process_dynamatic1 $benchmark "" "1"
    update_python_script $benchmark "test1.py"
    process_dynamatic2 $benchmark "2"
    update_python_script2 $benchmark "revise_vhdl.py"
    process_dynamatic3 $benchmark "3" "2"
    # process_dynamatic4 $benchmark
    # update_python_script $benchmark "test2.py"
    # process_dynamatic2 $benchmark "2"
    # # update_python_script2 $benchmark "revise_vhdl.py"
    # process_dynamatic3 $benchmark "3" "3"
done
