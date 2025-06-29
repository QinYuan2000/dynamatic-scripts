#!/bin/bash

ROOT_DIR="z_compare"

SUBDIR_LIST="filelist_small2.lst"

RESULT_DIR="$ROOT_DIR/synth_result"
mkdir -p "$RESULT_DIR"

INTEG_NAMES=("integration-test" "integration-test0")

for project in "$ROOT_DIR"/*; do
    [ -d "$project" ] || continue
    project_name=$(basename "$project")
    
    if [ "$project_name" = "synth_result" ]; then
        continue
    fi

    PROJECT_RESULT_DIR="$RESULT_DIR/$project_name"
    mkdir -p "$PROJECT_RESULT_DIR/slack" "$PROJECT_RESULT_DIR/LUT" "$PROJECT_RESULT_DIR/Reg"
    
    for integ in "${INTEG_NAMES[@]}"; do
        > "$PROJECT_RESULT_DIR/slack/${integ}.txt"
        > "$PROJECT_RESULT_DIR/LUT/${integ}.txt"
        > "$PROJECT_RESULT_DIR/Reg/${integ}.txt"
    done

    for integ in "${INTEG_NAMES[@]}"; do
        INTEG_DIR="$project/$integ"
        if [ ! -d "$INTEG_DIR" ]; then
            echo "Warning: $INTEG_DIR doesn't exist, skip..."
            continue
        fi

        while IFS= read -r sub_path || [ -n "$sub_path" ]; do
            TIMING_FILE="$INTEG_DIR/$sub_path/out/synth/timing_post_syn.rpt"
            UTIL_FILE="$INTEG_DIR/$sub_path/out/synth/utilization_post_syn.rpt"

            if [ -f "$TIMING_FILE" ] && [ -f "$UTIL_FILE" ]; then
                SLACK=$(grep "^Slack" "$TIMING_FILE" | head -n 1 | grep -o -E "[+-]?[0-9]+\.[0-9]+ns")
                
                LUT=$(grep -E '^.+Slice LUTs' "$UTIL_FILE" | head -n 1 | grep -o -E "[0-9]+" | head -n 1)
                
                REG=$(grep "Slice Registers" "$UTIL_FILE" | head -n 1 | grep -o -E "[0-9]+" | head -n 1)
                
                echo "$sub_path $SLACK" >> "$PROJECT_RESULT_DIR/slack/${integ}.txt"
                echo "$sub_path $LUT"   >> "$PROJECT_RESULT_DIR/LUT/${integ}.txt"
                echo "$sub_path $REG"   >> "$PROJECT_RESULT_DIR/Reg/${integ}.txt"
                
                echo "[$integ] $sub_path : Slack=$SLACK, LUT=$LUT, Reg=$REG"
            else
                echo "Warning: file doesn't exist: $TIMING_FILE or $UTIL_FILE"
            fi
        done < "$SUBDIR_LIST"
    done
done

rm -rf z_compare/synth_result/result