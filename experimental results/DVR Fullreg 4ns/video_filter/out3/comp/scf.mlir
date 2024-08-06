module {
  func.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>) {
    %c4_i32 = arith.constant {name = #handshake.name<"constant0">} 4 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c30 = arith.constant {name = #handshake.name<"constant2">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %0 = scf.while (%arg5 = %c0) : (index) -> index {
      %1 = scf.while (%arg6 = %c0) : (index) -> index {
        %4 = arith.muli %arg5, %c30 {name = #handshake.name<"muli3">} : index
        %5 = arith.addi %arg6, %4 {name = #handshake.name<"addi0">} : index
        %6 = memref.load %arg2[%5] {deps = #handshake<deps[<"store6" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load6">} : memref<900xi32>
        %7 = arith.subi %6, %arg0 {name = #handshake.name<"subi0">} : i32
        %8 = arith.muli %7, %arg1 {name = #handshake.name<"muli0">} : i32
        %9 = arith.shrsi %8, %c4_i32 {name = #handshake.name<"shrsi0">} : i32
        %10 = arith.muli %arg5, %c30 {name = #handshake.name<"muli4">} : index
        %11 = arith.addi %arg6, %10 {name = #handshake.name<"addi1">} : index
        memref.store %9, %arg2[%11] {name = #handshake.name<"store6">} : memref<900xi32>
        %12 = arith.muli %arg5, %c30 {name = #handshake.name<"muli5">} : index
        %13 = arith.addi %arg6, %12 {name = #handshake.name<"addi2">} : index
        %14 = memref.load %arg4[%13] {deps = #handshake<deps[<"store7" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load7">} : memref<900xi32>
        %15 = arith.subi %14, %arg0 {name = #handshake.name<"subi1">} : i32
        %16 = arith.muli %15, %arg1 {name = #handshake.name<"muli1">} : i32
        %17 = arith.shrsi %16, %c4_i32 {name = #handshake.name<"shrsi1">} : i32
        %18 = arith.muli %arg5, %c30 {name = #handshake.name<"muli6">} : index
        %19 = arith.addi %arg6, %18 {name = #handshake.name<"addi3">} : index
        memref.store %17, %arg4[%19] {name = #handshake.name<"store7">} : memref<900xi32>
        %20 = arith.muli %arg5, %c30 {name = #handshake.name<"muli7">} : index
        %21 = arith.addi %arg6, %20 {name = #handshake.name<"addi4">} : index
        %22 = memref.load %arg3[%21] {deps = #handshake<deps[<"store8" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load8">} : memref<900xi32>
        %23 = arith.subi %22, %arg0 {name = #handshake.name<"subi2">} : i32
        %24 = arith.muli %23, %arg1 {name = #handshake.name<"muli2">} : i32
        %25 = arith.shrsi %24, %c4_i32 {name = #handshake.name<"shrsi2">} : i32
        %26 = arith.muli %arg5, %c30 {name = #handshake.name<"muli8">} : index
        %27 = arith.addi %arg6, %26 {name = #handshake.name<"addi5">} : index
        memref.store %25, %arg3[%27] {name = #handshake.name<"store8">} : memref<900xi32>
        %28 = arith.addi %arg6, %c1 {name = #handshake.name<"addi6">} : index
        %29 = arith.cmpi ult, %28, %c30 {name = #handshake.name<"cmpi0">} : index
        scf.condition(%29) {name = #handshake.name<"condition0">} %28 : index
      } do {
      ^bb0(%arg6: index):
        scf.yield {name = #handshake.name<"yield2">} %arg6 : index
      } attributes {name = #handshake.name<"while0">}
      %2 = arith.addi %arg5, %c1 {name = #handshake.name<"addi7">} : index
      %3 = arith.cmpi ult, %2, %c30 {name = #handshake.name<"cmpi1">} : index
      scf.condition(%3) {name = #handshake.name<"condition1">} %2 : index
    } do {
    ^bb0(%arg5: index):
      scf.yield {name = #handshake.name<"yield3">} %arg5 : index
    } attributes {name = #handshake.name<"while1">}
    return {name = #handshake.name<"return0">}
  }
}

