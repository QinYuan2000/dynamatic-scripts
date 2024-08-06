module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%68, %addressResult_13, %dataResult_14) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
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
    %16 = mux %29#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %17:3 = fork [3] %16 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %18 = arith.extsi %17#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %19 = arith.extsi %17#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %20 = tehb [5] %17#2 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i8
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %22 = tehb [9] %29#2 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i1
    %23 = mux %22 [%trueResult_7, %13] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %24 = mux %29#0 [%trueResult_9, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %25 = oehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %26 = tehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %27:2 = fork [2] %26 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %28 = arith.extsi %27#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %15 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %29:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %30 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %31 = constant %30 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %32:2 = fork [2] %31 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %33 = arith.extsi %32#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %34 = arith.extsi %32#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %35 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %36 = constant %35 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%21] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %38 = arith.muli %28, %33 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %40 = tehb [5] %18 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i17
    %41 = arith.addi %40, %39 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%42] %memOutputs_1 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %43 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %44 = oehb [1] %23 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %45 = tehb [5] %44 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %46 = arith.addi %45, %43 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %47 = arith.addi %19, %37 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %48 = oehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i9
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i9
    %50:2 = fork [2] %49 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %51 = arith.trunci %50#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %52 = arith.cmpi ult, %50#1, %34 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %53:4 = fork [4] %52 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %53#0, %51 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %54 = tehb [9] %53#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %trueResult_7, %falseResult_8 = cond_br %54, %46 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %53#1, %27#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %55 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %56 = tehb [1] %55 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %trueResult_11, %falseResult_12 = cond_br %53#3, %56 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %57 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %58:2 = fork [2] %57 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %59 = arith.extsi %58#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %60 = tehb [5] %58#1 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i8
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %62 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %63:2 = fork [2] %62 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %64 = oehb [1] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : none
    %65 = merge %64 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %66:2 = fork [2] %65 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %67 = constant %66#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %68 = arith.extsi %67 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %69 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %70 = constant %69 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %71 = arith.extsi %70 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %72 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %73 = constant %72 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %74 = arith.extsi %73 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%61] %63#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %75 = arith.addi %59, %74 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %76 = oehb [1] %75 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i9
    %77:2 = fork [2] %76 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %78 = arith.trunci %77#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %79 = arith.cmpi ult, %77#1, %71 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %80:3 = fork [3] %79 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %80#0, %78 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %trueResult_17, %falseResult_18 = cond_br %80#1, %66#0 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %81 = tehb [4] %80#2 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_19, %falseResult_20 = cond_br %81, %63#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %82 = oehb [1] %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i32
    %83 = merge %82 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %84 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %83 : i32
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %84, %done, %done_0, %done_2 : i32, none, none, none
  }
}

