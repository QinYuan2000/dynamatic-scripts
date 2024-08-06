module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%58, %addressResult_13, %dataResult_14) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg3 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi7">} : i1 to i8
    %3 = mux %index [%trueResult_15, %2] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i8
    %result, %index = control_merge %trueResult_17, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %4:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %5 = constant %4#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %6:2 = fork [2] %5 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i1
    %7 = arith.extsi %6#0 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i1 to i8
    %8 = arith.extsi %6#1 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i32
    %9 = mux %22#1 [%trueResult, %7] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %10:3 = fork [3] %9 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %11 = arith.extsi %10#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %12 = arith.extsi %10#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %13 = tehb [5] %10#2 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i8
    %14 = arith.extsi %13 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %15 = tehb [9] %22#2 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i1
    %16 = mux %15 [%trueResult_7, %8] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %17 = mux %22#0 [%trueResult_9, %3] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %18 = oehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %19 = tehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %20:2 = fork [2] %19 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %21 = arith.extsi %20#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %4#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %22:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %23 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %24 = constant %23 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %25:2 = fork [2] %24 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %26 = arith.extsi %25#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %27 = arith.extsi %25#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %28 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %29 = constant %28 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%14] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %31 = arith.muli %21, %26 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %32 = arith.extsi %31 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %33 = tehb [5] %11 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i17
    %34 = arith.addi %33, %32 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%35] %memOutputs_1 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %36 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %37 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %38 = tehb [5] %37 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %39 = arith.addi %38, %36 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %40 = arith.addi %12, %30 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %41 = oehb [1] %40 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i9
    %42 = tehb [1] %41 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i9
    %43:2 = fork [2] %42 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %44 = arith.trunci %43#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %45 = arith.cmpi ult, %43#1, %27 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %46:4 = fork [4] %45 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %46#0, %44 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %47 = tehb [9] %46#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %trueResult_7, %falseResult_8 = cond_br %47, %39 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %46#1, %20#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %48 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %trueResult_11, %falseResult_12 = cond_br %46#3, %49 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %50:2 = fork [2] %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %51 = arith.extsi %50#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %52 = tehb [5] %50#1 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i8
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %54:2 = fork [2] %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %55 = oehb [1] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : none
    %56:2 = fork [2] %55 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %57 = constant %56#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %59 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %60 = constant %59 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %62 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %63 = constant %62 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%53] %54#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %65 = arith.addi %51, %64 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %66 = oehb [1] %65 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i9
    %67:2 = fork [2] %66 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %68 = arith.trunci %67#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %69 = arith.cmpi ult, %67#1, %61 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %70:3 = fork [3] %69 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %70#0, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %trueResult_17, %falseResult_18 = cond_br %70#1, %56#0 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %71 = tehb [4] %70#2 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_19, %falseResult_20 = cond_br %71, %54#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %72 = oehb [1] %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i32
    %73 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %72 : i32
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %73, %done, %done_0, %done_2 : i32, none, none, none
  }
}

