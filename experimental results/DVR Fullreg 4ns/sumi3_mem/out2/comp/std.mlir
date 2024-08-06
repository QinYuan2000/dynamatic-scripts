module {
  func.func @sumi3_mem(%arg0: memref<1000xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c1000 = arith.constant {name = #handshake.name<"constant2">} 1000 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%0: index, %1: i32):  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %arg0[%0] {name = #handshake.name<"load1">} : memref<1000xi32>
    %3 = arith.muli %2, %2 {name = #handshake.name<"muli0">} : i32
    %4 = arith.muli %3, %2 {name = #handshake.name<"muli1">} : i32
    %5 = arith.addi %1, %4 {name = #handshake.name<"addi0">} : i32
    %6 = arith.addi %0, %c1 {name = #handshake.name<"addi1">} : index
    %7 = arith.cmpi ult, %6, %c1000 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %7, ^bb1(%6, %5 : index, i32), ^bb2 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %5 : i32
  }
}

