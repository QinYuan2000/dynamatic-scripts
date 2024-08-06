module {
  func.func @image_resize(%arg0: memref<900xi32>, %arg1: i32) {
    %c0 = arith.constant {name = #handshake.name<"constant0">} 0 : index
    %c30 = arith.constant {name = #handshake.name<"constant1">} 30 : index
    %c1 = arith.constant {name = #handshake.name<"constant2">} 1 : index
    %0 = scf.while (%arg2 = %c0) : (index) -> index {
      %1 = scf.while (%arg3 = %c0) : (index) -> index {
        %4 = arith.muli %arg2, %c30 {name = #handshake.name<"muli0">} : index
        %5 = arith.addi %arg3, %4 {name = #handshake.name<"addi0">} : index
        %6 = memref.load %arg0[%5] {deps = #handshake<deps[<"store2" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load2">} : memref<900xi32>
        %7 = arith.subi %arg1, %6 {name = #handshake.name<"subi0">} : i32
        %8 = arith.muli %arg2, %c30 {name = #handshake.name<"muli1">} : index
        %9 = arith.addi %arg3, %8 {name = #handshake.name<"addi1">} : index
        memref.store %7, %arg0[%9] {name = #handshake.name<"store2">} : memref<900xi32>
        %10 = arith.addi %arg3, %c1 {name = #handshake.name<"addi2">} : index
        %11 = arith.cmpi ult, %10, %c30 {name = #handshake.name<"cmpi0">} : index
        scf.condition(%11) {name = #handshake.name<"condition0">} %10 : index
      } do {
      ^bb0(%arg3: index):
        scf.yield {name = #handshake.name<"yield2">} %arg3 : index
      } attributes {name = #handshake.name<"while0">}
      %2 = arith.addi %arg2, %c1 {name = #handshake.name<"addi3">} : index
      %3 = arith.cmpi ult, %2, %c30 {name = #handshake.name<"cmpi1">} : index
      scf.condition(%3) {name = #handshake.name<"condition1">} %2 : index
    } do {
    ^bb0(%arg2: index):
      scf.yield {name = #handshake.name<"yield3">} %arg2 : index
    } attributes {name = #handshake.name<"while1">}
    return {name = #handshake.name<"return0">}
  }
}

