#!/bin/bash

# Root directory containing table folders.
ROOT_DIR="z_compare/synth_result"

# Output Overleaf code file (will be created in ROOT_DIR)
OUTPUT_FILE="$ROOT_DIR/overleaf_code.txt"
> "$OUTPUT_FILE"  # Clear previous output

# Process each subdirectory (each table)
for table_dir in "$ROOT_DIR"/*; do
    [ -d "$table_dir" ] || continue
    table_name=$(basename "$table_dir")
    # Escape underscores in table name for LaTeX
    escaped_table_name=$(echo "$table_name" | sed 's/_/\\_/g')
    echo "Processing table: $table_name"

    # Declare associative arrays for storing values for each category (LUT, Reg, slack)
    declare -A lut_now lut_prev reg_now reg_prev slack_now slack_prev

    # Process each category folder ("LUT", "Reg", "slack")
    for category in LUT Reg slack; do
        category_dir="$table_dir/$category"
        if [ ! -d "$category_dir" ]; then
            echo "Warning: Directory $category_dir does not exist; skipping."
            continue
        fi
        # Get txt files sorted alphabetically; expect exactly 2 files.
        files=($(find "$category_dir" -maxdepth 1 -type f -name "*.txt" | sort))
        if [ ${#files[@]} -ne 2 ]; then
            echo "Warning: In $category_dir, expected 2 txt files but found ${#files[@]}; skipping."
            continue
        fi
        # "Now" values come from the first file, "Previous" from the second.
        now_file="${files[1]}"
        prev_file="${files[0]}"

        # Process the "Now" file
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            key=$(echo "$line" | awk '{print $1}')
            value=$(echo "$line" | awk '{print $2}')
            key=$(echo "$key" | awk -F'/' '{print $NF}')
            if [ "$category" = "slack" ]; then
                value=$(echo "$value" | sed 's/ns$//')
            fi
            case $category in
                LUT) lut_now["$key"]="$value" ;;
                Reg) reg_now["$key"]="$value" ;;
                slack) slack_now["$key"]="$value" ;;
            esac
        done < "$now_file"

        # Process the "Previous" file
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            key=$(echo "$line" | awk '{print $1}')
            value=$(echo "$line" | awk '{print $2}')
            key=$(echo "$key" | awk -F'/' '{print $NF}')
            if [ "$category" = "slack" ]; then
                value=$(echo "$value" | sed 's/ns$//')
            fi
            case $category in
                LUT) lut_prev["$key"]="$value" ;;
                Reg) reg_prev["$key"]="$value" ;;
                slack) slack_prev["$key"]="$value" ;;
            esac
        done < "$prev_file"
    done

    sorted_keys=($(for k in "${!lut_now[@]}"; do echo "$k"; done | sort))

    {
      echo "\begin{table}[h]"
      echo "\centering"
      echo "\caption{${escaped_table_name}}"
      echo "\begin{tabular}{l c c c c c c}"
      echo "\hline"
      echo "benchmark & \multicolumn{2}{c}{LUT} & \multicolumn{2}{c}{Reg} & \multicolumn{2}{c}{Slack} \\\\"
      echo " & Previous & Now & Previous & Now & Previous & Now \\\\"
      echo "\hline"
      for key in "${sorted_keys[@]}"; do
          escaped_key=$(echo "$key" | sed 's/_/\\_/g')

          lut_prev_val="${lut_prev[$key]}"
          lut_now_val="${lut_now[$key]}"
          reg_prev_val="${reg_prev[$key]}"
          reg_now_val="${reg_now[$key]}"
          slack_prev_val="${slack_prev[$key]}"
          slack_now_val="${slack_now[$key]}"

          # LUT (int)
          if [ "$lut_prev_val" -eq "$lut_now_val" ] 2>/dev/null; then
              colored_lut_prev="$lut_prev_val"
              colored_lut_now="$lut_now_val"
          else
              diff=$(( lut_prev_val > lut_now_val ? lut_prev_val - lut_now_val : lut_now_val - lut_prev_val ))
              if [ "$lut_prev_val" -gt "$lut_now_val" ]; then
                  if [ "$diff" -le 30 ]; then
                      colored_lut_prev="\\textcolor{paleRed}{$lut_prev_val}"
                      colored_lut_now="\\textcolor{paleGreen}{$lut_now_val}"
                  else
                      colored_lut_prev="\\textcolor{red}{$lut_prev_val}"
                      colored_lut_now="\\textcolor{green}{$lut_now_val}"
                  fi
              else
                  if [ "$diff" -le 30 ]; then
                      colored_lut_prev="\\textcolor{paleGreen}{$lut_prev_val}"
                      colored_lut_now="\\textcolor{paleRed}{$lut_now_val}"
                  else
                      colored_lut_prev="\\textcolor{green}{$lut_prev_val}"
                      colored_lut_now="\\textcolor{red}{$lut_now_val}"
                  fi
              fi
          fi

          # Reg (int)
          if [ "$reg_prev_val" -eq "$reg_now_val" ] 2>/dev/null; then
              colored_reg_prev="$reg_prev_val"
              colored_reg_now="$reg_now_val"
          else
              diff=$(( reg_prev_val > reg_now_val ? reg_prev_val - reg_now_val : reg_now_val - reg_prev_val ))
              if [ "$reg_prev_val" -gt "$reg_now_val" ]; then
                  if [ "$diff" -le 50 ]; then
                      colored_reg_prev="\\textcolor{paleRed}{$reg_prev_val}"
                      colored_reg_now="\\textcolor{paleGreen}{$reg_now_val}"
                  else
                      colored_reg_prev="\\textcolor{red}{$reg_prev_val}"
                      colored_reg_now="\\textcolor{green}{$reg_now_val}"
                  fi
              else
                  if [ "$diff" -le 50 ]; then
                      colored_reg_prev="\\textcolor{paleGreen}{$reg_prev_val}"
                      colored_reg_now="\\textcolor{paleRed}{$reg_now_val}"
                  else
                      colored_reg_prev="\\textcolor{green}{$reg_prev_val}"
                      colored_reg_now="\\textcolor{red}{$reg_now_val}"
                  fi
              fi
          fi

          # Slack (float)
          sp_prev=$(echo "$slack_prev_val" | tr -d ' ')
          sp_now=$(echo "$slack_now_val" | tr -d ' ')
          cmp=$(awk -v a="$sp_prev" -v b="$sp_now" 'BEGIN {
              diff=(a>b?a-b:b-a);
              if (a==b) print "equal";
              else if (a>b) print (diff<=0.2 ? "prev-light" : "prev");
              else print (diff<=0.2 ? "now-light" : "now");
          }')

          case "$cmp" in
              equal)
                  colored_slack_prev="$slack_prev_val"
                  colored_slack_now="$slack_now_val"
                  ;;
              prev-light)
                  colored_slack_prev="\\textcolor{paleGreen}{$slack_prev_val}"
                  colored_slack_now="\\textcolor{paleRed}{$slack_now_val}"
                  ;;
              now-light)
                  colored_slack_prev="\\textcolor{paleRed}{$slack_prev_val}"
                  colored_slack_now="\\textcolor{paleGreen}{$slack_now_val}"
                  ;;
              prev)
                  colored_slack_prev="\\textcolor{green}{$slack_prev_val}"
                  colored_slack_now="\\textcolor{red}{$slack_now_val}"
                  ;;
              now)
                  colored_slack_prev="\\textcolor{red}{$slack_prev_val}"
                  colored_slack_now="\\textcolor{green}{$slack_now_val}"
                  ;;
          esac

          echo "${escaped_key} & ${colored_lut_prev} & ${colored_lut_now} & ${colored_reg_prev} & ${colored_reg_now} & ${colored_slack_prev} & ${colored_slack_now} \\\\"
      done
      echo "\hline"
      echo "\end{tabular}"
      echo "\end{table}"
      echo ""
    } >> "$OUTPUT_FILE"

    unset lut_now lut_prev reg_now reg_prev slack_now slack_prev
done