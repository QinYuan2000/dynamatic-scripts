module {
  handshake.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge1">} : none
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %3 = constant %2#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %4:2 = fork [2] %3 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %5 = br %4#0 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %6 = arith.extsi %5 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %7 = br %4#1 {bb = 0 : ui32, name = #handshake.name<"br1">} : i1
    %8 = arith.extsi %7 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %9 = br %0 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %10 = br %2#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %11 = mux %21#2 [%48, %6] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %12 = oehb [1] %11 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %13:2 = fork [2] %12 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %14 = tehb [1] %21#1 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %15 = mux %14 [%49, %8] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %16 = oehb [1] %50 {bb = 1 : ui32, name = #handshake.name<"oehb7">} : i32
    %17 = mux %21#0 [%16, %9] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %18 = oehb [1] %17 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %19:2 = fork [2] %18 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %20 = oehb [1] %51 {bb = 1 : ui32, name = #handshake.name<"oehb8">} : none
    %result, %index = control_merge %20, %10 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %21:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %22 = arith.cmpi ult, %13#1, %19#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %23:4 = fork [4] %22 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %23#3, %19#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %23#2, %13#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %trueResult_2, %falseResult_3 = cond_br %23#1, %15 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %24 = tehb [1] %result {bb = 1 : ui32, name = #handshake.name<"tehb0">} : none
    %trueResult_4, %falseResult_5 = cond_br %23#0, %24 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %25 = merge %trueResult {bb = 2 : ui32, name = #handshake.name<"merge2">} : i32
    %26 = merge %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %27:2 = fork [2] %26 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %28 = oehb [1] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %29 = merge %28 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %30 = merge %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"merge6">} : none
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %34 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %35 = constant %34 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 10 : i5} : i5
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = false} : i1
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %addressResult, %dataResult = mc_load[%27#1] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %40:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %41 = arith.cmpi sgt, %40#1, %36 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %42 = arith.select %41, %40#0, %39 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %43 = oehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %44 = oehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %45 = arith.addi %43, %44 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %46 = oehb [1] %27#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %47 = arith.addi %46, %33 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %48 = br %47 {bb = 2 : ui32, name = #handshake.name<"br6">} : i32
    %49 = br %45 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %50 = br %25 {bb = 2 : ui32, name = #handshake.name<"br8">} : i32
    %51 = br %30 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %52 = oehb [1] %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i32
    %53 = merge %52 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %54 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %53 : i32
    end {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %54, %done : i32, none
  }
}

