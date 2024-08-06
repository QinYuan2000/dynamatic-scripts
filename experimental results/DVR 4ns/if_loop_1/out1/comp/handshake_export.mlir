module {
  handshake.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi6">} : i1 to i32
    %5 = mux %13#2 [%47, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %6 = oehb [1] %5 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %8 = tehb [2] %13#1 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %9 = mux %8 [%45, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %10 = mux %13#0 [%48, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %11 = oehb [1] %10 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %21, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %13:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %14 = arith.cmpi ult, %7#1, %12#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %15:4 = fork [4] %14 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %15#3, %12#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %15#2, %7#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %16 = oehb [1] %9 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %17 = oehb [1] %15#1 {bb = 1 : ui32, name = #handshake.name<"oehb3">} : i1
    %18 = tehb [1] %17 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i1
    %trueResult_2, %falseResult_3 = cond_br %18, %16 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %19 = tehb [1] %result {bb = 1 : ui32, name = #handshake.name<"tehb0">} : none
    %trueResult_4, %falseResult_5 = cond_br %15#0, %19 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %20:2 = fork [2] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %21 = oehb [1] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %22 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %23 = constant %22 {bb = 2 : ui32, name = #handshake.name<"constant4">, value = 1 : i2} : i2
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %25 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %26 = constant %25 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 10 : i5} : i5
    %27 = arith.extsi %26 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %28 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %29 = constant %28 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = false} : i1
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source3">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 2 : i3} : i3
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi4">} : i3 to i32
    %addressResult, %dataResult = mc_load[%20#1] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %34:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %35 = arith.shli %34#1, %33 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %36 = tehb [1] %34#0 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %37 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %38 = arith.addi %36, %37 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %39:2 = fork [2] %38 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i32
    %40 = oehb [1] %39#1 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i32
    %41 = arith.cmpi sgt, %40, %27 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %42 = arith.select %41, %39#0, %30 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %43 = oehb [1] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %44 = oehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i32
    %45 = arith.addi %43, %44 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %46 = oehb [1] %20#0 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %47 = arith.addi %46, %24 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %48 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %49 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %falseResult_3 : i32
    end {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %49, %done : i32, none
  }
}

