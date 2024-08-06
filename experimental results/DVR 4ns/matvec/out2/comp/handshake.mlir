module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%26, %addressResult_15, %dataResult_16) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, index, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (index) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (index) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %2 = br %1 {bb = 0 : ui32, name = #handshake.name<"br2">} : index
    %3 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %4 = mux %index [%trueResult_17, %2] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %result, %index = control_merge %trueResult_19, %3 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %5 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant1">, value = 0 : i32} : i32
    %6 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant3">, value = 0 : index} : index
    %7 = br %6 {bb = 1 : ui32, name = #handshake.name<"br4">} : index
    %8 = br %5 {bb = 1 : ui32, name = #handshake.name<"br5">} : i32
    %9 = br %4 {bb = 1 : ui32, name = #handshake.name<"br6">} : index
    %10 = br %result {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %11 = mux %index_4 [%trueResult, %7] {bb = 2 : ui32, name = #handshake.name<"mux1">} : index, index
    %12 = mux %index_4 [%trueResult_7, %8] {bb = 2 : ui32, name = #handshake.name<"mux2">} : index, i32
    %13 = mux %index_4 [%trueResult_9, %9] {bb = 2 : ui32, name = #handshake.name<"mux3">} : index, index
    %result_3, %index_4 = control_merge %trueResult_11, %10 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %14 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %15 = constant %14 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : index} : index
    %16 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %17 = constant %16 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : index} : index
    %addressResult, %dataResult = mc_load[%11] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %18 = arith.muli %13, %15 {bb = 2 : ui32, name = #handshake.name<"muli1">} : index
    %19 = arith.addi %11, %18 {bb = 2 : ui32, name = #handshake.name<"addi1">} : index
    %addressResult_5, %dataResult_6 = mc_load[%19] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : index, i32
    %20 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %21 = arith.addi %12, %20 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %22 = arith.addi %11, %17 {bb = 2 : ui32, name = #handshake.name<"addi2">} : index
    %23 = arith.cmpi ult, %22, %15 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %23, %22 {bb = 2 : ui32, name = #handshake.name<"cond_br2">} : index
    %trueResult_7, %falseResult_8 = cond_br %23, %21 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %23, %13 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : index
    %trueResult_11, %falseResult_12 = cond_br %23, %result_3 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %24 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge1">} : index
    %25 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %result_13, %index_14 = control_merge %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"control_merge2">} : none, index
    %26 = constant %result_13 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i32} : i32
    %27 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %28 = constant %27 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : index} : index
    %29 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %30 = constant %29 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : index} : index
    %addressResult_15, %dataResult_16 = mc_store[%24] %25 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, index
    %31 = arith.addi %24, %30 {bb = 3 : ui32, name = #handshake.name<"addi3">} : index
    %32 = arith.cmpi ult, %31, %28 {bb = 3 : ui32, name = #handshake.name<"cmpi1">} : index
    %trueResult_17, %falseResult_18 = cond_br %32, %31 {bb = 3 : ui32, name = #handshake.name<"cond_br6">} : index
    %trueResult_19, %falseResult_20 = cond_br %32, %result_13 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %trueResult_21, %falseResult_22 = cond_br %32, %25 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    %33 = merge %falseResult_22 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %result_23, %index_24 = control_merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"control_merge3">} : none, index
    %34 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %33 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %34, %done, %done_0, %done_2 : i32, none, none, none
  }
}

