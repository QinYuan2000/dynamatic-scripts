module {
  func.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>) -> i32 {
    %c0 = arith.constant {name = #handshake.name<"constant2">} 0 : index
    cf.br ^bb1(%c0 : index) {name = #handshake.name<"br0">}
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb3
    %c0_i32 = arith.constant {name = #handshake.name<"constant4">} 0 : i32
    %c0_0 = arith.constant {name = #handshake.name<"constant5">} 0 : index
    cf.br ^bb2(%c0_0, %c0_i32 : index, i32) {name = #handshake.name<"br1">}
  ^bb2(%1: index, %2: i32):  // 2 preds: ^bb1, ^bb2
    %c100 = arith.constant {name = #handshake.name<"constant6">} 100 : index
    %c1 = arith.constant {name = #handshake.name<"constant7">} 1 : index
    %3 = memref.load %arg1[%1] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load2">} : memref<100xi32>
    %4 = arith.muli %0, %c100 {name = #handshake.name<"muli1">} : index
    %5 = arith.addi %1, %4 {name = #handshake.name<"addi1">} : index
    %6 = memref.load %arg0[%5] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load4">} : memref<10000xi32>
    %7 = arith.muli %3, %6 {name = #handshake.name<"muli0">} : i32
    %8 = arith.addi %2, %7 {name = #handshake.name<"addi0">} : i32
    %9 = arith.addi %1, %c1 {name = #handshake.name<"addi2">} : index
    %10 = arith.cmpi ult, %9, %c100 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %10, ^bb2(%9, %8 : index, i32), ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb3:  // pred: ^bb2
    %c100_1 = arith.constant {name = #handshake.name<"constant8">} 100 : index
    %c1_2 = arith.constant {name = #handshake.name<"constant9">} 1 : index
    memref.store %8, %arg2[%0] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"store1">} : memref<100xi32>
    %11 = arith.addi %0, %c1_2 {name = #handshake.name<"addi3">} : index
    %12 = arith.cmpi ult, %11, %c100_1 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %12, ^bb1(%11 : index), ^bb4 {name = #handshake.name<"cond_br1">}
  ^bb4:  // pred: ^bb3
    return {name = #handshake.name<"return0">} %8 : i32
  }
}

