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

# f_benchmark_src="admm/admm.c"
# f_benchmark_src="atax/atax.c"
# f_benchmark_src="atax_float/atax_float.c"
# f_benchmark_src="bicg/bicg.c"
# f_benchmark_src="bicg_float/bicg_float.c"
# f_benchmark_src="binary_search/binary_search.c"
# f_benchmark_src="cnn/cnn.c"
# f_benchmark_src="complexdiv/complexdiv.c"
# f_benchmark_src="cordic/cordic.c"
# f_benchmark_src="correlation_float/correlation_float.c"
# f_benchmark_src="covariance/covariance.c"
# f_benchmark_src="covariance_float/covariance_float.c"
# f_benchmark_src="dct/dct.c"
# f_benchmark_src="external_integration/external_integration.c"
# f_benchmark_src="factorial/factorial.c"
# f_benchmark_src="fir/fir.c"
# f_benchmark_src="fixed/fixed.c"
# f_benchmark_src="float_basic/float_basic.c"
# f_benchmark_src="gaussian/gaussian.c"
# f_benchmark_src="gcd/gcd.c"
# f_benchmark_src="gemm/gemm.c"
# f_benchmark_src="gemm_float/gemm_float.c"
# f_benchmark_src="gemver/gemver.c"
# f_benchmark_src="gemver_float/gemver_float.c"
# f_benchmark_src="gesummv_float/gesummv_float.c"
# f_benchmark_src="get_tanh/get_tanh.c"
# f_benchmark_src="gsum/gsum.c"
# f_benchmark_src="gsumif/gsumif.c"
# f_benchmark_src="histogram/histogram.c"
# f_benchmark_src="if_convert/if_convert.c"
# f_benchmark_src="if_loop_1/if_loop_1.c"
# f_benchmark_src="if_loop_2/if_loop_2.c"
# f_benchmark_src="if_loop_3/if_loop_3.c"
# f_benchmark_src="if_loop_add/if_loop_add.c"
# f_benchmark_src="if_loop_mul/if_loop_mul.c"
# f_benchmark_src="iir/iir.c"
# f_benchmark_src="image_resize/image_resize.c"
# f_benchmark_src="insertion_sort/insertion_sort.c"
# f_benchmark_src="iterative_division/iterative_division.c"
# f_benchmark_src="iterative_sqrt/iterative_sqrt.c"
# f_benchmark_src="jacobi_1d_imper/jacobi_1d_imper.c"
# f_benchmark_src="kernel_2mm/kernel_2mm.c"
# f_benchmark_src="kernel_2mm_float/kernel_2mm_float.c"
# f_benchmark_src="kernel_3mm/kernel_3mm.c"
# f_benchmark_src="kernel_3mm_float/kernel_3mm_float.c"
# f_benchmark_src="kmp/kmp.c"
# f_benchmark_src="loop_array/loop_array.c"
# f_benchmark_src="loop_path/loop_path.c"
# f_benchmark_src="lu/lu.c"
# f_benchmark_src="matching/matching.c"
# f_benchmark_src="matching_2/matching_2.c"
# f_benchmark_src="matrix/matrix.c"
# f_benchmark_src="matrix_power/matrix_power.c"
# f_benchmark_src="matvec/matvec.c"
# f_benchmark_src="memory/test_constant_array/test_constant_array.c"
# f_benchmark_src="memory/test_flatten_array/test_flatten_array.c"
# f_benchmark_src="memory/test_internal_array/test_internal_array.c"
# f_benchmark_src="memory/test_memory_1/test_memory_1.c"
# f_benchmark_src="memory/test_memory_2/test_memory_2.c"
# f_benchmark_src="memory/test_memory_3/test_memory_3.c"
# f_benchmark_src="memory/test_memory_4/test_memory_4.c"
# f_benchmark_src="memory/test_memory_5/test_memory_5.c"
# f_benchmark_src="memory/test_memory_6/test_memory_6.c"
# f_benchmark_src="memory/test_memory_7/test_memory_7.c"
# f_benchmark_src="memory/test_memory_8/test_memory_8.c"
# f_benchmark_src="memory/test_memory_9/test_memory_9.c"
# f_benchmark_src="memory/test_memory_10/test_memory_10.c"
# f_benchmark_src="memory/test_memory_11/test_memory_11.c"
# f_benchmark_src="memory/test_memory_12/test_memory_12.c"
# f_benchmark_src="memory/test_memory_13/test_memory_13.c"
# f_benchmark_src="memory/test_memory_14/test_memory_14.c"
# f_benchmark_src="memory/test_memory_15/test_memory_15.c"
# f_benchmark_src="memory/test_memory_16/test_memory_16.c"
# f_benchmark_src="memory/test_memory_17/test_memory_17.c"
# f_benchmark_src="memory/test_memory_18/test_memory_18.c"
# f_benchmark_src="memory/test_smallbound/test_smallbound.c"
# f_benchmark_src="memory/test_unroll/test_unroll.c"
# f_benchmark_src="mul_example/mul_example.c"
# f_benchmark_src="mvt_float/mvt_float.c"
# f_benchmark_src="nested_loop/nested_loop.c"
f_benchmark_src="path_profiling/path_profiling.c"
# f_benchmark_src="pivot/pivot.c"
# f_benchmark_src="polyn_mult/polyn_mult.c"
# f_benchmark_src="sharing/share_test_1/share_test_1.c"
# f_benchmark_src="sharing/share_test_2/share_test_2.c"
# f_benchmark_src="simple_example_1/simple_example_1.c"
# f_benchmark_src="single_loop/single_loop.c"
# f_benchmark_src="sobel/sobel.c"
# f_benchmark_src="sparse/sparse.c"
# f_benchmark_src="spmv/spmv.c"
# f_benchmark_src="stencil_2d/stencil_2d.c"
# f_benchmark_src="subdiag/subdiag.c"
# f_benchmark_src="subdiag_fast/subdiag_fast.c"
# f_benchmark_src="sumi3_mem/sumi3_mem.c"
# f_benchmark_src="symm_float/symm_float.c"
# f_benchmark_src="syr2k_float/syr2k_float.c"
# f_benchmark_src="test_bitint/test_bitint.c"
# f_benchmark_src="test_loop_free/test_loop_free.c"
# f_benchmark_src="test_stdint/test_stdint.c"
# f_benchmark_src="threshold/threshold.c"
# f_benchmark_src="triangular/triangular.c"
# f_benchmark_src="trisolv/trisolv.c"
# f_benchmark_src="vector_rescale/vector_rescale.c"
# f_benchmark_src="video_filter/video_filter.c"
# f_benchmark_src="while_loop_1/while_loop_1.c"
# f_benchmark_src="while_loop_2/while_loop_2.c"
# f_benchmark_src="while_loop_3/while_loop_3.c"


s_source_file="$dynamatic_path/integration-test/$f_benchmark_src"
[ -f "$s_source_file" ] || \
  { echo "Source file $s_source_file does not exist!"; exit 1; }

echo "set-dynamatic-path $dynamatic_path; \
  set-src $dynamatic_path/integration-test/$f_benchmark_src; \
  set-clock-period 6; \
  compile --fast-token-delivery; \
  write-hdl --hdl $HDL; \
  simulate; \
  # synthesize; \
  exit" \
  | "$dynamatic_path/bin/dynamatic" --exit-on-failure --debug

exit

# echo "set-dynamatic-path $dynamatic_path; \
#   set-src $dynamatic_path/integration-test/$f_benchmark_src; \
#   set-clock-period 6; \
#   compile $SHARING $BUFFER_ALGORITHM; \
#   write-mlir --stage handshake --output ./handshake_in.mlir; \
#   write-hdl --hdl $HDL; \
#   simulate; \
#   synthesize; \
#   exit" \
#   | "$dynamatic_path/bin/dynamatic" --exit-on-failure --debug

# exit
