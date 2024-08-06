module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%69, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %3 = br %2 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi7">} : i1 to i8
    %5 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %6 = mux %index [%trueResult_15, %4] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i8
    %result, %index = control_merge %trueResult_17, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %7:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %8 = constant %7#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %9:2 = fork [2] %8 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i1
    %10 = br %9#0 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i1 to i8
    %12 = br %9#1 {bb = 1 : ui32, name = #handshake.name<"br8">} : i1
    %13 = arith.extsi %12 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i32
    %14 = br %6 {bb = 1 : ui32, name = #handshake.name<"br9">} : i8
    %15 = br %7#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %16 = mux %33#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %17 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i8
    %18 = tehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %19:3 = fork [3] %18 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %20 = tehb [2004] %19#0 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i8
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %22 = arith.extsi %19#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %23 = tehb [2004] %19#2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %25 = tehb [4001] %13 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i32
    %26 = tehb [2009] %33#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %27 = mux %26 [%trueResult_7, %25] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %28 = mux %33#0 [%trueResult_9, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %29 = oehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i8
    %30 = tehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i8
    %31:2 = fork [2] %30 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %32 = arith.extsi %31#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %15 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %33:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %34 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %35 = constant %34 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %36:2 = fork [2] %35 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %37 = arith.extsi %36#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %38 = arith.extsi %36#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %39 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %40 = constant %39 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %41 = arith.extsi %40 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%24] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %42 = arith.muli %32, %37 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %44 = arith.addi %21, %43 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %45 = arith.extsi %44 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%45] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %46 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %47 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %48 = tehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %49 = arith.addi %48, %46 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %50 = arith.addi %22, %41 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %51:2 = fork [2] %50 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %52 = arith.trunci %51#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %53 = arith.cmpi ult, %51#1, %38 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %54:4 = fork [4] %53 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %54#0, %52 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %55 = tehb [2009] %54#2 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_7, %falseResult_8 = cond_br %55, %49 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %54#1, %31#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %56 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %57 = tehb [1] %56 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_11, %falseResult_12 = cond_br %54#3, %57 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %58 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %59:2 = fork [2] %58 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %60 = arith.extsi %59#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %61 = tehb [4001] %59#1 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i8
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %63 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %64:2 = fork [2] %63 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %65 = tehb [4001] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : none
    %66 = merge %65 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %67:2 = fork [2] %66 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %68 = constant %67#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %69 = arith.extsi %68 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %70 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %71 = constant %70 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %72 = arith.extsi %71 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %73 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %74 = constant %73 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%62] %64#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %76 = arith.addi %60, %75 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %77 = tehb [4001] %76 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i9
    %78:2 = fork [2] %77 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %79 = arith.trunci %78#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %80 = arith.cmpi ult, %78#1, %72 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %81:3 = fork [3] %80 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %81#0, %79 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %trueResult_17, %falseResult_18 = cond_br %81#1, %67#0 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %81#2, %64#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %82 = merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %83 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %82 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %83, %done, %done_0, %done_2 : i32, none, none, none
  }
}

