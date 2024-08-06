module {
  func.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32) -> i32 {
    %c10_i32 = arith.constant {name = #handshake.name<"constant0">} 10 : i32
    %c0_i32 = arith.constant {name = #handshake.name<"constant1">} 0 : i32
    %0 = arith.index_cast %arg1 {name = #handshake.name<"index_cast0">} : i32 to index
    %1 = affine.for %arg2 = 0 to %0 iter_args(%arg3 = %c0_i32) -> (i32) {
      %2 = affine.load %arg0[%arg2] {name = #handshake.name<"load0">} : memref<100xi32>
      %3 = arith.cmpi sgt, %2, %c10_i32 {name = #handshake.name<"cmpi0">} : i32
      %4 = scf.if %3 -> (i32) {
        %5 = arith.addi %arg3, %2 {name = #handshake.name<"addi0">} : i32
        scf.yield {name = #handshake.name<"yield0">} %5 : i32
      } else {
        scf.yield {name = #handshake.name<"yield1">} %arg3 : i32
      } {name = #handshake.name<"if0">}
      affine.yield {name = #handshake.name<"yield2">} %4 : i32
    } {name = #handshake.name<"for0">}
    return {name = #handshake.name<"return0">} %1 : i32
  }
}

