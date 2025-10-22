# !/bin/bash

# Choose the target clock period
clock_period=6

# Choose the target hdl to test (vhdl|verilog)
hdl="vhdl"

# Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
buffer_alg="costaware"

dynamatic_dir=./dynamatic

cat filelist_all.lst | while read benchmark
do
  [ -f "$benchmark" ] || continue
  echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
  rm -r "$(dirname ${benchmark})/out" 2> /dev/null
  echo "set-dynamatic-path $dynamatic_dir; \
    set-src ${benchmark}; \
    set-clock-period ${clock_period}; \
    compile --fast-token-delivery; \
    write-hdl --hdl ${hdl}; \
    simulate; \
    synthesize; \
    exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-vhdl-6ns/integration-test



# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpl22"

# dynamatic_dir=./dynamatic

# cat filelist_small.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-vhdl-6ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="costaware"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-verilog-6ns/integration-test


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpl22"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-verilog-6ns/integration-test0

# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-vhdl-6ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-verilog-6ns/integration-test0


# # Choose the target clock period
# clock_period=12

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="costaware"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     # synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-vhdl-12ns/integration-test


# # Choose the target clock period
# clock_period=12

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="costaware"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     # synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-verilog-12ns/integration-test

# # Choose the target clock period
# clock_period=12

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     # synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-vhdl-12ns/integration-test0


# # Choose the target clock period
# clock_period=12

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     # synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/costaware-verilog-12ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpl22"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/fpl22-verilog-6ns/integration-test



# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="on-merges"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/on-merges-vhdl-6ns/integration-test

# cd dynamatic
# git checkout testarea
# bash ../mybuild.sh
# cd ..

# mv dynamatic temp1/
# mv temp2/dynamatic .

# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/fpga20-vhdl-6ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpga20"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/fpga20-verilog-6ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="verilog"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="fpl22"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/fpl22-verilog-6ns/integration-test0


# # Choose the target clock period
# clock_period=6

# # Choose the target hdl to test (vhdl|verilog)
# hdl="vhdl"

# # Choose the buffer placement algorithm (on-merges|fpga20|fpl22)
# buffer_alg="on-merges"

# dynamatic_dir=./dynamatic

# cat filelist.lst | while read benchmark
# do
#   [ -f "$benchmark" ] || continue
#   echo "[INFO] Launching Dynamatic on benchmark ${benchmark}..."
#   rm -r "$(dirname ${benchmark})/out" 2> /dev/null
#   echo "set-dynamatic-path $dynamatic_dir; \
#     set-src ${benchmark}; \
#     set-clock-period ${clock_period}; \
#     compile --buffer-algorithm ${buffer_alg}; \
#     write-hdl --hdl ${hdl}; \
#     simulate; \
#     synthesize; \
#     exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure --debug
# done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

# cp -r dynamatic/integration-test z_compare/on-merges-vhdl-6ns/integration-test0