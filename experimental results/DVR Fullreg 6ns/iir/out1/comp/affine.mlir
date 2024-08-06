module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %0 = affine.load %arg0[0] : memref<1000xi32>
    %1 = affine.for %arg4 = 1 to 1000 iter_args(%arg5 = %0) -> (i32) {
      %2 = arith.muli %arg2, %arg5 : i32
      %3 = affine.load %arg1[%arg4] : memref<1000xi32>
      %4 = arith.muli %arg3, %3 : i32
      %5 = arith.addi %2, %4 : i32
      affine.store %5, %arg0[%arg4] : memref<1000xi32>
      affine.yield %5 : i32
    }
    return %1 : i32
  }
}
