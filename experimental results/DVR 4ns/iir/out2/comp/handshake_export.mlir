module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %26, %addressResult_4, %dataResult_5) {connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %0:3 = fork [3] %arg4 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi0">} : i1 to i32
    %3 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : i2} : i2
    %addressResult, %dataResult = mc_load[%2] %memOutputs_0 {bb = 0 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i2 to i11
    %5 = mux %21#0 [%trueResult, %4] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i11
    %6 = tehb [4001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i11
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork1">} : i11
    %8 = arith.extsi %7#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %9 = arith.extsi %7#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i32
    %10:2 = fork [2] %9 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %11 = oehb [1] %21#3 {bb = 1 : ui32, name = #handshake.name<"oehb3">} : i1
    %12 = mux %11 [%trueResult_6, %dataResult] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %13 = mux %21#2 [%trueResult_8, %arg2] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %14 = oehb [1] %13 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %15 = tehb [4001] %14 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %16:2 = fork [2] %15 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %17 = mux %21#1 [%trueResult_10, %arg3] {bb = 1 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %18 = oehb [1] %17 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %19 = tehb [4001] %18 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %20:2 = fork [2] %19 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %result, %index = control_merge %trueResult_12, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %21:4 = fork [4] %index {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %22 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb2">} : none
    %23 = tehb [4001] %22 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : none
    %24:2 = fork [2] %23 {bb = 1 : ui32, name = #handshake.name<"fork6">} : none
    %25 = constant %24#0 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i2} : i2
    %26 = arith.extsi %25 {bb = 1 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %27 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %28 = constant %27 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : i11} : i11
    %29 = arith.extsi %28 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i12
    %30 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %31 = constant %30 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : i2} : i2
    %32 = arith.extsi %31 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i2 to i12
    %33 = arith.muli %16#1, %12 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%10#0] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %34 = arith.muli %20#1, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %35 = arith.addi %33, %34 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %36:2 = fork [2] %35 {bb = 1 : ui32, name = #handshake.name<"fork7">} : i32
    %37 = tehb [2005] %10#1 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%37] %36#1 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %38 = arith.addi %8, %32 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %39 = oehb [1] %38 {bb = 1 : ui32, name = #handshake.name<"oehb4">} : i12
    %40:2 = fork [2] %39 {bb = 1 : ui32, name = #handshake.name<"fork8">} : i12
    %41 = arith.trunci %40#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %42 = arith.cmpi ult, %40#1, %29 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %43:5 = fork [5] %42 {bb = 1 : ui32, name = #handshake.name<"fork9">} : i1
    %trueResult, %falseResult = cond_br %43#0, %41 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %44 = oehb [1] %43#1 {bb = 1 : ui32, name = #handshake.name<"oehb5">} : i1
    %trueResult_6, %falseResult_7 = cond_br %44, %36#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_8, %falseResult_9 = cond_br %43#2, %16#0 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    sink %falseResult_9 {name = #handshake.name<"sink1">} : i32
    %trueResult_10, %falseResult_11 = cond_br %43#3, %20#0 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    sink %falseResult_11 {name = #handshake.name<"sink2">} : i32
    %trueResult_12, %falseResult_13 = cond_br %43#4, %24#1 {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    sink %falseResult_13 {name = #handshake.name<"sink3">} : none
    %45 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %falseResult_7 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %45, %done, %done_1 : i32, none, none
  }
}

