module {
  func.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant1">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant3">} 0 : index
    %0 = arith.index_cast %arg1 {name = #handshake.name<"index_cast0">} : i32 to index
    cf.br ^bb1(%c0, %c0_i32 : index, i32) {name = #handshake.name<"br0">}
  ^bb1(%1: index, %2: i32):  // 2 preds: ^bb0, ^bb2
    %3 = arith.cmpi ult, %1, %0 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %3, ^bb2, ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb2:  // pred: ^bb1
    %c1 = arith.constant {name = #handshake.name<"constant5">} 1 : index
    %c10_i32 = arith.constant {name = #handshake.name<"constant6">} 10 : i32
    %c0_i32_0 = arith.constant {name = #handshake.name<"constant7">} 0 : i32
    %c2_i32 = arith.constant {name = #handshake.name<"constant8">} 2 : i32
    %4 = memref.load %arg0[%1] {mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"load1">} : memref<100xi32>
    %5 = arith.shli %4, %c2_i32 {name = #handshake.name<"shli0">} : i32
    %6 = arith.addi %4, %5 {name = #handshake.name<"addi2">} : i32
    %7 = arith.cmpi sgt, %6, %c10_i32 {name = #handshake.name<"cmpi0">} : i32
    %8 = arith.select %7, %6, %c0_i32_0 {name = #handshake.name<"select0">} : i32
    %9 = arith.addi %2, %8 {name = #handshake.name<"addi1">} : i32
    %10 = arith.addi %1, %c1 {name = #handshake.name<"addi0">} : index
    cf.br ^bb1(%10, %9 : index, i32) {name = #handshake.name<"br1">}
  ^bb3:  // pred: ^bb1
    return {name = #handshake.name<"return0">} %2 : i32
  }
}

