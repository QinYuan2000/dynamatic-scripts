module {
  handshake.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: none, ...) -> i32 attributes {argNames = ["di", "idx", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (index) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller1">} : (index) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %2 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = 0 : i32} : i32
    %3 = br %1 {bb = 0 : ui32, name = #handshake.name<"br1">} : index
    %4 = br %2 {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %5 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %6 = mux %index [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %7 = mux %index [%trueResult_4, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %result, %index = control_merge %trueResult_6, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %8 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %9 = constant %8 {bb = 1 : ui32, name = #handshake.name<"constant4">, value = 999 : index} : index
    %10 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %11 = constant %10 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1000 : index} : index
    %12 = source {bb = 1 : ui32, name = #handshake.name<"source2">}
    %13 = constant %12 {bb = 1 : ui32, name = #handshake.name<"constant9">, value = 1 : index} : index
    %addressResult, %dataResult = mc_load[%6] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %14 = arith.subi %9, %6 {bb = 1 : ui32, name = #handshake.name<"subi0">} : index
    %addressResult_2, %dataResult_3 = mc_load[%14] %memOutputs_0 {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : index, i32
    %15 = arith.muli %dataResult, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %16 = arith.addi %7, %15 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %17 = arith.addi %6, %13 {bb = 1 : ui32, name = #handshake.name<"addi2">} : index
    %18 = arith.cmpi ult, %17, %11 {bb = 1 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %18, %17 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : index
    %trueResult_4, %falseResult_5 = cond_br %18, %16 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_6, %falseResult_7 = cond_br %18, %result {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    %19 = merge %falseResult_5 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %result_8, %index_9 = control_merge %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %20 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %19 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %20, %done, %done_1 : i32, none, none
  }
}

