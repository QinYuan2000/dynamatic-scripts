module {
  func.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32) -> i32 {
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %c0 = arith.constant {name = #handshake.name<"constant2">} 0 : index
    %c10_i32 = arith.constant {name = #handshake.name<"constant0">} 10 : i32
    %c0_i32 = arith.constant {name = #handshake.name<"constant1">} 0 : i32
    %0 = arith.index_cast %arg1 {name = #handshake.name<"index_cast0">} : i32 to index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%1: index, %2: i32):  // 2 preds: ^bb0, ^bb2
    %3 = arith.cmpi ult, %1, %0 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %3, ^bb2, ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    %4 = memref.load %arg0[%1] {name = #handshake.name<"load1">} : memref<100xi32>
    %5 = arith.cmpi sgt, %4, %c10_i32 {name = #handshake.name<"cmpi0">} : i32
    %6 = arith.select %5, %4, %c0_i32 {name = #handshake.name<"select0">} : i32
    %7 = arith.addi %2, %6 {name = #handshake.name<"addi1">} : i32
    %8 = arith.addi %1, %c1 {name = #handshake.name<"addi0">} : index
    cf.br ^bb1(%8, %7 : index, i32) {name = #handshake.name<"br1">}
  ^bb3:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %2 : i32
  }
}

