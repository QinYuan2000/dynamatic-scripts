module {
  func.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32) -> i32 {
    %c1000 = arith.constant {name = #handshake.name<"constant2">} 1000 : index
    %c1 = arith.constant {name = #handshake.name<"constant1">} 1 : index
    %c0 = arith.constant {name = #handshake.name<"constant0">} 0 : index
    %0 = memref.load %arg0[%c0] {name = #handshake.name<"load2">} : memref<1000xi32>
    %1:2 = scf.while (%arg4 = %c1, %arg5 = %0) : (index, i32) -> (index, i32) {
      %2 = arith.muli %arg2, %arg5 {name = #handshake.name<"muli0">} : i32
      %3 = memref.load %arg1[%arg4] {name = #handshake.name<"load3">} : memref<1000xi32>
      %4 = arith.muli %arg3, %3 {name = #handshake.name<"muli1">} : i32
      %5 = arith.addi %2, %4 {name = #handshake.name<"addi0">} : i32
      memref.store %5, %arg0[%arg4] {name = #handshake.name<"store1">} : memref<1000xi32>
      %6 = arith.addi %arg4, %c1 {name = #handshake.name<"addi1">} : index
      %7 = arith.cmpi ult, %6, %c1000 {name = #handshake.name<"cmpi0">} : index
      scf.condition(%7) {name = #handshake.name<"condition0">} %6, %5 : index, i32
    } do {
    ^bb0(%arg4: index, %arg5: i32):
      scf.yield {name = #handshake.name<"yield2">} %arg4, %arg5 : index, i32
    } attributes {name = #handshake.name<"while0">}
    return {name = #handshake.name<"return0">} %1#1 : i32
  }
}

