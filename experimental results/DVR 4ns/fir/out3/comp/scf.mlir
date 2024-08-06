module {
  func.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>) -> i32 {
    %c999 = arith.constant {name = #handshake.name<"constant5">} 999 : index
    %c-1 = arith.constant {name = #handshake.name<"constant4">} -1 : index
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c1000 = arith.constant {name = #handshake.name<"constant2">} 1000 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %0:2 = scf.while (%arg2 = %c0, %arg3 = %c0_i32) : (index, i32) -> (index, i32) {
      %1 = memref.load %arg1[%arg2] {name = #handshake.name<"load2">} : memref<1000xi32>
      %2 = arith.muli %arg2, %c-1 {name = #handshake.name<"muli1">} : index
      %3 = arith.addi %2, %c999 {name = #handshake.name<"addi1">} : index
      %4 = memref.load %arg0[%3] {name = #handshake.name<"load3">} : memref<1000xi32>
      %5 = arith.muli %1, %4 {name = #handshake.name<"muli0">} : i32
      %6 = arith.addi %arg3, %5 {name = #handshake.name<"addi0">} : i32
      %7 = arith.addi %arg2, %c1 {name = #handshake.name<"addi2">} : index
      %8 = arith.cmpi ult, %7, %c1000 {name = #handshake.name<"cmpi0">} : index
      scf.condition(%8) {name = #handshake.name<"condition0">} %7, %6 : index, i32
    } do {
    ^bb0(%arg2: index, %arg3: i32):
      scf.yield {name = #handshake.name<"yield2">} %arg2, %arg3 : index, i32
    } attributes {name = #handshake.name<"while0">}
    return {name = #handshake.name<"return0">} %0#1 : i32
  }
}

