#!/bin/sh

A="dynamatic/integration-test"
C="."

mkdir -p "$C"
OUTPUT_FILE="$C/fpl22result.txt"

for d in "$A"/*; do
    if [ -d "$d" ]; then
        B=$(basename "$d")
        LOG_FILE="$d/out/comp/buffer-placement/$B/placement.log"
        
        if [ -f "$LOG_FILE" ]; then
            awk -v name="$B" '
            {
                if (match($0, /([0-9]+) transparent slot\(s\) and ([0-9]+) opaque slot\(s\)/, arr)) {
                    num1 = arr[1] + 0;
                    num2 = arr[2] + 0;
                    if ((num1 > 1 && num2 >= 1) || (num2 > 1 && num1 >= 1)) {
                        print name " " $0;
                    }
                }
            }
            ' "$LOG_FILE" >> "$OUTPUT_FILE"
        fi
    fi
done