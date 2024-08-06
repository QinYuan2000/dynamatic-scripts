module {
  func.func @matvec(%arg0: memref<100x100xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %0 = affine.for %arg3 = 0 to 100 iter_args(%arg4 = %c0_i32) -> (i32) {
      %1 = affine.for %arg5 = 0 to 100 iter_args(%arg6 = %c0_i32) -> (i32) {
        %2 = affine.load %arg1[%arg5] {name = #handshake.name<"load0">} : memref<100xi32>
        %3 = affine.load %arg0[%arg3, %arg5] {name = #handshake.name<"load1">} : memref<100x100xi32>
        %4 = arith.muli %2, %3 {name = #handshake.name<"muli0">} : i32
        %5 = arith.addi %arg6, %4 {name = #handshake.name<"addi0">} : i32
        affine.yield {name = #handshake.name<"yield0">} %5 : i32
      } {name = #handshake.name<"for0">}
      affine.store %1, %arg2[%arg3] {name = #handshake.name<"store0">} : memref<100xi32>
      affine.yield {name = #handshake.name<"yield1">} %1 : i32
    } {name = #handshake.name<"for1">}
    return {name = #handshake.name<"return0">} %0 : i32
  }
}

