module {
  func.func @image_resize(%arg0: memref<30x30xi32>, %arg1: i32) {
    affine.for %arg2 = 0 to 30 {
      affine.for %arg3 = 0 to 30 {
        %0 = affine.load %arg0[%arg2, %arg3] {deps = #handshake<deps[<"store0" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"load0">} : memref<30x30xi32>
        %1 = arith.subi %arg1, %0 {name = #handshake.name<"subi0">} : i32
        affine.store %1, %arg0[%arg2, %arg3] {name = #handshake.name<"store0">} : memref<30x30xi32>
      } {name = #handshake.name<"for0">}
    } {name = #handshake.name<"for1">}
    return {name = #handshake.name<"return0">}
  }
}

