module {
  func.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>) {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c30 = arith.constant {name = #handshake.name<"constant2">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %0 = scf.while (%arg3 = %c0) : (index) -> index {
      %1 = scf.while (%arg4 = %c0) : (index) -> index {
        %4:2 = scf.while (%arg5 = %c0, %arg6 = %c0_i32) : (index, i32) -> (index, i32) {
          %9 = arith.muli %arg3, %c30 {name = #handshake.name<"muli1">} : index
          %10 = arith.addi %arg5, %9 {name = #handshake.name<"addi1">} : index
          %11 = memref.load %arg0[%10] {name = #handshake.name<"load4">} : memref<900xi32>
          %12 = arith.muli %arg5, %c30 {name = #handshake.name<"muli2">} : index
          %13 = arith.addi %arg4, %12 {name = #handshake.name<"addi2">} : index
          %14 = memref.load %arg1[%13] {name = #handshake.name<"load5">} : memref<900xi32>
          %15 = arith.muli %11, %14 {name = #handshake.name<"muli0">} : i32
          %16 = arith.addi %arg6, %15 {name = #handshake.name<"addi0">} : i32
          %17 = arith.addi %arg5, %c1 {name = #handshake.name<"addi4">} : index
          %18 = arith.cmpi ult, %17, %c30 {name = #handshake.name<"cmpi0">} : index
          scf.condition(%18) {name = #handshake.name<"condition0">} %17, %16 : index, i32
        } do {
        ^bb0(%arg5: index, %arg6: i32):
          scf.yield {name = #handshake.name<"yield4">} %arg5, %arg6 : index, i32
        } attributes {name = #handshake.name<"while0">}
        %5 = arith.muli %arg3, %c30 {name = #handshake.name<"muli3">} : index
        %6 = arith.addi %arg4, %5 {name = #handshake.name<"addi3">} : index
        memref.store %4#1, %arg2[%6] {name = #handshake.name<"store2">} : memref<900xi32>
        %7 = arith.addi %arg4, %c1 {name = #handshake.name<"addi5">} : index
        %8 = arith.cmpi ult, %7, %c30 {name = #handshake.name<"cmpi1">} : index
        scf.condition(%8) {name = #handshake.name<"condition1">} %7 : index
      } do {
      ^bb0(%arg4: index):
        scf.yield {name = #handshake.name<"yield5">} %arg4 : index
      } attributes {name = #handshake.name<"while1">}
      %2 = arith.addi %arg3, %c1 {name = #handshake.name<"addi6">} : index
      %3 = arith.cmpi ult, %2, %c30 {name = #handshake.name<"cmpi2">} : index
      scf.condition(%3) {name = #handshake.name<"condition2">} %2 : index
    } do {
    ^bb0(%arg3: index):
      scf.yield {name = #handshake.name<"yield6">} %arg3 : index
    } attributes {name = #handshake.name<"while2">}
    return {name = #handshake.name<"return0">}
  }
}

