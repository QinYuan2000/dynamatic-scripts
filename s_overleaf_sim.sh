#!/bin/bash

# Root directory (should contain many txt files)
ROOT_DIR="z_compare/result"

# Output Overleaf code file (will be created in ROOT_DIR)
OUTPUT_FILE="$ROOT_DIR/overleaf_code.txt"
> "$OUTPUT_FILE"  # Clear previous output

# Get all .txt files in ROOT_DIR (current directory only), excluding the generated overleaf_code.txt,
# and sort them alphabetically.
files=($(find "$ROOT_DIR" -maxdepth 1 -type f -name "*.txt" ! -name "overleaf_code.txt" | sort))
num_files=${#files[@]}
if (( num_files % 2 != 0 )); then
    echo "Warning: The number of txt files is odd; the last file will be ignored."
fi

# Process every two txt files as a group: first is "previous", second is "now"
for (( i=0; i<num_files-1; i+=2 )); do
    prev_file="${files[i]}"
    now_file="${files[i+1]}"

    # Extract title from the previous file name (expected format: sim-*-0.txt)
    base_prev=$(basename "$prev_file")
    title=$(echo "$base_prev" | sed -n 's/^sim-\(.*\)-0\.txt/\1/p')
    if [ -z "$title" ]; then
        title="Unknown"
    fi
    # Escape underscores in title for LaTeX
    escaped_title=$(echo "$title" | sed 's/_/\\_/g')

    # Declare associative arrays for storing extracted values
    declare -A prev_values
    declare -A now_values

    # Process the previous file (only lines starting with "#")
    while IFS= read -r line; do
        if [[ $line == \#* ]]; then
            key=$(echo "$line" | sed -n 's/.*Instance: \/\(.*\)_wrapper_tb.*/\1/p')
            if [ -n "$key" ]; then
                value=$(echo "$line" | sed -n 's/.*Time: \([0-9]\+\) ns.*/\1/p')
                prev_values["$key"]="$value"
            fi
        fi
    done < "$prev_file"

    # Process the now file
    while IFS= read -r line; do
        if [[ $line == \#* ]]; then
            key=$(echo "$line" | sed -n 's/.*Instance: \/\(.*\)_wrapper_tb.*/\1/p')
            if [ -n "$key" ]; then
                value=$(echo "$line" | sed -n 's/.*Time: \([0-9]\+\) ns.*/\1/p')
                now_values["$key"]="$value"
            fi
        fi
    done < "$now_file"

    # Create a sorted list of keys based on name
    sorted_keys=($(for k in "${!prev_values[@]}"; do echo "$k"; done | sort))

    # Generate the Overleaf table code for the current group
    {
      echo "\begin{table}[h]"
      echo "\centering"
      echo "\caption{${escaped_title}}"
      echo "\begin{tabular}{l c c}"
      echo "\hline"
      echo "benchmark & previous & now \\\\"
      echo "\hline"
      for key in "${sorted_keys[@]}"; do
          prev_val="${prev_values[$key]}"
          now_val="${now_values[$key]}"

          # Compare the two numbers and color them if they differ.
          if [ "$prev_val" -eq "$now_val" ]; then
              colored_prev="${prev_val}"
              colored_now="${now_val}"
          else
              diff=$(( prev_val > now_val ? prev_val - now_val : now_val - prev_val ))
              if [ "$prev_val" -gt "$now_val" ]; then
                  if [ "$diff" -le 10 ]; then
                      colored_prev="\\textcolor{paleRed}{$prev_val}"
                      colored_now="\\textcolor{paleGreen}{$now_val}"
                  else
                      colored_prev="\\textcolor{red}{$prev_val}"
                      colored_now="\\textcolor{green}{$now_val}"
                  fi
              else
                  if [ "$diff" -le 10 ]; then
                      colored_prev="\\textcolor{paleGreen}{$prev_val}"
                      colored_now="\\textcolor{paleRed}{$now_val}"
                  else
                      colored_prev="\\textcolor{green}{$prev_val}"
                      colored_now="\\textcolor{red}{$now_val}"
                  fi
              fi
          fi

          # Escape underscores in key for LaTeX
          escaped_key=$(echo "$key" | sed 's/_/\\_/g')
          echo "${escaped_key} & ${colored_prev} & ${colored_now} \\\\"
      done
      echo "\hline"
      echo "\end{tabular}"
      echo "\end{table}"
      echo ""
    } >> "$OUTPUT_FILE"

    # Clear associative arrays for the next group
    unset prev_values
    unset now_values
done