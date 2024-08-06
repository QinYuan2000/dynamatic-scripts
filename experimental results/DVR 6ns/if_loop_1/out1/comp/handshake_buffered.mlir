module {
  handshake.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge1">} : none
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %3 = constant %2#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %4:2 = fork [2] %3 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %5 = br %4#0 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %6 = arith.extsi %5 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %7 = br %4#1 {bb = 0 : ui32, name = #handshake.name<"br1">} : i1
    %8 = arith.extsi %7 {bb = 0 : ui32, name = #handshake.name<"extsi6">} : i1 to i32
    %9 = br %0 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %10 = br %2#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %11 = oehb [1] %55 {bb = 1 : ui32, name = #handshake.name<"oehb7">} : i32
    %12 = mux %18#2 [%11, %6] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %13:2 = fork [2] %12 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %14 = tehb [1] %18#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %15 = mux %14 [%57, %8] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %16 = mux %18#0 [%58, %9] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %17:2 = fork [2] %16 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %59, %10 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %18:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %19 = arith.cmpi ult, %13#1, %17#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %20:4 = fork [4] %19 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %20#3, %17#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %20#2, %13#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %21 = oehb [1] %15 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %22 = oehb [1] %20#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %23 = tehb [1] %22 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %trueResult_2, %falseResult_3 = cond_br %23, %21 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %20#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %24 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %25 = tehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %26 = merge %25 {bb = 2 : ui32, name = #handshake.name<"merge2">} : i32
    %27 = oehb [1] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %28 = merge %27 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %29:2 = fork [2] %28 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %30 = merge %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %31 = oehb [1] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %32 = tehb [1] %31 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : none
    %33 = merge %32 {bb = 2 : ui32, name = #handshake.name<"merge6">} : none
    %34 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %35 = constant %34 {bb = 2 : ui32, name = #handshake.name<"constant4">, value = 1 : i2} : i2
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 10 : i5} : i5
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %40 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %41 = constant %40 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = false} : i1
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %43 = source {bb = 2 : ui32, name = #handshake.name<"source3">}
    %44 = constant %43 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 2 : i3} : i3
    %45 = arith.extsi %44 {bb = 2 : ui32, name = #handshake.name<"extsi4">} : i3 to i32
    %addressResult, %dataResult = mc_load[%29#1] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %46:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %47 = arith.shli %46#1, %45 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %48 = arith.addi %46#0, %47 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %49 = oehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %50:2 = fork [2] %49 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i32
    %51 = arith.cmpi sgt, %50#1, %39 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %52 = arith.select %51, %50#0, %42 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %53 = arith.addi %30, %52 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %54 = arith.addi %29#0, %36 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %55 = br %54 {bb = 2 : ui32, name = #handshake.name<"br6">} : i32
    %56 = oehb [1] %53 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %57 = br %56 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %58 = br %26 {bb = 2 : ui32, name = #handshake.name<"br8">} : i32
    %59 = br %33 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %60 = merge %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %61 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %60 : i32
    end {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %61, %done : i32, none
  }
}

