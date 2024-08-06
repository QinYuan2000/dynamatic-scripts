module {
  func.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>) {
    %c0 = arith.constant {name = #handshake.name<"constant2">} 0 : index
    cf.br ^bb1(%c0 : index) {name = #handshake.name<"br0">}
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb5
    %c0_0 = arith.constant {name = #handshake.name<"constant4">} 0 : index
    cf.br ^bb2(%c0_0 : index) {name = #handshake.name<"br1">}
  ^bb2(%1: index):  // 2 preds: ^bb1, ^bb4
    %c0_i32 = arith.constant {name = #handshake.name<"constant5">} 0 : i32
    %c0_1 = arith.constant {name = #handshake.name<"constant6">} 0 : index
    cf.br ^bb3(%c0_1, %c0_i32 : index, i32) {name = #handshake.name<"br2">}
  ^bb3(%2: index, %3: i32):  // 2 preds: ^bb2, ^bb3
    %c30 = arith.constant {name = #handshake.name<"constant7">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant8">} 1 : index
    %4 = arith.muli %0, %c30 {name = #handshake.name<"muli1">} : index
    %5 = arith.addi %2, %4 {name = #handshake.name<"addi1">} : index
    %6 = memref.load %arg0[%5] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load4">} : memref<900xi32>
    %7 = arith.muli %2, %c30 {name = #handshake.name<"muli2">} : index
    %8 = arith.addi %1, %7 {name = #handshake.name<"addi2">} : index
    %9 = memref.load %arg1[%8] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load5">} : memref<900xi32>
    %10 = arith.muli %6, %9 {name = #handshake.name<"muli0">} : i32
    %11 = arith.addi %3, %10 {name = #handshake.name<"addi0">} : i32
    %12 = arith.addi %2, %c1 {name = #handshake.name<"addi4">} : index
    %13 = arith.cmpi ult, %12, %c30 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %13, ^bb3(%12, %11 : index, i32), ^bb4 {name = #handshake.name<"cond_br0">}
  ^bb4:  // pred: ^bb3
    %c30_2 = arith.constant {name = #handshake.name<"constant9">} 30 : index
    %c1_3 = arith.constant {name = #handshake.name<"constant10">} 1 : index
    %14 = arith.muli %0, %c30_2 {name = #handshake.name<"muli3">} : index
    %15 = arith.addi %1, %14 {name = #handshake.name<"addi3">} : index
    memref.store %11, %arg2[%15] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"store2">} : memref<900xi32>
    %16 = arith.addi %1, %c1_3 {name = #handshake.name<"addi5">} : index
    %17 = arith.cmpi ult, %16, %c30_2 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %17, ^bb2(%16 : index), ^bb5 {name = #handshake.name<"cond_br1">}
  ^bb5:  // pred: ^bb4
    %c30_4 = arith.constant {name = #handshake.name<"constant11">} 30 : index
    %c1_5 = arith.constant {name = #handshake.name<"constant12">} 1 : index
    %18 = arith.addi %0, %c1_5 {name = #handshake.name<"addi6">} : index
    %19 = arith.cmpi ult, %18, %c30_4 {name = #handshake.name<"cmpi2">} : index
    cf.cond_br %19, ^bb1(%18 : index), ^bb6 {name = #handshake.name<"cond_br2">}
  ^bb6:  // pred: ^bb5
    return {name = #handshake.name<"return0">}
  }
}

