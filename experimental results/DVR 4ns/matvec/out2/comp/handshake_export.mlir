module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%58, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
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
    %9 = mux %24#1 [%trueResult, %7] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %10 = tehb [4001] %9 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i8
    %11:3 = fork [3] %10 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %12 = tehb [2005] %11#0 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %13 = arith.extsi %12 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %14 = arith.extsi %11#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %15 = arith.extsi %11#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %16 = oehb [1] %8 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %17 = tehb [2009] %24#2 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i1
    %18 = mux %17 [%trueResult_7, %16] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %19 = mux %24#0 [%trueResult_9, %3] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %20 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i8
    %21 = tehb [4001] %20 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i8
    %22:2 = fork [2] %21 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %23 = arith.extsi %22#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %4#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %24:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %25 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %26 = constant %25 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %27:2 = fork [2] %26 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %28 = arith.extsi %27#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %29 = arith.extsi %27#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %30 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %31 = constant %30 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %32 = arith.extsi %31 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %33 = tehb [2003] %15 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %addressResult, %dataResult = mc_load[%33] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %34 = arith.muli %23, %28 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %36 = arith.addi %13, %35 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%37] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %38 = arith.muli %dataResult, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %39 = oehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %40 = tehb [4001] %39 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %41 = arith.addi %40, %38 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %42 = arith.addi %14, %32 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %43 = oehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i9
    %44:2 = fork [2] %43 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %45 = arith.trunci %44#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %46 = arith.cmpi ult, %44#1, %29 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %47:4 = fork [4] %46 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %47#0, %45 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %48 = tehb [2009] %47#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %trueResult_7, %falseResult_8 = cond_br %48, %41 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_9, %falseResult_10 = cond_br %47#1, %22#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %49 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %50 = tehb [4001] %49 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : none
    %trueResult_11, %falseResult_12 = cond_br %47#3, %50 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %51:2 = fork [2] %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %52 = arith.extsi %51#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %53 = oehb [1] %51#1 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i8
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %55:2 = fork [2] %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %56:2 = fork [2] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %57 = constant %56#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %59 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %60 = constant %59 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %62 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %63 = constant %62 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%54] %55#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %65 = arith.addi %52, %64 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %66 = oehb [1] %65 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i9
    %67:2 = fork [2] %66 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %68 = arith.trunci %67#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %69 = arith.cmpi ult, %67#1, %61 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %70 = oehb [1] %69 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i1
    %71:3 = fork [3] %70 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %72 = oehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i8
    %trueResult_15, %falseResult_16 = cond_br %71#0, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %73 = oehb [1] %56#0 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : none
    %trueResult_17, %falseResult_18 = cond_br %71#1, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %71#2, %55#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %74 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_20 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %74, %done, %done_0, %done_2 : i32, none, none, none
  }
}

