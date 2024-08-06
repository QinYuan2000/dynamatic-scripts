module {
  func.func @sumi3_mem(%arg0: memref<1000xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %0 = affine.for %arg1 = 0 to 1000 iter_args(%arg2 = %c0_i32) -> (i32) {
      %1 = affine.load %arg0[%arg1] {name = #handshake.name<"load0">} : memref<1000xi32>
      %2 = arith.muli %1, %1 {name = #handshake.name<"muli0">} : i32
      %3 = arith.muli %2, %1 {name = #handshake.name<"muli1">} : i32
      %4 = arith.addi %arg2, %3 {name = #handshake.name<"addi0">} : i32
      affine.yield {name = #handshake.name<"yield0">} %4 : i32
    } {name = #handshake.name<"for0">}
    return {name = #handshake.name<"return0">} %0 : i32
  }
}

