module {
  handshake.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %5 = mux %11#2 [%36, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %6:2 = fork [2] %5 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %7 = oehb [1] %11#1 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i1
    %8 = mux %7 [%37, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %9 = mux %11#0 [%16, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %10:2 = fork [2] %9 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %21, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %11:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %12 = arith.cmpi ult, %6#1, %10#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %13:4 = fork [4] %12 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %13#3, %10#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %13#2, %6#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %14 = oehb [1] %13#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %trueResult_2, %falseResult_3 = cond_br %14, %8 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %13#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %15 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %16 = tehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i32
    %17 = oehb [1] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %18:2 = fork [2] %17 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %19 = oehb [1] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %20 = oehb [1] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : none
    %21 = tehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : none
    %22 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %23 = constant %22 {bb = 2 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %25 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %26 = constant %25 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 10 : i5} : i5
    %27 = arith.extsi %26 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %28 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %29 = constant %28 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = false} : i1
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %addressResult, %dataResult = mc_load[%18#1] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %31:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %32 = arith.cmpi sgt, %31#1, %27 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %33 = arith.select %32, %31#0, %30 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %34 = arith.addi %19, %33 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %35 = arith.addi %18#0, %24 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %36 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %37 = oehb [1] %34 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %38 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %falseResult_3 : i32
    end {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %38, %done : i32, none
  }
}

