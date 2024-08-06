module {
  func.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32) -> i32 {
    %c1 = arith.constant {name = #handshake.name<"constant4">} 1 : index
    %c0 = arith.constant {name = #handshake.name<"constant3">} 0 : index
    %c10_i32 = arith.constant {name = #handshake.name<"constant0">} 10 : i32
    %c5_i32 = arith.constant {name = #handshake.name<"constant1">} 5 : i32
    %c0_i32 = arith.constant {name = #handshake.name<"constant2">} 0 : i32
    %0 = arith.index_cast %arg1 {name = #handshake.name<"index_cast0">} : i32 to index
    %1 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %c0_i32) -> (i32) {
      %2 = memref.load %arg0[%arg2] {name = #handshake.name<"load1">} : memref<100xi32>
      %3 = arith.muli %2, %c5_i32 {name = #handshake.name<"muli0">} : i32
      %4 = arith.cmpi sgt, %3, %c10_i32 {name = #handshake.name<"cmpi0">} : i32
      %5 = arith.select %4, %3, %c0_i32 {name = #handshake.name<"select0">} : i32
      %6 = arith.addi %arg3, %5 {name = #handshake.name<"addi1">} : i32
      scf.yield {name = #handshake.name<"yield3">} %6 : i32
    } {name = #handshake.name<"for1">}
    return {name = #handshake.name<"return0">} %1 : i32
  }
}

