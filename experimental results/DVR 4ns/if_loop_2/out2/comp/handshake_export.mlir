module {
  handshake.func @if_loop_2(%arg0: memref<100xi32>, %arg1: i32, %arg2: none, ...) -> i32 attributes {argNames = ["a", "n", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %5 = mux %13#2 [%37, %3] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %6 = tehb [4001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %8 = oehb [1] %13#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %9 = mux %8 [%35, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %10 = mux %13#0 [%trueResult, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %11 = tehb [4001] %10 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %trueResult_4, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %13:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %14 = arith.cmpi ult, %7#1, %12#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %15:4 = fork [4] %14 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %15#3, %12#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %15#2, %7#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %16 = oehb [1] %9 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %17 = tehb [4001] %16 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i32
    %18 = tehb [2003] %15#1 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i1
    %trueResult_2, %falseResult_3 = cond_br %18, %17 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %19 = tehb [4001] %result {bb = 1 : ui32, name = #handshake.name<"tehb3">} : none
    %trueResult_4, %falseResult_5 = cond_br %15#0, %19 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %20:2 = fork [2] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %21 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %22 = constant %21 {bb = 2 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %24 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %25 = constant %24 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 10 : i5} : i5
    %26 = arith.extsi %25 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %27 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %28 = constant %27 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = false} : i1
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %addressResult, %dataResult = mc_load[%20#1] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %30 = oehb [1] %dataResult {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %31:2 = fork [2] %30 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %32 = arith.cmpi sgt, %31#1, %26 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %33 = arith.select %32, %31#0, %29 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %34 = oehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %35 = arith.addi %trueResult_2, %34 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %36 = oehb [1] %20#0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %37 = arith.addi %36, %23 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %38 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %falseResult_3 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %38, %done : i32, none
  }
}

