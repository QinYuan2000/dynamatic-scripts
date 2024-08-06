module {
  func.func @image_resize(%arg0: memref<900xi32>, %arg1: i32) {
    %c0 = arith.constant {name = #handshake.name<"constant2">} 0 : index
    cf.br ^bb1(%c0 : index) {name = #handshake.name<"br0">}
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb3
    %c0_0 = arith.constant {name = #handshake.name<"constant3">} 0 : index
    cf.br ^bb2(%c0_0 : index) {name = #handshake.name<"br1">}
  ^bb2(%1: index):  // 2 preds: ^bb1, ^bb2
    %c30 = arith.constant {name = #handshake.name<"constant4">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant5">} 1 : index
    %2 = arith.muli %0, %c30 {name = #handshake.name<"muli0">} : index
    %3 = arith.addi %1, %2 {name = #handshake.name<"addi0">} : index
    %4 = memref.load %arg0[%3] {deps = #handshake<deps[<"store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"load2">} : memref<900xi32>
    %5 = arith.subi %arg1, %4 {name = #handshake.name<"subi0">} : i32
    %6 = arith.muli %0, %c30 {name = #handshake.name<"muli1">} : index
    %7 = arith.addi %1, %6 {name = #handshake.name<"addi1">} : index
    memref.store %5, %arg0[%7] {mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"store2">} : memref<900xi32>
    %8 = arith.addi %1, %c1 {name = #handshake.name<"addi2">} : index
    %9 = arith.cmpi ult, %8, %c30 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %9, ^bb2(%8 : index), ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb3:  // pred: ^bb2
    %c30_1 = arith.constant {name = #handshake.name<"constant6">} 30 : index
    %c1_2 = arith.constant {name = #handshake.name<"constant7">} 1 : index
    %10 = arith.addi %0, %c1_2 {name = #handshake.name<"addi3">} : index
    %11 = arith.cmpi ult, %10, %c30_1 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %11, ^bb1(%10 : index), ^bb4 {name = #handshake.name<"cond_br1">}
  ^bb4:  // pred: ^bb3
    return {name = #handshake.name<"return0">}
  }
}

