module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %21, %addressResult_4, %dataResult_5) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %0:3 = fork [3] %arg4 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi0">} : i1 to i32
    %3 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : i2} : i2
    %addressResult, %dataResult = mc_load[%2] %memOutputs_0 {bb = 0 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i2 to i11
    %5 = mux %16#0 [%trueResult, %4] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i11
    %6:2 = fork [2] %5 {bb = 1 : ui32, name = #handshake.name<"fork1">} : i11
    %7 = arith.extsi %6#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %8 = arith.extsi %6#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i32
    %9:2 = fork [2] %8 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %10 = mux %16#3 [%trueResult_6, %dataResult] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %11 = mux %16#2 [%trueResult_8, %arg2] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %13 = mux %16#1 [%trueResult_10, %arg3] {bb = 1 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %14 = oehb [1] %13 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i32
    %15:2 = fork [2] %14 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %result, %index = control_merge %trueResult_12, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %16:4 = fork [4] %index {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %17 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb3">} : none
    %18 = tehb [1] %17 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : none
    %19:2 = fork [2] %18 {bb = 1 : ui32, name = #handshake.name<"fork6">} : none
    %20 = constant %19#0 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i2} : i2
    %21 = arith.extsi %20 {bb = 1 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %22 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %23 = constant %22 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : i11} : i11
    %24 = arith.extsi %23 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i12
    %25 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %26 = constant %25 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : i2} : i2
    %27 = arith.extsi %26 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i2 to i12
    %28 = arith.muli %12#1, %10 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%9#0] %memOutputs {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %29 = arith.muli %15#1, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %30 = oehb [1] %28 {bb = 1 : ui32, name = #handshake.name<"oehb4">} : i32
    %31 = arith.addi %30, %29 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %32:2 = fork [2] %31 {bb = 1 : ui32, name = #handshake.name<"fork7">} : i32
    %33 = tehb [1] %9#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%33] %32#1 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %34 = oehb [1] %7 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i12
    %35 = arith.addi %34, %27 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %36 = oehb [1] %35 {bb = 1 : ui32, name = #handshake.name<"oehb5">} : i12
    %37:2 = fork [2] %36 {bb = 1 : ui32, name = #handshake.name<"fork8">} : i12
    %38 = arith.trunci %37#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %39 = arith.cmpi ult, %37#1, %24 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %40:5 = fork [5] %39 {bb = 1 : ui32, name = #handshake.name<"fork9">} : i1
    %trueResult, %falseResult = cond_br %40#0, %38 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %trueResult_6, %falseResult_7 = cond_br %40#1, %32#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %41 = oehb [1] %12#0 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %42 = tehb [1] %41 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %trueResult_8, %falseResult_9 = cond_br %40#2, %42 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    sink %falseResult_9 {name = #handshake.name<"sink1">} : i32
    %43 = tehb [1] %15#0 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i32
    %trueResult_10, %falseResult_11 = cond_br %40#3, %43 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    sink %falseResult_11 {name = #handshake.name<"sink2">} : i32
    %trueResult_12, %falseResult_13 = cond_br %40#4, %19#1 {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    sink %falseResult_13 {name = #handshake.name<"sink3">} : none
    %44 = oehb [1] %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %45 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %44 : i32
    end {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %45, %done, %done_1 : i32, none, none
  }
}

