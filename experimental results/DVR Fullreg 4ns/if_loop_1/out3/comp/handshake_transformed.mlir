module {
  handshake.func @if_loop_1(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
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
    %11 = mux %16#2 [%44, %6] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %13 = mux %16#1 [%45, %8] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %14 = mux %16#0 [%46, %9] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %15:2 = fork [2] %14 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %47, %10 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %16:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %17 = arith.cmpi ult, %12#1, %15#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %18:4 = fork [4] %17 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %18#3, %15#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %18#2, %12#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %trueResult_2, %falseResult_3 = cond_br %18#1, %13 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %18#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %19 = merge %trueResult {bb = 2 : ui32, name = #handshake.name<"merge2">} : i32
    %20 = merge %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %21:2 = fork [2] %20 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %22 = merge %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %23 = merge %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"merge6">} : none
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
    %addressResult, %dataResult = mc_load[%21#1] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %36:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %37 = arith.shli %36#1, %35 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %38 = arith.addi %36#0, %37 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %39:2 = fork [2] %38 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i32
    %40 = arith.cmpi sgt, %39#1, %29 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %41 = arith.select %40, %39#0, %32 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %42 = arith.addi %22, %41 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %43 = arith.addi %21#0, %26 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %44 = br %43 {bb = 2 : ui32, name = #handshake.name<"br6">} : i32
    %45 = br %42 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %46 = br %19 {bb = 2 : ui32, name = #handshake.name<"br8">} : i32
    %47 = br %23 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %48 = merge %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %49 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %48 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %49, %done : i32, none
  }
}

