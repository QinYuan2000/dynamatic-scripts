module {
  handshake.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
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
    %11 = mux %18#2 [%50, %6] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %13 = oehb [1] %18#1 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i1
    %14 = tehb [1] %13 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %15 = mux %14 [%51, %8] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %16 = mux %18#0 [%52, %9] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %17:2 = fork [2] %16 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %53, %10 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %18:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %19 = arith.cmpi ult, %12#1, %17#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %20:4 = fork [4] %19 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %20#3, %17#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %20#2, %12#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %21 = oehb [1] %20#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %22 = tehb [1] %21 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %trueResult_2, %falseResult_3 = cond_br %22, %15 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %20#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %23 = tehb [3001] %trueResult {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %24 = merge %23 {bb = 2 : ui32, name = #handshake.name<"merge2">} : i32
    %25 = merge %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %26:2 = fork [2] %25 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %27 = oehb [1] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %28 = tehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %29 = merge %28 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %30 = tehb [3001] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %31 = merge %30 {bb = 2 : ui32, name = #handshake.name<"merge6">} : none
    %32 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %33 = constant %32 {bb = 2 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %34 = arith.extsi %33 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %35 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %36 = constant %35 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 10 : i5} : i5
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %38 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %39 = constant %38 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = false} : i1
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %addressResult, %dataResult = mc_load[%26#1] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %41:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %42 = arith.cmpi sgt, %41#1, %37 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %43 = arith.select %42, %41#0, %40 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %44 = oehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %45 = tehb [1] %44 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i32
    %46 = arith.addi %29, %45 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %47 = arith.addi %26#0, %34 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %48 = oehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i32
    %50 = br %49 {bb = 2 : ui32, name = #handshake.name<"br6">} : i32
    %51 = br %46 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %52 = br %24 {bb = 2 : ui32, name = #handshake.name<"br8">} : i32
    %53 = br %31 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %54 = merge %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %55 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %54 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %55, %done : i32, none
  }
}

