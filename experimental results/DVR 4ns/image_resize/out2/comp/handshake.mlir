module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = lsq[%arg0 : memref<900xi32>] (%result_0, %addressResult, %addressResult_2, %dataResult_3)  {groupSizes = [2 : i32], name = #handshake.name<"lsq0">} : (none, index, index, i32) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge1">} : none
    %2 = constant %1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %3 = br %2 {bb = 0 : ui32, name = #handshake.name<"br2">} : index
    %4 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %5 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %6 = mux %index [%trueResult_12, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %7 = mux %index [%trueResult_14, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %result, %index = control_merge %trueResult_16, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %8 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant1">, value = 0 : index} : index
    %9 = br %8 {bb = 1 : ui32, name = #handshake.name<"br5">} : index
    %10 = br %7 {bb = 1 : ui32, name = #handshake.name<"br6">} : i32
    %11 = br %6 {bb = 1 : ui32, name = #handshake.name<"br7">} : index
    %12 = br %result {bb = 1 : ui32, name = #handshake.name<"br8">} : none
    %13 = mux %index_1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux2">} : index, index
    %14 = mux %index_1 [%trueResult_4, %10] {bb = 2 : ui32, name = #handshake.name<"mux3">} : index, i32
    %15 = mux %index_1 [%trueResult_6, %11] {bb = 2 : ui32, name = #handshake.name<"mux4">} : index, index
    %result_0, %index_1 = control_merge %trueResult_8, %12 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %16 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %17 = constant %16 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : index} : index
    %18 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %19 = constant %18 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : index} : index
    %20 = arith.muli %15, %17 {bb = 2 : ui32, name = #handshake.name<"muli0">} : index
    %21 = arith.addi %13, %20 {bb = 2 : ui32, name = #handshake.name<"addi0">} : index
    %addressResult, %dataResult = lsq_load[%21] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"lsq_store0" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"lsq_load0">} : index, i32
    %22 = arith.subi %14, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %23 = arith.muli %15, %17 {bb = 2 : ui32, name = #handshake.name<"muli1">} : index
    %24 = arith.addi %13, %23 {bb = 2 : ui32, name = #handshake.name<"addi1">} : index
    %addressResult_2, %dataResult_3 = lsq_store[%24] %22 {bb = 2 : ui32, name = #handshake.name<"lsq_store0">} : i32, index
    %25 = arith.addi %13, %19 {bb = 2 : ui32, name = #handshake.name<"addi2">} : index
    %26 = arith.cmpi ult, %25, %17 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %26, %25 {bb = 2 : ui32, name = #handshake.name<"cond_br2">} : index
    %trueResult_4, %falseResult_5 = cond_br %26, %14 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %26, %15 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : index
    %trueResult_8, %falseResult_9 = cond_br %26, %result_0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %27 = merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %28 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge3">} : index
    %result_10, %index_11 = control_merge %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"control_merge2">} : none, index
    %29 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %30 = constant %29 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : index} : index
    %31 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %32 = constant %31 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : index} : index
    %33 = arith.addi %28, %32 {bb = 3 : ui32, name = #handshake.name<"addi3">} : index
    %34 = arith.cmpi ult, %33, %30 {bb = 3 : ui32, name = #handshake.name<"cmpi1">} : index
    %trueResult_12, %falseResult_13 = cond_br %34, %33 {bb = 3 : ui32, name = #handshake.name<"cond_br6">} : index
    %trueResult_14, %falseResult_15 = cond_br %34, %27 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    %trueResult_16, %falseResult_17 = cond_br %34, %result_10 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %result_18, %index_19 = control_merge %falseResult_17 {bb = 4 : ui32, name = #handshake.name<"control_merge3">} : none, index
    %35 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %result_18 : none
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %35, %done : none, none
  }
}

