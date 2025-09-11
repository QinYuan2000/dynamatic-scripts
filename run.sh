#!/bin/bash

dynamatic_path="./dynamatic"

BUFFER_ALGORITHM="--buffer-algorithm fpga20"
# BUFFER_ALGORITHM="--buffer-algorithm fpl22"
# BUFFER_ALGORITHM="--buffer-algorithm costaware"
# BUFFER_ALGORITHM="--buffer-algorithm on-merges"
# SHARING="--sharing"
SHARING=""
# HDL="verilog"
HDL="vhdl"

# f_benchmark_src="bicg/bicg.c"
# f_benchmark_src="binary_search/binary_search.c"
f_benchmark_src="fir/fir.c"
# f_benchmark_src="gcd/gcd.c"
# f_benchmark_src="cnn/cnn.c"
# f_benchmark_src="matching/matching.c"
# f_benchmark_src="matching_2/matching_2.c"
# f_benchmark_src="sharing/share_test_1/share_test_1.c"
# f_benchmark_src="while_loop_1/while_loop_1.c"
# f_benchmark_src="atax/atax.c"
# f_benchmark_src="loop_array/loop_array.c"
# f_benchmark_src="gaussian/gaussian.c"
# f_benchmark_src="stencil_2d/stencil_2d.c"
# f_benchmark_src="kernel_3mm/kernel_3mm.c"
# f_benchmark_src="jacobi_1d_imper/jacobi_1d_imper.c"
# f_benchmark_src="trisolv/trisolv.c"
# f_benchmark_src="covariance_float/covariance_float.c"
# f_benchmark_src="gemm/gemm.c"
# f_benchmark_src="while_loop_2/while_loop_2.c"
# f_benchmark_src="simple_example_1/simple_example_1.c"
# f_benchmark_src="lu/lu.c"
# f_benchmark_src="gemver/gemver.c"
# f_benchmark_src="pivot/pivot.c"
# f_benchmark_src="polyn_mult/polyn_mult.c"
# f_benchmark_src="iir/iir.c"
# f_benchmark_src="sumi3_mem/sumi3_mem.c"
# f_benchmark_src="image_resize/image_resize.c"
# f_benchmark_src="matvec/matvec.c"
# f_benchmark_src="symm_float/symm_float.c"
# f_benchmark_src="memory/test_memory_13/test_memory_13.c"

s_source_file="$dynamatic_path/integration-test/$f_benchmark_src"
[ -f "$s_source_file" ] || \
  { echo "Source file $s_source_file does not exist!"; exit 1; }

echo "set-dynamatic-path ./dynamatic; \
  set-src ./dynamatic/integration-test/$f_benchmark_src; \
  set-clock-period 6; \
  compile $SHARING $BUFFER_ALGORITHM --fast-token-delivery;\
  write-mlir --stage handshake --output ./handshake_in.mlir;
  write-hdl --hdl $HDL; \
  simulate; \
  synthesize; \
  exit" \
  | dynamatic/bin/dynamatic --exit-on-failure --debug

exit
