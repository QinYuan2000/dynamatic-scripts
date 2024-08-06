module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%60, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %9 = mux %23#1 [%trueResult, %7] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %10 = oehb [1] %9 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i8
    %11 = tehb [1] %10 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %13 = oehb [4003] %12#0 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %14 = arith.extsi %13 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %15 = arith.extsi %12#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %16 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %17 = tehb [3001] %8 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i32
    %18 = oehb [4008] %23#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %19 = mux %18 [%trueResult_7, %17] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %20 = mux %23#0 [%trueResult_9, %3] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %21:2 = fork [2] %20 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %22 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %4#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %23:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %24 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %25 = constant %24 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %26:2 = fork [2] %25 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %27 = arith.extsi %26#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %28 = arith.extsi %26#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %29 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %30 = constant %29 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %31 = arith.extsi %30 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%16] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %32 = arith.muli %22, %27 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %34 = arith.addi %14, %33 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%35] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %36 = oehb [4003] %dataResult {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %37 = arith.muli %36, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %38 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %39 = tehb [1] %38 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %40 = arith.addi %39, %37 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %41 = arith.addi %15, %31 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %42:2 = fork [2] %41 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %43 = arith.trunci %42#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %44 = oehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i9
    %45 = tehb [1] %44 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i9
    %46 = arith.cmpi ult, %42#1, %45 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %47:4 = fork [4] %46 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %47#0, %43 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %48 = oehb [4008] %47#2 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i1
    %trueResult_7, %falseResult_8 = cond_br %48, %40 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %49 = oehb [1] %21#0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i8
    %50 = tehb [1] %49 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %trueResult_9, %falseResult_10 = cond_br %47#1, %50 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %51 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %52 = tehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %trueResult_11, %falseResult_12 = cond_br %47#3, %52 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %53:2 = fork [2] %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %54 = arith.extsi %53#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %55 = tehb [3001] %53#1 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i8
    %56 = arith.extsi %55 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %57:2 = fork [2] %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %58:2 = fork [2] %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %59 = constant %58#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %61 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %62 = constant %61 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %63 = arith.extsi %62 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %64 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %65 = constant %64 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%56] %57#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %67 = arith.addi %54, %66 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %68 = tehb [3001] %67 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i9
    %69:2 = fork [2] %68 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %70 = arith.trunci %69#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %71 = arith.cmpi ult, %69#1, %63 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %72:3 = fork [3] %71 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %72#0, %70 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %73 = tehb [3001] %58#0 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_17, %falseResult_18 = cond_br %72#1, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %72#2, %57#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %74 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_20 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %74, %done, %done_0, %done_2 : i32, none, none, none
  }
}

