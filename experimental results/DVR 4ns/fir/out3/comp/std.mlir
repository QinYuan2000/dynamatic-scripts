module {
  func.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>) -> i32 {
    %c999 = arith.constant {name = #handshake.name<"constant5">} 999 : index
    %c-1 = arith.constant {name = #handshake.name<"constant4">} -1 : index
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c1000 = arith.constant {name = #handshake.name<"constant2">} 1000 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%0: index, %1: i32):  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %arg1[%0] {name = #handshake.name<"load2">} : memref<1000xi32>
    %3 = arith.muli %0, %c-1 {name = #handshake.name<"muli1">} : index
    %4 = arith.addi %3, %c999 {name = #handshake.name<"addi1">} : index
    %5 = memref.load %arg0[%4] {name = #handshake.name<"load3">} : memref<1000xi32>
    %6 = arith.muli %2, %5 {name = #handshake.name<"muli0">} : i32
    %7 = arith.addi %1, %6 {name = #handshake.name<"addi0">} : i32
    %8 = arith.addi %0, %c1 {name = #handshake.name<"addi2">} : index
    %9 = arith.cmpi ult, %8, %c1000 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %9, ^bb1(%8, %7 : index, i32), ^bb2 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %7 : i32
  }
}

