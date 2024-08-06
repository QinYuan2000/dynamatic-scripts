module {
  handshake.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi6">} : i1 to i32
    %5 = oehb [1] %44 {bb = 1 : ui32, name = #handshake.name<"oehb7">} : i32
    %6 = mux %12#2 [%5, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %8 = tehb [1] %12#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %9 = mux %8 [%45, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %10 = mux %12#0 [%19, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %11:2 = fork [2] %10 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %23, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %12:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %13 = arith.cmpi ult, %7#1, %11#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %14:4 = fork [4] %13 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %14#3, %11#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %14#2, %7#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %15 = oehb [1] %9 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %16 = oehb [1] %14#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %17 = tehb [1] %16 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %trueResult_2, %falseResult_3 = cond_br %17, %15 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %14#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %18 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %19 = tehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %20 = oehb [1] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %21:2 = fork [2] %20 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %22 = oehb [1] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %23 = tehb [1] %22 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : none
    %24 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %25 = constant %24 {bb = 2 : ui32, name = #handshake.name<"constant4">, value = 1 : i2} : i2
    %26 = arith.extsi %25 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %27 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %28 = constant %27 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 10 : i5} : i5
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %30 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %31 = constant %30 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = false} : i1
    %32 = arith.extsi %31 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %33 = source {bb = 2 : ui32, name = #handshake.name<"source3">}
    %34 = constant %33 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 2 : i3} : i3
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi4">} : i3 to i32
    %addressResult, %dataResult = mc_load[%21#1] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %36:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %37 = arith.shli %36#1, %35 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %38 = arith.addi %36#0, %37 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %39 = oehb [1] %38 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %40:2 = fork [2] %39 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i32
    %41 = arith.cmpi sgt, %40#1, %29 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %42 = arith.select %41, %40#0, %32 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %43 = arith.addi %trueResult_2, %42 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %44 = arith.addi %21#0, %26 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %45 = oehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %46 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %falseResult_3 : i32
    end {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %46, %done : i32, none
  }
}

