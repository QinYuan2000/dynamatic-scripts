module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (index) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %14, %addressResult_4, %dataResult_5) {connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (index, i32, index, i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg4 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3 = constant %2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = 0 : index} : index
    %4 = constant %2 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : index} : index
    %addressResult, %dataResult = mc_load[%3] %memOutputs_0 {bb = 0 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %5 = br %4 {bb = 0 : ui32, name = #handshake.name<"br1">} : index
    %6 = br %dataResult {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %7 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %8 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %9 = br %2 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %10 = mux %index [%trueResult, %5] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %11 = mux %index [%trueResult_6, %6] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %12 = mux %index [%trueResult_8, %7] {bb = 1 : ui32, name = #handshake.name<"mux2">} : index, i32
    %13 = mux %index [%trueResult_10, %8] {bb = 1 : ui32, name = #handshake.name<"mux3">} : index, i32
    %result, %index = control_merge %trueResult_12, %9 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %14 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i32} : i32
    %15 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %16 = constant %15 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : index} : index
    %17 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %18 = constant %17 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : index} : index
    %19 = arith.muli %12, %11 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%10] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : index, i32
    %20 = arith.muli %13, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %21 = arith.addi %19, %20 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%10] %21 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, index
    %22 = arith.addi %10, %18 {bb = 1 : ui32, name = #handshake.name<"addi1">} : index
    %23 = arith.cmpi ult, %22, %16 {bb = 1 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %23, %22 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : index
    %trueResult_6, %falseResult_7 = cond_br %23, %21 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_8, %falseResult_9 = cond_br %23, %12 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_10, %falseResult_11 = cond_br %23, %13 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_12, %falseResult_13 = cond_br %23, %result {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    %24 = merge %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %result_14, %index_15 = control_merge %falseResult_13 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %25 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %24 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %25, %done, %done_1 : i32, none, none
  }
}

