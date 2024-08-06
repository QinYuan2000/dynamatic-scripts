module {
  func.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c100 = arith.constant {name = #handshake.name<"constant2">} 100 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%0: index, %1: i32):  // 2 preds: ^bb0, ^bb3
    cf.br ^bb2(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br1">}
  ^bb2(%2: index, %3: i32):  // 2 preds: ^bb1, ^bb2
    %4 = memref.load %arg1[%2] {name = #handshake.name<"load2">} : memref<100xi32>
    %5 = arith.muli %0, %c100 {name = #handshake.name<"muli1">} : index
    %6 = arith.addi %2, %5 {name = #handshake.name<"addi1">} : index
    %7 = memref.load %arg0[%6] {name = #handshake.name<"load4">} : memref<10000xi32>
    %8 = arith.muli %4, %7 {name = #handshake.name<"muli0">} : i32
    %9 = arith.addi %3, %8 {name = #handshake.name<"addi0">} : i32
    %10 = arith.addi %2, %c1 {name = #handshake.name<"addi2">} : index
    %11 = arith.cmpi ult, %10, %c100 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %11, ^bb2(%10, %9 : index, i32), ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb3:  // pred: ^bb2
    memref.store %9, %arg2[%0] {name = #handshake.name<"store1">} : memref<100xi32>
    %12 = arith.addi %0, %c1 {name = #handshake.name<"addi3">} : index
    %13 = arith.cmpi ult, %12, %c100 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %13, ^bb1(%12, %9 : index, i32), ^bb4 {name = #handshake.name<"cond_br1">}
  ^bb4:  // pred: ^bb3
    return {name = #handshake.name<"return0">} %9 : i32
  }
}

