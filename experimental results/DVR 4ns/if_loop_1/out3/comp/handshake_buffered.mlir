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
    %11 = mux %17#2 [%57, %6] {bb = 1 : ui32, name = #handshake.name<"mux0">} : i1, i32
    %12:2 = fork [2] %11 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %13 = oehb [4002] %17#1 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i1
    %14 = mux %13 [%58, %8] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %15 = mux %17#0 [%59, %9] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %16:2 = fork [2] %15 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %result, %index = control_merge %60, %10 {bb = 1 : ui32, name = #handshake.name<"control_merge3">} : none, i1
    %17:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork4">} : i1
    %18 = arith.cmpi ult, %12#1, %16#1 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i32
    %19:4 = fork [4] %18 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %19#3, %16#0 {bb = 1 : ui32, name = #handshake.name<"cond_br1">} : i32
    sink %falseResult {name = #handshake.name<"sink0">} : i32
    %trueResult_0, %falseResult_1 = cond_br %19#2, %12#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    sink %falseResult_1 {name = #handshake.name<"sink1">} : i32
    %20 = tehb [3001] %14 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %21 = oehb [4002] %19#1 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i1
    %trueResult_2, %falseResult_3 = cond_br %21, %20 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_4, %falseResult_5 = cond_br %19#0, %result {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : none
    sink %falseResult_5 {name = #handshake.name<"sink2">} : none
    %22 = tehb [3001] %trueResult {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i32
    %23 = merge %22 {bb = 2 : ui32, name = #handshake.name<"merge2">} : i32
    %24 = tehb [3001] %trueResult_0 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %25 = merge %24 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %26:2 = fork [2] %25 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i32
    %27 = tehb [3001] %trueResult_2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %28 = merge %27 {bb = 2 : ui32, name = #handshake.name<"merge4">} : i32
    %29 = tehb [3001] %trueResult_4 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %30 = merge %29 {bb = 2 : ui32, name = #handshake.name<"merge6">} : none
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant4">, value = 1 : i2} : i2
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi1">} : i2 to i32
    %34 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %35 = constant %34 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 10 : i5} : i5
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i5 to i32
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = false} : i1
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i1 to i32
    %40 = source {bb = 2 : ui32, name = #handshake.name<"source3">}
    %41 = constant %40 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 2 : i3} : i3
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi4">} : i3 to i32
    %addressResult, %dataResult = mc_load[%26#1] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %43 = tehb [3001] %dataResult {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i32
    %44:2 = fork [2] %43 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i32
    %45 = arith.shli %44#1, %42 {bb = 2 : ui32, name = #handshake.name<"shli0">} : i32
    %46 = tehb [3001] %44#0 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i32
    %47 = tehb [3001] %45 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %48 = arith.addi %46, %47 {bb = 2 : ui32, name = #handshake.name<"addi2">} : i32
    %49 = tehb [3001] %48 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %50:2 = fork [2] %49 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i32
    %51 = arith.cmpi sgt, %50#1, %36 {bb = 2 : ui32, name = #handshake.name<"cmpi0">} : i32
    %52 = arith.select %51, %50#0, %39 {bb = 2 : ui32, name = #handshake.name<"select0">} : i32
    %53 = tehb [3001] %52 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %54 = arith.addi %28, %53 {bb = 2 : ui32, name = #handshake.name<"addi1">} : i32
    %55 = arith.addi %26#0, %33 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %56 = tehb [3001] %55 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i32
    %57 = br %56 {bb = 2 : ui32, name = #handshake.name<"br6">} : i32
    %58 = br %54 {bb = 2 : ui32, name = #handshake.name<"br7">} : i32
    %59 = br %23 {bb = 2 : ui32, name = #handshake.name<"br8">} : i32
    %60 = br %30 {bb = 2 : ui32, name = #handshake.name<"br9">} : none
    %61 = merge %falseResult_3 {bb = 3 : ui32, name = #handshake.name<"merge5">} : i32
    %62 = return {bb = 3 : ui32, name = #handshake.name<"return1">} %61 : i32
    end {bb = 3 : ui32, name = #handshake.name<"end0">} %62, %done : i32, none
  }
}

