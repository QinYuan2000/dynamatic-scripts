module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = lsq[%arg4 : memref<900xi32>] (%result_4, %addressResult_8, %addressResult_10, %dataResult_11)  {groupSizes = [2 : i32], name = #handshake.name<"lsq0">} : (none, index, index, i32) -> (i32, none)
    %memOutputs_0, %done_1 = lsq[%arg3 : memref<900xi32>] (%result_4, %addressResult_12, %addressResult_14, %dataResult_15)  {groupSizes = [2 : i32], name = #handshake.name<"lsq1">} : (none, index, index, i32) -> (i32, none)
    %memOutputs_2, %done_3 = lsq[%arg2 : memref<900xi32>] (%result_4, %addressResult, %addressResult_6, %dataResult_7)  {groupSizes = [2 : i32], name = #handshake.name<"lsq2">} : (none, index, index, i32) -> (i32, none)
    %0 = merge %arg0 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg5 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3 = constant %2 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = 0 : index} : index
    %4 = br %3 {bb = 0 : ui32, name = #handshake.name<"br2">} : index
    %5 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %6 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %7 = br %2 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %8 = mux %index [%trueResult_26, %4] {bb = 1 : ui32, name = #handshake.name<"mux0">} : index, index
    %9 = mux %index [%trueResult_28, %5] {bb = 1 : ui32, name = #handshake.name<"mux1">} : index, i32
    %10 = mux %index [%trueResult_30, %6] {bb = 1 : ui32, name = #handshake.name<"mux2">} : index, i32
    %result, %index = control_merge %trueResult_32, %7 {bb = 1 : ui32, name = #handshake.name<"control_merge0">} : none, index
    %11 = constant %result {bb = 1 : ui32, name = #handshake.name<"constant1">, value = 0 : index} : index
    %12 = br %11 {bb = 1 : ui32, name = #handshake.name<"br6">} : index
    %13 = br %9 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %14 = br %10 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %15 = br %8 {bb = 1 : ui32, name = #handshake.name<"br9">} : index
    %16 = br %result {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %17 = mux %index_5 [%trueResult, %12] {bb = 2 : ui32, name = #handshake.name<"mux3">} : index, index
    %18 = mux %index_5 [%trueResult_16, %13] {bb = 2 : ui32, name = #handshake.name<"mux4">} : index, i32
    %19 = mux %index_5 [%trueResult_18, %14] {bb = 2 : ui32, name = #handshake.name<"mux5">} : index, i32
    %20 = mux %index_5 [%trueResult_20, %15] {bb = 2 : ui32, name = #handshake.name<"mux6">} : index, index
    %result_4, %index_5 = control_merge %trueResult_22, %16 {bb = 2 : ui32, name = #handshake.name<"control_merge1">} : none, index
    %21 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %22 = constant %21 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i32} : i32
    %23 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %24 = constant %23 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : index} : index
    %25 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %26 = constant %25 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : index} : index
    %27 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli3">} : index
    %28 = arith.addi %17, %27 {bb = 2 : ui32, name = #handshake.name<"addi0">} : index
    %addressResult, %dataResult = lsq_load[%28] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"lsq_store0" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"lsq_load0">} : index, i32
    %29 = arith.subi %dataResult, %18 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %30 = arith.muli %29, %19 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %31 = arith.shrsi %30, %22 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %32 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli4">} : index
    %33 = arith.addi %17, %32 {bb = 2 : ui32, name = #handshake.name<"addi1">} : index
    %addressResult_6, %dataResult_7 = lsq_store[%33] %31 {bb = 2 : ui32, name = #handshake.name<"lsq_store0">} : i32, index
    %34 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli5">} : index
    %35 = arith.addi %17, %34 {bb = 2 : ui32, name = #handshake.name<"addi2">} : index
    %addressResult_8, %dataResult_9 = lsq_load[%35] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"lsq_store1" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"lsq_load1">} : index, i32
    %36 = arith.subi %dataResult_9, %18 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %37 = arith.muli %36, %19 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %38 = arith.shrsi %37, %22 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %39 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli6">} : index
    %40 = arith.addi %17, %39 {bb = 2 : ui32, name = #handshake.name<"addi3">} : index
    %addressResult_10, %dataResult_11 = lsq_store[%40] %38 {bb = 2 : ui32, name = #handshake.name<"lsq_store1">} : i32, index
    %41 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli7">} : index
    %42 = arith.addi %17, %41 {bb = 2 : ui32, name = #handshake.name<"addi4">} : index
    %addressResult_12, %dataResult_13 = lsq_load[%42] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"lsq_store2" (3) [[0, 0], [0, 0]]>]>, name = #handshake.name<"lsq_load2">} : index, i32
    %43 = arith.subi %dataResult_13, %18 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %44 = arith.muli %43, %19 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %45 = arith.shrsi %44, %22 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %46 = arith.muli %20, %24 {bb = 2 : ui32, name = #handshake.name<"muli8">} : index
    %47 = arith.addi %17, %46 {bb = 2 : ui32, name = #handshake.name<"addi5">} : index
    %addressResult_14, %dataResult_15 = lsq_store[%47] %45 {bb = 2 : ui32, name = #handshake.name<"lsq_store2">} : i32, index
    %48 = arith.addi %17, %26 {bb = 2 : ui32, name = #handshake.name<"addi6">} : index
    %49 = arith.cmpi ult, %48, %24 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : index
    %trueResult, %falseResult = cond_br %49, %48 {bb = 2 : ui32, name = #handshake.name<"cond_br2">} : index
    %trueResult_16, %falseResult_17 = cond_br %49, %18 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_18, %falseResult_19 = cond_br %49, %19 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %49, %20 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : index
    %trueResult_22, %falseResult_23 = cond_br %49, %result_4 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %50 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %51 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %52 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge5">} : index
    %result_24, %index_25 = control_merge %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"control_merge2">} : none, index
    %53 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %54 = constant %53 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : index} : index
    %55 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %56 = constant %55 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : index} : index
    %57 = arith.addi %52, %56 {bb = 3 : ui32, name = #handshake.name<"addi7">} : index
    %58 = arith.cmpi ult, %57, %54 {bb = 3 : ui32, name = #handshake.name<"cmpi1">} : index
    %trueResult_26, %falseResult_27 = cond_br %58, %57 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : index
    %trueResult_28, %falseResult_29 = cond_br %58, %50 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    %trueResult_30, %falseResult_31 = cond_br %58, %51 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    %trueResult_32, %falseResult_33 = cond_br %58, %result_24 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %result_34, %index_35 = control_merge %falseResult_33 {bb = 4 : ui32, name = #handshake.name<"control_merge3">} : none, index
    %59 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %result_34 : none
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %59, %done, %done_1, %done_3 : none, none, none, none
  }
}

