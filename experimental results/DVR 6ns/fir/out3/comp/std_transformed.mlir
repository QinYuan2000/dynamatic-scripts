module {
  func.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>) -> i32 {
    %c1 = arith.constant 1 : index
    %c1000 = arith.constant 1000 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c999 = arith.constant 999 : index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%0: index, %1: i32):  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %arg1[%0] {name = #handshake.name<"load2">} : memref<1000xi32>
    %3 = arith.subi %c999, %0 : index
    %4 = memref.load %arg0[%3] {name = #handshake.name<"load3">} : memref<1000xi32>
    %5 = arith.muli %2, %4 {name = #handshake.name<"muli0">} : i32
    %6 = arith.addi %1, %5 {name = #handshake.name<"addi0">} : i32
    %7 = arith.addi %0, %c1 {name = #handshake.name<"addi2">} : index
    %8 = arith.cmpi ult, %7, %c1000 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %8, ^bb1(%7, %6 : index, i32), ^bb2 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %6 : i32
  }
}

