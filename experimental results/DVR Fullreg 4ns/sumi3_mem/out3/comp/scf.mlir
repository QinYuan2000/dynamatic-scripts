module {
  func.func @sumi3_mem(%arg0: memref<1000xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c1000 = arith.constant {name = #handshake.name<"constant2">} 1000 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %0:2 = scf.while (%arg1 = %c0, %arg2 = %c0_i32) : (index, i32) -> (index, i32) {
      %1 = memref.load %arg0[%arg1] {name = #handshake.name<"load1">} : memref<1000xi32>
      %2 = arith.muli %1, %1 {name = #handshake.name<"muli0">} : i32
      %3 = arith.muli %2, %1 {name = #handshake.name<"muli1">} : i32
      %4 = arith.addi %arg2, %3 {name = #handshake.name<"addi0">} : i32
      %5 = arith.addi %arg1, %c1 {name = #handshake.name<"addi1">} : index
      %6 = arith.cmpi ult, %5, %c1000 {name = #handshake.name<"cmpi0">} : index
      scf.condition(%6) {name = #handshake.name<"condition0">} %5, %4 : index, i32
    } do {
    ^bb0(%arg1: index, %arg2: i32):
      scf.yield {name = #handshake.name<"yield2">} %arg1, %arg2 : index, i32
    } attributes {name = #handshake.name<"while0">}
    return {name = #handshake.name<"return0">} %0#1 : i32
  }
}

