module {
  func.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>) -> i32 {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    cf.br ^bb1(%c0 : index) {name = #handshake.name<"br0">}
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb3
    cf.br ^bb2(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br1">}
  ^bb2(%1: index, %2: i32):  // 2 preds: ^bb1, ^bb2
    %3 = memref.load %arg1[%1] {name = #handshake.name<"load2">} : memref<100xi32>
    %4 = arith.muli %0, %c100 {name = #handshake.name<"muli1">} : index
    %5 = arith.addi %1, %4 {name = #handshake.name<"addi1">} : index
    %6 = memref.load %arg0[%5] {name = #handshake.name<"load4">} : memref<10000xi32>
    %7 = arith.muli %3, %6 {name = #handshake.name<"muli0">} : i32
    %8 = arith.addi %2, %7 {name = #handshake.name<"addi0">} : i32
    %9 = arith.addi %1, %c1 {name = #handshake.name<"addi2">} : index
    %10 = arith.cmpi ult, %9, %c100 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %10, ^bb2(%9, %8 : index, i32), ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb3:  // pred: ^bb2
    memref.store %8, %arg2[%0] {name = #handshake.name<"store1">} : memref<100xi32>
    %11 = arith.addi %0, %c1 {name = #handshake.name<"addi3">} : index
    %12 = arith.cmpi ult, %11, %c100 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %12, ^bb1(%11 : index), ^bb4 {name = #handshake.name<"cond_br1">}
  ^bb4:  // pred: ^bb3
    return {name = #handshake.name<"return0">} %8 : i32
  }
}

