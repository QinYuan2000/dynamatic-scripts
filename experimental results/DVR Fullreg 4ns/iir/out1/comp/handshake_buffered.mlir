module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %29, %addressResult_4, %dataResult_5) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg4 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3:3 = fork [3] %2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %4 = constant %3#2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = false} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi0">} : i1 to i32
    %6 = constant %3#1 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : i2} : i2
    %addressResult, %dataResult = mc_load[%5] %memOutputs_0 {bb = 0 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %7 = br %6 {bb = 0 : ui32, name = #handshake.name<"br0">} : i2
    %8 = arith.extsi %7 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i2 to i11
    %9 = br %dataResult {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %10 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %11 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %12 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %13 = mux %24#0 [%trueResult, %8] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i11
    %14:2 = fork [2] %13 {bb = 1 : ui32, name = #handshake.name<"fork1">} : i11
    %15 = arith.extsi %14#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %16 = arith.extsi %14#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i32
    %17:2 = fork [2] %16 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %18 = mux %24#3 [%trueResult_6, %9] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %19 = mux %24#2 [%trueResult_8, %10] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %20:2 = fork [2] %19 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %21 = mux %24#1 [%trueResult_10, %11] {bb = 1 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %22 = oehb [1] %21 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i32
    %23:2 = fork [2] %22 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %result, %index = control_merge %trueResult_12, %12 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %24:4 = fork [4] %index {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %25 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb3">} : none
    %26 = tehb [1] %25 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : none
    %27:2 = fork [2] %26 {bb = 1 : ui32, name = #handshake.name<"fork6">} : none
    %28 = constant %27#0 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i2} : i2
    %29 = arith.extsi %28 {bb = 1 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %30 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %31 = constant %30 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : i11} : i11
    %32 = arith.extsi %31 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i12
    %33 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %34 = constant %33 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : i2} : i2
    %35 = arith.extsi %34 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i2 to i12
    %36 = arith.muli %20#1, %18 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%17#0] %memOutputs {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %37 = arith.muli %23#1, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %38 = oehb [1] %36 {bb = 1 : ui32, name = #handshake.name<"oehb4">} : i32
    %39 = arith.addi %38, %37 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %40:2 = fork [2] %39 {bb = 1 : ui32, name = #handshake.name<"fork7">} : i32
    %41 = tehb [1] %17#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%41] %40#1 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %42 = oehb [1] %15 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i12
    %43 = arith.addi %42, %35 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %44 = oehb [1] %43 {bb = 1 : ui32, name = #handshake.name<"oehb5">} : i12
    %45:2 = fork [2] %44 {bb = 1 : ui32, name = #handshake.name<"fork8">} : i12
    %46 = arith.trunci %45#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %47 = arith.cmpi ult, %45#1, %32 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %48:5 = fork [5] %47 {bb = 1 : ui32, name = #handshake.name<"fork9">} : i1
    %trueResult, %falseResult = cond_br %48#0, %46 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %trueResult_6, %falseResult_7 = cond_br %48#1, %40#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %49 = oehb [1] %20#0 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %50 = tehb [1] %49 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %trueResult_8, %falseResult_9 = cond_br %48#2, %50 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    sink %falseResult_9 {name = #handshake.name<"sink1">} : i32
    %51 = tehb [1] %23#0 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i32
    %trueResult_10, %falseResult_11 = cond_br %48#3, %51 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    sink %falseResult_11 {name = #handshake.name<"sink2">} : i32
    %trueResult_12, %falseResult_13 = cond_br %48#4, %27#1 {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    sink %falseResult_13 {name = #handshake.name<"sink3">} : none
    %52 = oehb [1] %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %53 = merge %52 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %54 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %53 : i32
    end {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %54, %done, %done_1 : i32, none, none
  }
}

