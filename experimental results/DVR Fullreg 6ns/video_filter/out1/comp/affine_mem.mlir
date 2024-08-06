module {
  func.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<30x30xi32>, %arg3: memref<30x30xi32>, %arg4: memref<30x30xi32>) {
    %c4_i32 = arith.constant {name = #handshake.name<"constant0">} 4 : i32
    affine.for %arg5 = 0 to 30 {
      affine.for %arg6 = 0 to 30 {
        %0 = affine.load %arg2[%arg5, %arg6] {deps = #handshake<deps[<"store0" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load0">} : memref<30x30xi32>
        %1 = arith.subi %0, %arg0 {name = #handshake.name<"subi0">} : i32
        %2 = arith.muli %1, %arg1 {name = #handshake.name<"muli0">} : i32
        %3 = arith.shrsi %2, %c4_i32 {name = #handshake.name<"shrsi0">} : i32
        affine.store %3, %arg2[%arg5, %arg6] {name = #handshake.name<"store0">} : memref<30x30xi32>
        %4 = affine.load %arg4[%arg5, %arg6] {deps = #handshake<deps[<"store1" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load1">} : memref<30x30xi32>
        %5 = arith.subi %4, %arg0 {name = #handshake.name<"subi1">} : i32
        %6 = arith.muli %5, %arg1 {name = #handshake.name<"muli1">} : i32
        %7 = arith.shrsi %6, %c4_i32 {name = #handshake.name<"shrsi1">} : i32
        affine.store %7, %arg4[%arg5, %arg6] {name = #handshake.name<"store1">} : memref<30x30xi32>
        %8 = affine.load %arg3[%arg5, %arg6] {deps = #handshake<deps[<"store2" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load2">} : memref<30x30xi32>
        %9 = arith.subi %8, %arg0 {name = #handshake.name<"subi2">} : i32
        %10 = arith.muli %9, %arg1 {name = #handshake.name<"muli2">} : i32
        %11 = arith.shrsi %10, %c4_i32 {name = #handshake.name<"shrsi2">} : i32
        affine.store %11, %arg3[%arg5, %arg6] {name = #handshake.name<"store2">} : memref<30x30xi32>
      } {name = #handshake.name<"for0">}
    } {name = #handshake.name<"for1">}
    return {name = #handshake.name<"return0">}
  }
}

