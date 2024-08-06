module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%72, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %17 = mux %30#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %18 = tehb [3001] %17 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %19:3 = fork [3] %18 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %20 = oehb [1] %19#0 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i8
    %21 = tehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i8
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %23 = arith.extsi %19#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %24 = arith.extsi %19#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %25 = oehb [4003] %30#2 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i1
    %26 = mux %25 [%trueResult_7, %14] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %27 = mux %30#0 [%trueResult_9, %15] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %29 = arith.extsi %28#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %16 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %30:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %33:2 = fork [2] %32 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %34 = arith.extsi %33#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %35 = tehb [3001] %33#1 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i8
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %40 = tehb [3001] %24 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %addressResult, %dataResult = mc_load[%40] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %41 = arith.muli %29, %34 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %43 = arith.addi %22, %42 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %44 = arith.extsi %43 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%44] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %45 = tehb [3001] %dataResult {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %46 = arith.muli %45, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %47 = oehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %48 = tehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %49 = arith.addi %48, %46 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %50 = arith.addi %23, %39 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %51:2 = fork [2] %50 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %52 = tehb [3001] %51#0 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i9
    %53 = arith.trunci %52 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %54 = arith.cmpi ult, %51#1, %36 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %55 = tehb [3001] %54 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i1
    %56:4 = fork [4] %55 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %56#0, %53 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %57 = oehb [4003] %56#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %trueResult_7, %falseResult_8 = cond_br %57, %49 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %58 = oehb [1] %28#0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i8
    %59 = tehb [1] %58 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i8
    %trueResult_9, %falseResult_10 = cond_br %56#1, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %60 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %61 = tehb [1] %60 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_11, %falseResult_12 = cond_br %56#3, %61 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %62 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %63:2 = fork [2] %62 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %64 = arith.extsi %63#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %65 = tehb [3001] %63#1 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i8
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %67 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %68:2 = fork [2] %67 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %69 = merge %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %70:2 = fork [2] %69 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %71 = constant %70#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %72 = arith.extsi %71 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %73 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %74 = constant %73 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %76 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %77 = constant %76 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %78 = arith.extsi %77 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%66] %68#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %79 = arith.addi %64, %78 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %80:2 = fork [2] %79 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %81 = tehb [3001] %80#0 {bb = 3 : ui32, name = #handshake.name<"tehb13">} : i9
    %82 = arith.trunci %81 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %83 = arith.cmpi ult, %80#1, %75 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %84 = tehb [3001] %83 {bb = 3 : ui32, name = #handshake.name<"tehb14">} : i1
    %85:3 = fork [3] %84 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %85#0, %82 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %86 = tehb [3001] %70#0 {bb = 3 : ui32, name = #handshake.name<"tehb12">} : none
    %trueResult_17, %falseResult_18 = cond_br %85#1, %86 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %85#2, %68#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %87 = merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %88 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %87 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %88, %done, %done_0, %done_2 : i32, none, none, none
  }
}

