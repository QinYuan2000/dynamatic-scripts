module {
  handshake.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %5 = mux %14#2 [%37, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %6 = tehb [3001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %8 = oehb [1] %14#1 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i1
    %9 = tehb [1] %8 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i1
    %10 = mux %9 [%38, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %11 = mux %14#0 [%trueResult, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %12 = tehb [3001] %11 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %13:2 = fork [2] %12 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %trueResult_4, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %14:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %15 = arith.cmpi ult, %7#1, %13#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %16:4 = fork [4] %15 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %16#3, %13#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %16#2, %7#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %17 = tehb [3001] %16#1 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i1
    %trueResult_2, %falseResult_3 = cond_br %17, %10 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %18 = tehb [3001] %result {bb = 1 : ui32, name = #handshake.name<"tehb2">} : none
    %trueResult_4, %falseResult_5 = cond_br %16#0, %18 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %19:2 = fork [2] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %20 = tehb [3001] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i32
    %21 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %22 = constant %21 {bb = 2 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %24 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %25 = constant %24 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 10 : i5} : i5
    %26 = arith.extsi %25 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %27 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %28 = constant %27 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = false} : i1
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %addressResult, %dataResult = mc_load[%19#1] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %30:2 = fork [2] %dataResult {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %31 = arith.cmpi sgt, %30#1, %26 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %32 = tehb [3001] %30#0 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %33 = tehb [3001] %31 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i1
    %34 = arith.select %33, %32, %29 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %35 = arith.addi %20, %34 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %36 = tehb [3001] %19#0 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i32
    %37 = arith.addi %36, %23 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %38 = tehb [3001] %35 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %39 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %falseResult_3 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %39, %done : i32, none
  }
}

