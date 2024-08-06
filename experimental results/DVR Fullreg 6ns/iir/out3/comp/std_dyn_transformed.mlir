module {
  func.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32) -> i32 {
    %c0 = arith.constant {name = #handshake.name<"constant0">} 0 : index
    %c1 = arith.constant {name = #handshake.name<"constant1">} 1 : index
    %0 = memref.load %arg0[%c0] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load2">} : memref<1000xi32>
    cf.br ^bb1(%c1, %0 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%1: index, %2: i32):  // 2 preds: ^bb0, ^bb1
    %c1000 = arith.constant {name = #handshake.name<"constant3">} 1000 : index
    %c1_0 = arith.constant {name = #handshake.name<"constant4">} 1 : index
    %3 = arith.muli %arg2, %2 {name = #handshake.name<"muli0">} : i32
    %4 = memref.load %arg1[%1] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load3">} : memref<1000xi32>
    %5 = arith.muli %arg3, %4 {name = #handshake.name<"muli1">} : i32
    %6 = arith.addi %3, %5 {name = #handshake.name<"addi0">} : i32
    memref.store %6, %arg0[%1] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"store1">} : memref<1000xi32>
    %7 = arith.addi %1, %c1_0 {name = #handshake.name<"addi1">} : index
    %8 = arith.cmpi ult, %7, %c1000 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %8, ^bb1(%7, %6 : index, i32), ^bb2 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %6 : i32
  }
}

