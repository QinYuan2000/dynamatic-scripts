module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%37, %addressResult_19, %dataResult_20) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, index, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (index) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (index) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1 = constant %0 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %2 = br %1 {bb = 0 : ui32, name = #handshake.name<"br3">} : index
    %3 = br %0 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %4 = mux %index [%trueResult_29, %2] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %result, %index = control_merge %trueResult_31, %3 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %5 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant1">, value = 0 : index} : index
    %6 = br %5 {bb = 1 : ui32, name = #handshake.name<"br5">} : index
    %7 = br %4 {bb = 1 : ui32, name = #handshake.name<"br6">} : index
    %8 = br %result {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %9 = mux %index_4 [%trueResult_21, %6] {bb = 2 : ui32, name = #handshake.name<"mux1">} : index, index
    %10 = mux %index_4 [%trueResult_23, %7] {bb = 2 : ui32, name = #handshake.name<"mux2">} : index, index
    %result_3, %index_4 = control_merge %trueResult_25, %8 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %11 = constant %result_3 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 0 : i32} : i32
    %12 = constant %result_3 {bb = 2 : ui32, name = #handshake.name<"constant13">, value = 0 : index} : index
    %13 = br %12 {bb = 2 : ui32, name = #handshake.name<"br8">} : index
    %14 = br %11 {bb = 2 : ui32, name = #handshake.name<"br9">} : i32
    %15 = br %10 {bb = 2 : ui32, name = #handshake.name<"br10">} : index
    %16 = br %9 {bb = 2 : ui32, name = #handshake.name<"br11">} : index
    %17 = br %result_3 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %18 = mux %index_6 [%trueResult, %13] {bb = 3 : ui32, name = #handshake.name<"mux3">} : index, index
    %19 = mux %index_6 [%trueResult_9, %14] {bb = 3 : ui32, name = #handshake.name<"mux4">} : index, i32
    %20 = mux %index_6 [%trueResult_11, %15] {bb = 3 : ui32, name = #handshake.name<"mux5">} : index, index
    %21 = mux %index_6 [%trueResult_13, %16] {bb = 3 : ui32, name = #handshake.name<"mux6">} : index, index
    %result_5, %index_6 = control_merge %trueResult_15, %17 {bb = 3 : ui32, name = #handshake.name<"control_merge2">} : none, index
    %22 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %23 = constant %22 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : index} : index
    %24 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %25 = constant %24 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : index} : index
    %26 = arith.muli %20, %23 {bb = 3 : ui32, name = #handshake.name<"muli1">} : index
    %27 = arith.addi %18, %26 {bb = 3 : ui32, name = #handshake.name<"addi1">} : index
    %addressResult, %dataResult = mc_load[%27] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : index, i32
    %28 = arith.muli %18, %23 {bb = 3 : ui32, name = #handshake.name<"muli2">} : index
    %29 = arith.addi %21, %28 {bb = 3 : ui32, name = #handshake.name<"addi2">} : index
    %addressResult_7, %dataResult_8 = mc_load[%29] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : index, i32
    %30 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %31 = arith.addi %19, %30 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %32 = arith.addi %18, %25 {bb = 3 : ui32, name = #handshake.name<"addi4">} : index
    %33 = arith.cmpi ult, %32, %23 {bb = 3 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %33, %32 {bb = 3 : ui32, name = #handshake.name<"cond_br3">} : index
    %trueResult_9, %falseResult_10 = cond_br %33, %31 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %33, %20 {bb = 3 : ui32, name = #handshake.name<"cond_br5">} : index
    %trueResult_13, %falseResult_14 = cond_br %33, %21 {bb = 3 : ui32, name = #handshake.name<"cond_br6">} : index
    %trueResult_15, %falseResult_16 = cond_br %33, %result_5 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %34 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge1">} : index
    %35 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge2">} : index
    %36 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %result_17, %index_18 = control_merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"control_merge3">} : none, index
    %37 = constant %result_17 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i32} : i32
    %38 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %39 = constant %38 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : index} : index
    %40 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %41 = constant %40 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : index} : index
    %42 = arith.muli %34, %39 {bb = 4 : ui32, name = #handshake.name<"muli3">} : index
    %43 = arith.addi %35, %42 {bb = 4 : ui32, name = #handshake.name<"addi3">} : index
    %addressResult_19, %dataResult_20 = mc_store[%43] %36 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, index
    %44 = arith.addi %35, %41 {bb = 4 : ui32, name = #handshake.name<"addi5">} : index
    %45 = arith.cmpi ult, %44, %39 {bb = 4 : ui32, name = #handshake.name<"cmpi1">} : index
    %trueResult_21, %falseResult_22 = cond_br %45, %44 {bb = 4 : ui32, name = #handshake.name<"cond_br8">} : index
    %trueResult_23, %falseResult_24 = cond_br %45, %34 {bb = 4 : ui32, name = #handshake.name<"cond_br9">} : index
    %trueResult_25, %falseResult_26 = cond_br %45, %result_17 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %46 = merge %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"merge4">} : index
    %result_27, %index_28 = control_merge %falseResult_26 {bb = 5 : ui32, name = #handshake.name<"control_merge4">} : none, index
    %47 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %48 = constant %47 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : index} : index
    %49 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %50 = constant %49 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : index} : index
    %51 = arith.addi %46, %50 {bb = 5 : ui32, name = #handshake.name<"addi6">} : index
    %52 = arith.cmpi ult, %51, %48 {bb = 5 : ui32, name = #handshake.name<"cmpi2">} : index
    %trueResult_29, %falseResult_30 = cond_br %52, %51 {bb = 5 : ui32, name = #handshake.name<"cond_br11">} : index
    %trueResult_31, %falseResult_32 = cond_br %52, %result_27 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %result_33, %index_34 = control_merge %falseResult_32 {bb = 6 : ui32, name = #handshake.name<"control_merge5">} : none, index
    %53 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %result_33 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %53, %done, %done_0, %done_2 : none, none, none, none
  }
}

