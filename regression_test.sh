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
    # synthesize; \
    exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure
done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

cp -r dynamatic/integration-test z_compare/supGSA/integration-test0

cd dynamatic
git checkout midcyclesupp
bash ../mybuild.sh
cd ..


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
    # synthesize; \
    exit" | $dynamatic_dir/bin/dynamatic --exit-on-failure
done 2>&1 | tee regression_test_${clock_period}_${hdl}_${buffer_alg}.log

cp -r dynamatic/integration-test z_compare/supGSA/integration-test
