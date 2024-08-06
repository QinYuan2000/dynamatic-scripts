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
    %12 = tehb [3001] %9#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %13 = br %12 {bb = 1 : ui32, name = #handshake.name<"br8">} : i1
    %14 = arith.extsi %13 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i32
    %15 = br %6 {bb = 1 : ui32, name = #handshake.name<"br9">} : i8
    %16 = br %7#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %17 = mux %31#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %18 = oehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i8
    %19 = tehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %20:3 = fork [3] %19 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %21 = oehb [4003] %20#0 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %23 = arith.extsi %20#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %24 = oehb [4003] %20#2 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i8
    %25 = arith.extsi %24 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %26 = oehb [4008] %31#2 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i1
    %27 = mux %26 [%trueResult_7, %14] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %28 = mux %31#0 [%trueResult_9, %15] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %29:2 = fork [2] %28 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %30 = arith.extsi %29#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %16 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %31:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %32 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %33 = constant %32 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %34:2 = fork [2] %33 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %35 = arith.extsi %34#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %36 = arith.extsi %34#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%25] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %40 = arith.muli %30, %35 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %41 = arith.extsi %40 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %42 = arith.addi %22, %41 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%43] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %44 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %45 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %46 = tehb [1] %45 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %47 = arith.addi %46, %44 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %48 = arith.addi %23, %39 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %49:2 = fork [2] %48 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %50 = arith.trunci %49#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %51 = oehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i9
    %52 = tehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i9
    %53 = arith.cmpi ult, %49#1, %52 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %54:4 = fork [4] %53 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %54#0, %50 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %55 = oehb [4008] %54#2 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i1
    %trueResult_7, %falseResult_8 = cond_br %55, %47 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %56 = oehb [1] %29#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i8
    %57 = tehb [1] %56 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %trueResult_9, %falseResult_10 = cond_br %54#1, %57 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %58 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : none
    %59 = tehb [1] %58 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %trueResult_11, %falseResult_12 = cond_br %54#3, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %60 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %61:2 = fork [2] %60 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %62 = arith.extsi %61#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %63 = arith.extsi %61#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %64 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %65:2 = fork [2] %64 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %66 = merge %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %67:2 = fork [2] %66 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %68 = constant %67#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %69 = arith.extsi %68 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %70 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %71 = constant %70 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %72 = arith.extsi %71 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %73 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %74 = constant %73 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %76 = tehb [3001] %63 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i32
    %addressResult_13, %dataResult_14 = mc_store[%76] %65#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %77 = arith.addi %62, %75 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %78 = tehb [3001] %77 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i9
    %79:2 = fork [2] %78 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %80 = arith.trunci %79#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %81 = arith.cmpi ult, %79#1, %72 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %82:3 = fork [3] %81 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %82#0, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %83 = tehb [3001] %67#0 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_17, %falseResult_18 = cond_br %82#1, %83 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %82#2, %65#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %84 = merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %85 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %84 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %85, %done, %done_0, %done_2 : i32, none, none, none
  }
}

