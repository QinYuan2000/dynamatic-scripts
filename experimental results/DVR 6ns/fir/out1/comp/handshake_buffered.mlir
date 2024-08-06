module {
  handshake.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: none, ...) -> i32 attributes {argNames = ["di", "idx", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult_2) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %3:2 = fork [2] %2 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %4 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i11
    %6 = br %3#1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i1
    %7 = arith.extsi %6 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %8 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %9 = mux %16#0 [%trueResult, %5] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %10:3 = fork [3] %9 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %11 = arith.extsi %10#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %12 = arith.extsi %10#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %13 = arith.extsi %10#2 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i32
    %14 = tehb [4] %16#1 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i1
    %15 = mux %14 [%trueResult_4, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_6, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %16:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %17 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %18 = constant %17 {bb = 1 : ui32, name = #handshake.name<"constant4">, value = 999 : i11} : i11
    %19 = arith.extsi %18 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i11 to i12
    %20 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %21 = constant %20 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1000 : i11} : i11
    %22 = arith.extsi %21 {bb = 1 : ui32, name = #handshake.name<"extsi10">} : i11 to i12
    %23 = source {bb = 1 : ui32, name = #handshake.name<"source2">}
    %24 = constant %23 {bb = 1 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %25 = arith.extsi %24 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i2 to i12
    %addressResult, %dataResult = mc_load[%13] %memOutputs {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %26 = arith.subi %19, %12 {bb = 1 : ui32, name = #handshake.name<"subi1">} : i12
    %27 = arith.extsi %26 {bb = 1 : ui32, name = #handshake.name<"extsi12">} : i12 to i32
    %addressResult_2, %dataResult_3 = mc_load[%27] %memOutputs_0 {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %28 = arith.muli %dataResult, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %29 = oehb [1] %15 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %30 = tehb [1] %29 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %31 = arith.addi %30, %28 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %32 = arith.addi %11, %25 {bb = 1 : ui32, name = #handshake.name<"addi1">} : i12
    %33 = oehb [1] %32 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i12
    %34 = tehb [1] %33 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i12
    %35:2 = fork [2] %34 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i12
    %36 = arith.trunci %35#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %37 = arith.cmpi ult, %35#1, %22 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %38:3 = fork [3] %37 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %38#0, %36 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %39 = tehb [4] %38#1 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i1
    %trueResult_4, %falseResult_5 = cond_br %39, %31 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %40 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %41 = tehb [1] %40 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : none
    %trueResult_6, %falseResult_7 = cond_br %38#2, %41 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_7 {name = #handshake.name<"sink1">} : none
    %42 = merge %falseResult_5 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %43 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %42 : i32
    end {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %43, %done, %done_1 : i32, none, none
  }
}

