module {
  func.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32) -> i32 {
    %c10_i32 = arith.constant {name = #handshake.name<"constant0">} 10 : i32
    %c5_i32 = arith.constant {name = #handshake.name<"constant1">} 5 : i32
    %c0_i32 = arith.constant {name = #handshake.name<"constant2">} 0 : i32
    %0 = arith.index_cast %arg1 {name = #handshake.name<"index_cast0">} : i32 to index
    %1 = affine.for %arg2 = 0 to %0 iter_args(%arg3 = %c0_i32) -> (i32) {
      %2 = affine.load %arg0[%arg2] {name = #handshake.name<"load0">} : memref<100xi32>
      %3 = arith.muli %2, %c5_i32 {name = #handshake.name<"muli0">} : i32
      %4 = arith.cmpi sgt, %3, %c10_i32 {name = #handshake.name<"cmpi0">} : i32
      %5 = scf.if %4 -> (i32) {
        %6 = arith.addi %arg3, %3 {name = #handshake.name<"addi0">} : i32
        scf.yield {name = #handshake.name<"yield0">} %6 : i32
      } else {
        scf.yield {name = #handshake.name<"yield1">} %arg3 : i32
      } {name = #handshake.name<"if0">}
      affine.yield {name = #handshake.name<"yield2">} %5 : i32
    } {name = #handshake.name<"for0">}
    return {name = #handshake.name<"return0">} %1 : i32
  }
}

