module {
  func.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>) {
    %c0 = arith.constant {name = #handshake.name<"constant2">} 0 : index
    cf.br ^bb1(%c0 : index) {name = #handshake.name<"br0">}
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb3
    %c0_0 = arith.constant {name = #handshake.name<"constant4">} 0 : index
    cf.br ^bb2(%c0_0 : index) {name = #handshake.name<"br1">}
  ^bb2(%1: index):  // 2 preds: ^bb1, ^bb2
    %c4_i32 = arith.constant {name = #handshake.name<"constant5">} 4 : i32
    %c30 = arith.constant {name = #handshake.name<"constant6">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant7">} 1 : index
    %2 = arith.muli %0, %c30 {name = #handshake.name<"muli3">} : index
    %3 = arith.addi %1, %2 {name = #handshake.name<"addi0">} : index
    %4 = memref.load %arg2[%3] {deps = #handshake<deps[<"store6" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"load6">} : memref<900xi32>
    %5 = arith.subi %4, %arg0 {name = #handshake.name<"subi0">} : i32
    %6 = arith.muli %5, %arg1 {name = #handshake.name<"muli0">} : i32
    %7 = arith.shrsi %6, %c4_i32 {name = #handshake.name<"shrsi0">} : i32
    %8 = arith.muli %0, %c30 {name = #handshake.name<"muli4">} : index
    %9 = arith.addi %1, %8 {name = #handshake.name<"addi1">} : index
    memref.store %7, %arg2[%9] {mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"store6">} : memref<900xi32>
    %10 = arith.muli %0, %c30 {name = #handshake.name<"muli5">} : index
    %11 = arith.addi %1, %10 {name = #handshake.name<"addi2">} : index
    %12 = memref.load %arg4[%11] {deps = #handshake<deps[<"store7" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"load7">} : memref<900xi32>
    %13 = arith.subi %12, %arg0 {name = #handshake.name<"subi1">} : i32
    %14 = arith.muli %13, %arg1 {name = #handshake.name<"muli1">} : i32
    %15 = arith.shrsi %14, %c4_i32 {name = #handshake.name<"shrsi1">} : i32
    %16 = arith.muli %0, %c30 {name = #handshake.name<"muli6">} : index
    %17 = arith.addi %1, %16 {name = #handshake.name<"addi3">} : index
    memref.store %15, %arg4[%17] {mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"store7">} : memref<900xi32>
    %18 = arith.muli %0, %c30 {name = #handshake.name<"muli7">} : index
    %19 = arith.addi %1, %18 {name = #handshake.name<"addi4">} : index
    %20 = memref.load %arg3[%19] {deps = #handshake<deps[<"store8" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"load8">} : memref<900xi32>
    %21 = arith.subi %20, %arg0 {name = #handshake.name<"subi2">} : i32
    %22 = arith.muli %21, %arg1 {name = #handshake.name<"muli2">} : i32
    %23 = arith.shrsi %22, %c4_i32 {name = #handshake.name<"shrsi2">} : i32
    %24 = arith.muli %0, %c30 {name = #handshake.name<"muli8">} : index
    %25 = arith.addi %1, %24 {name = #handshake.name<"addi5">} : index
    memref.store %23, %arg3[%25] {mem_interface = #handshake.mem_interface<LSQ: 0>, name = #handshake.name<"store8">} : memref<900xi32>
    %26 = arith.addi %1, %c1 {name = #handshake.name<"addi6">} : index
    %27 = arith.cmpi ult, %26, %c30 {name = #handshake.name<"cmpi0">} : index
    cf.cond_br %27, ^bb2(%26 : index), ^bb3 {name = #handshake.name<"cond_br0">}
  ^bb3:  // pred: ^bb2
    %c30_1 = arith.constant {name = #handshake.name<"constant8">} 30 : index
    %c1_2 = arith.constant {name = #handshake.name<"constant9">} 1 : index
    %28 = arith.addi %0, %c1_2 {name = #handshake.name<"addi7">} : index
    %29 = arith.cmpi ult, %28, %c30_1 {name = #handshake.name<"cmpi1">} : index
    cf.cond_br %29, ^bb1(%28 : index), ^bb4 {name = #handshake.name<"cond_br1">}
  ^bb4:  // pred: ^bb3
    return {name = #handshake.name<"return0">}
  }
}

