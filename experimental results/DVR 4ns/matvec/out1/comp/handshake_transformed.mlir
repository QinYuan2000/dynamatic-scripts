module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%54, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %16 = mux %25#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %17:3 = fork [3] %16 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %18 = arith.extsi %17#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %19 = arith.extsi %17#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %20 = arith.extsi %17#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %21 = mux %25#2 [%trueResult_7, %13] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %22 = mux %25#0 [%trueResult_9, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %23:2 = fork [2] %22 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %24 = arith.extsi %23#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %15 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %25:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %26 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %27 = constant %26 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %29 = arith.extsi %28#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %30 = arith.extsi %28#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%20] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %34 = arith.muli %24, %29 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %36 = arith.addi %18, %35 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%37] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %38 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %39 = arith.addi %21, %38 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %40 = arith.addi %19, %33 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %41:2 = fork [2] %40 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %42 = arith.trunci %41#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %43 = arith.cmpi ult, %41#1, %30 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %44:4 = fork [4] %43 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %44#0, %42 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %trueResult_7, %falseResult_8 = cond_br %44#2, %39 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %44#1, %23#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %trueResult_11, %falseResult_12 = cond_br %44#3, %result_3 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %45 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %46:2 = fork [2] %45 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %47 = arith.extsi %46#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %48 = arith.extsi %46#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %49 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %50:2 = fork [2] %49 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %51 = merge %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %52:2 = fork [2] %51 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %53 = constant %52#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %55 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %56 = constant %55 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %57 = arith.extsi %56 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %58 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %59 = constant %58 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%48] %50#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %61 = arith.addi %47, %60 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %62:2 = fork [2] %61 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %63 = arith.trunci %62#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %64 = arith.cmpi ult, %62#1, %57 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %65:3 = fork [3] %64 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %65#0, %63 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %trueResult_17, %falseResult_18 = cond_br %65#1, %52#0 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %65#2, %50#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %66 = merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %67 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %66 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %67, %done, %done_0, %done_2 : i32, none, none, none
  }
}

