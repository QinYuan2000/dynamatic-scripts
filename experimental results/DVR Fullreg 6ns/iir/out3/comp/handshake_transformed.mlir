module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %26, %addressResult_4, %dataResult_5) {connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg4 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3:3 = fork [3] %2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %4 = constant %3#2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = false} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi0">} : i1 to i32
    %6 = constant %3#1 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : i2} : i2
    %addressResult, %dataResult = mc_load[%5] %memOutputs_0 {bb = 0 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %7 = br %6 {bb = 0 : ui32, name = #handshake.name<"br0">} : i2
    %8 = arith.extsi %7 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i2 to i11
    %9 = br %dataResult {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %10 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %11 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %12 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %13 = mux %23#0 [%trueResult, %8] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i11
    %14:2 = fork [2] %13 {bb = 1 : ui32, name = #handshake.name<"fork1">} : i11
    %15 = arith.extsi %14#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %16 = arith.extsi %14#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i32
    %17:2 = fork [2] %16 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %18 = mux %23#3 [%trueResult_6, %9] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %19 = mux %23#2 [%trueResult_8, %10] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %20:2 = fork [2] %19 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %21 = mux %23#1 [%trueResult_10, %11] {bb = 1 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %22:2 = fork [2] %21 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %result, %index = control_merge %trueResult_12, %12 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %23:4 = fork [4] %index {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %24:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork6">} : none
    %25 = constant %24#0 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i2} : i2
    %26 = arith.extsi %25 {bb = 1 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %27 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %28 = constant %27 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : i11} : i11
    %29 = arith.extsi %28 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i12
    %30 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %31 = constant %30 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : i2} : i2
    %32 = arith.extsi %31 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i2 to i12
    %33 = arith.muli %20#1, %18 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%17#0] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %34 = arith.muli %22#1, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %35 = arith.addi %33, %34 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %36:2 = fork [2] %35 {bb = 1 : ui32, name = #handshake.name<"fork7">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%17#1] %36#1 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %37 = arith.addi %15, %32 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %38:2 = fork [2] %37 {bb = 1 : ui32, name = #handshake.name<"fork8">} : i12
    %39 = arith.trunci %38#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %40 = arith.cmpi ult, %38#1, %29 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %41:5 = fork [5] %40 {bb = 1 : ui32, name = #handshake.name<"fork9">} : i1
    %trueResult, %falseResult = cond_br %41#0, %39 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %trueResult_6, %falseResult_7 = cond_br %41#1, %36#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_8, %falseResult_9 = cond_br %41#2, %20#0 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    sink %falseResult_9 {name = #handshake.name<"sink1">} : i32
    %trueResult_10, %falseResult_11 = cond_br %41#3, %22#0 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    sink %falseResult_11 {name = #handshake.name<"sink2">} : i32
    %trueResult_12, %falseResult_13 = cond_br %41#4, %24#1 {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    sink %falseResult_13 {name = #handshake.name<"sink3">} : none
    %42 = merge %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %43 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %42 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %43, %done, %done_1 : i32, none, none
  }
}

