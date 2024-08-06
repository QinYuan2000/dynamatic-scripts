module {
  handshake.func @sumi3_mem(%arg0: memref<1000xi32>, %arg1: none, ...) -> i32 attributes {argNames = ["a", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (index) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %2 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = 0 : i32} : i32
    %3 = br %1 {bb = 0 : ui32, name = #handshake.name<"br1">} : index
    %4 = br %2 {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %5 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %6 = mux %index [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %7 = mux %index [%trueResult_0, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %result, %index = control_merge %trueResult_2, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %8 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %9 = constant %8 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : index} : index
    %10 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %11 = constant %10 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : index} : index
    %addressResult, %dataResult = mc_load[%6] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %12 = arith.muli %dataResult, %dataResult {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %13 = arith.muli %12, %dataResult {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %14 = arith.addi %7, %13 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %15 = arith.addi %6, %11 {bb = 1 : ui32, name = #handshake.name<"addi1">} : index
    %16 = arith.cmpi ult, %15, %9 {bb = 1 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %16, %15 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : index
    %trueResult_0, %falseResult_1 = cond_br %16, %14 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_2, %falseResult_3 = cond_br %16, %result {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    %17 = merge %falseResult_1 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %result_4, %index_5 = control_merge %falseResult_3 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %18 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %17 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %18, %done : i32, none
  }
}

