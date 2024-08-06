module {
  handshake.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (index) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge1">} : none
    %2 = constant %1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : i32} : i32
    %3 = constant %1 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = 0 : index} : index
    %4 = arith.index_cast %0 {bb = 0 : ui32, name = #handshake.name<"index_cast0">} : i32 to index
    %5 = br %3 {bb = 0 : ui32, name = #handshake.name<"br2">} : index
    %6 = br %2 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %7 = br %4 {bb = 0 : ui32, name = #handshake.name<"br4">} : index
    %8 = br %1 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %9 = mux %index [%30, %5] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %10 = mux %index [%31, %6] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %11 = mux %index [%32, %7] {bb = 1 : ui32, name = #handshake.name<"mux2">} : index, index
    %result, %index = control_merge %33, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %12 = arith.cmpi ult, %9, %11 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : index
    %trueResult, %falseResult = cond_br %12, %11 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : index
    %trueResult_0, %falseResult_1 = cond_br %12, %9 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : index
    %trueResult_2, %falseResult_3 = cond_br %12, %10 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %12, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    %13 = merge %trueResult {bb = 2 : ui32, name = #handshake.name<"merge2">} : index
    %14 = merge %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"merge3">} : index
    %15 = merge %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %result_6, %index_7 = control_merge %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %16 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %17 = constant %16 {bb = 2 : ui32, name = #handshake.name<"constant4">, value = 1 : index} : index
    %18 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %19 = constant %18 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 10 : i32} : i32
    %20 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %21 = constant %20 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 0 : i32} : i32
    %22 = source {bb = 2 : ui32, name = #handshake.name<"source3">}
    %23 = constant %22 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 2 : i32} : i32
    %addressResult, %dataResult = mc_load[%14] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %24 = arith.shli %dataResult, %23 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %25 = arith.addi %dataResult, %24 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %26 = arith.cmpi sgt, %25, %19 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %27 = arith.select %26, %25, %21 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %28 = arith.addi %15, %27 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %29 = arith.addi %14, %17 {bb = 2 : ui32, name = #handshake.name<"addi0">} : index
    %30 = br %29 {bb = 2 : ui32, name = #handshake.name<"br6">} : index
    %31 = br %28 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %32 = br %13 {bb = 2 : ui32, name = #handshake.name<"br8">} : index
    %33 = br %result_6 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %34 = merge %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %result_8, %index_9 = control_merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"control_merge2">} : none, index
    %35 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %34 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %35, %done : i32, none
  }
}

