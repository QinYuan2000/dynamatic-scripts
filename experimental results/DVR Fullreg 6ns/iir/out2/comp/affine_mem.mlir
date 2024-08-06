module {
  func.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32) -> i32 {
    %0 = affine.load %arg0[0] {name = #handshake.name<"load0">} : memref<1000xi32>
    %1 = affine.for %arg4 = 1 to 1000 iter_args(%arg5 = %0) -> (i32) {
      %2 = arith.muli %arg2, %arg5 {name = #handshake.name<"muli0">} : i32
      %3 = affine.load %arg1[%arg4] {name = #handshake.name<"load1">} : memref<1000xi32>
      %4 = arith.muli %arg3, %3 {name = #handshake.name<"muli1">} : i32
      %5 = arith.addi %2, %4 {name = #handshake.name<"addi0">} : i32
      affine.store %5, %arg0[%arg4] {name = #handshake.name<"store0">} : memref<1000xi32>
      affine.yield {name = #handshake.name<"yield0">} %5 : i32
    } {name = #handshake.name<"for0">}
    return {name = #handshake.name<"return0">} %1 : i32
  }
}

