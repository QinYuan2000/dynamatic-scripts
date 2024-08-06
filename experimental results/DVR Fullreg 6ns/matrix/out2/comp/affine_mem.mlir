module {
  func.func @matrix(%arg0: memref<30x30xi32>, %arg1: memref<30x30xi32>, %arg2: memref<30x30xi32>) {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    affine.for %arg3 = 0 to 30 {
      affine.for %arg4 = 0 to 30 {
        %0 = affine.for %arg5 = 0 to 30 iter_args(%arg6 = %c0_i32) -> (i32) {
          %1 = affine.load %arg0[%arg3, %arg5] {name = #handshake.name<"load0">} : memref<30x30xi32>
          %2 = affine.load %arg1[%arg5, %arg4] {name = #handshake.name<"load1">} : memref<30x30xi32>
          %3 = arith.muli %1, %2 {name = #handshake.name<"muli0">} : i32
          %4 = arith.addi %arg6, %3 {name = #handshake.name<"addi0">} : i32
          affine.yield {name = #handshake.name<"yield0">} %4 : i32
        } {name = #handshake.name<"for0">}
        affine.store %0, %arg2[%arg3, %arg4] {name = #handshake.name<"store0">} : memref<30x30xi32>
      } {name = #handshake.name<"for1">}
    } {name = #handshake.name<"for2">}
    return {name = #handshake.name<"return0">}
  }
}

