#!/bin/bash

case_list=("fpga20-vhdl-6ns/integration-test0"
            "fpl22-verilog-6ns/integration-test0"
            "on-merges-vhdl-6ns/integration-test0"
            "fpga20-verilog-6ns/integration-test0"
            )

lst_file="filelist1.lst"

for test_case in "${case_list[@]}"; do
  while IFS= read -r benchmark; do
    [ -z "$benchmark" ] && continue
    cat > s_writtensynth.sh <<EOF
set-dynamatic-path ./dynamatic
set-clock-period 6
set-src ./z_compare/${test_case}/${benchmark}
synthesize
exit
EOF
    dynamatic/bin/dynamatic --run s_writtensynth.sh
  done < "$lst_file"
done