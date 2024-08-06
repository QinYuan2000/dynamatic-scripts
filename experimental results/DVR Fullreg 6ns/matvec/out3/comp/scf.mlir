module {
  func.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>) -> i32 {
    %c0_i32 = arith.constant {name = #handshake.name<"constant0">} 0 : i32
    %c0 = arith.constant {name = #handshake.name<"constant1">} 0 : index
    %c100 = arith.constant {name = #handshake.name<"constant2">} 100 : index
    %c1 = arith.constant {name = #handshake.name<"constant3">} 1 : index
    %0:2 = scf.while (%arg3 = %c0, %arg4 = %c0_i32) : (index, i32) -> (index, i32) {
      %1:2 = scf.while (%arg5 = %c0, %arg6 = %c0_i32) : (index, i32) -> (index, i32) {
        %4 = memref.load %arg1[%arg5] {name = #handshake.name<"load2">} : memref<100xi32>
        %5 = arith.muli %arg3, %c100 {name = #handshake.name<"muli1">} : index
        %6 = arith.addi %arg5, %5 {name = #handshake.name<"addi1">} : index
        %7 = memref.load %arg0[%6] {name = #handshake.name<"load4">} : memref<10000xi32>
        %8 = arith.muli %4, %7 {name = #handshake.name<"muli0">} : i32
        %9 = arith.addi %arg6, %8 {name = #handshake.name<"addi0">} : i32
        %10 = arith.addi %arg5, %c1 {name = #handshake.name<"addi2">} : index
        %11 = arith.cmpi ult, %10, %c100 {name = #handshake.name<"cmpi0">} : index
        scf.condition(%11) {name = #handshake.name<"condition0">} %10, %9 : index, i32
      } do {
      ^bb0(%arg5: index, %arg6: i32):
        scf.yield {name = #handshake.name<"yield4">} %arg5, %arg6 : index, i32
      } attributes {name = #handshake.name<"while0">}
      memref.store %1#1, %arg2[%arg3] {name = #handshake.name<"store1">} : memref<100xi32>
      %2 = arith.addi %arg3, %c1 {name = #handshake.name<"addi3">} : index
      %3 = arith.cmpi ult, %2, %c100 {name = #handshake.name<"cmpi1">} : index
      scf.condition(%3) {name = #handshake.name<"condition1">} %2, %1#1 : index, i32
    } do {
    ^bb0(%arg3: index, %arg4: i32):
      scf.yield {name = #handshake.name<"yield5">} %arg3, %arg4 : index, i32
    } attributes {name = #handshake.name<"while1">}
    return {name = #handshake.name<"return0">} %0#1 : i32
  }
}

