module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%61, %addressResult_13, %dataResult_14) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %9 = oehb [1] %3 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i8
    %10 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i8
    %11 = mux %26#1 [%10, %7] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %12 = oehb [1] %11 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %13:3 = fork [3] %12 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %14 = arith.extsi %13#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %15 = arith.extsi %13#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %16 = tehb [2] %13#2 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i8
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %18 = tehb [4] %26#2 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i1
    %19 = mux %18 [%trueResult_7, %8] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %20 = oehb [1] %26#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i1
    %21 = oehb [1] %trueResult_9 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i8
    %22 = tehb [1] %21 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i8
    %23 = mux %20 [%22, %9] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %24:2 = fork [2] %23 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %25 = arith.extsi %24#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %4#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %26:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %27 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %28 = constant %27 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %29:2 = fork [2] %28 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %30 = arith.extsi %29#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %31 = arith.extsi %29#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %32 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %33 = constant %32 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %34 = arith.extsi %33 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%17] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %35 = arith.muli %25, %30 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %37 = tehb [2] %14 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i17
    %38 = arith.addi %37, %36 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%39] %memOutputs_1 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %40 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %41 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %42 = tehb [3] %41 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %43 = arith.addi %42, %40 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %44 = arith.addi %15, %34 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %45:2 = fork [2] %44 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %46 = arith.trunci %45#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %47 = arith.cmpi ult, %45#1, %31 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %48:4 = fork [4] %47 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %48#0, %46 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %49 = oehb [1] %48#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %50 = tehb [4] %49 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i1
    %trueResult_7, %falseResult_8 = cond_br %50, %43 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %48#1, %24#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %51 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %52 = tehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : none
    %53 = oehb [1] %48#3 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i1
    %trueResult_11, %falseResult_12 = cond_br %53, %52 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %54 = oehb [1] %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i8
    %55:2 = fork [2] %54 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %56 = arith.extsi %55#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %57 = arith.extsi %55#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %58:2 = fork [2] %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %59:2 = fork [2] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %60 = constant %59#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %62 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %63 = constant %62 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %65 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %66 = constant %65 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %67 = arith.extsi %66 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %68 = tehb [3] %57 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i32
    %addressResult_13, %dataResult_14 = mc_store[%68] %58#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %69 = arith.addi %56, %67 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %70 = oehb [1] %69 {bb = 3 : ui32, name = #handshake.name<"oehb10">} : i9
    %71:2 = fork [2] %70 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %72 = arith.trunci %71#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %73 = arith.cmpi ult, %71#1, %64 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %74:3 = fork [3] %73 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %74#0, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %trueResult_17, %falseResult_18 = cond_br %74#1, %59#0 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %75 = tehb [3] %74#2 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_19, %falseResult_20 = cond_br %75, %58#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %76 = oehb [1] %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"oehb11">} : i32
    %77 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %76 : i32
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %77, %done, %done_0, %done_2 : i32, none, none, none
  }
}

