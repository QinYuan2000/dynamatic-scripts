module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<30x30xi32>, %arg3: memref<30x30xi32>, %arg4: memref<30x30xi32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %c4_i32 = arith.constant 4 : i32
    affine.for %arg5 = 0 to 30 {
      affine.for %arg6 = 0 to 30 {
        %0 = affine.load %arg2[%arg5, %arg6] : memref<30x30xi32>
        %1 = arith.subi %0, %arg0 : i32
        %2 = arith.muli %1, %arg1 : i32
        %3 = arith.shrsi %2, %c4_i32 : i32
        affine.store %3, %arg2[%arg5, %arg6] : memref<30x30xi32>
        %4 = affine.load %arg4[%arg5, %arg6] : memref<30x30xi32>
        %5 = arith.subi %4, %arg0 : i32
        %6 = arith.muli %5, %arg1 : i32
        %7 = arith.shrsi %6, %c4_i32 : i32
        affine.store %7, %arg4[%arg5, %arg6] : memref<30x30xi32>
        %8 = affine.load %arg3[%arg5, %arg6] : memref<30x30xi32>
        %9 = arith.subi %8, %arg0 : i32
        %10 = arith.muli %9, %arg1 : i32
        %11 = arith.shrsi %10, %c4_i32 : i32
        affine.store %11, %arg3[%arg5, %arg6] : memref<30x30xi32>
      }
    }
    return
  }
}
