module {
  handshake.func @sumi3_mem(%arg0: memref<1000xi32>, %arg1: none, ...) -> i32 attributes {argNames = ["a", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %3:2 = fork [2] %2 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %4 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi3">} : i1 to i11
    %6 = br %3#1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i1
    %7 = arith.extsi %6 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %8 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %9 = mux %16#0 [%trueResult, %5] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %10 = tehb [4001] %9 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i11
    %11:2 = fork [2] %10 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %12 = arith.extsi %11#0 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %13 = arith.extsi %11#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %14 = tehb [2007] %16#1 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i1
    %15 = mux %14 [%trueResult_0, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %16:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %17 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %18 = constant %17 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %19 = arith.extsi %18 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %20 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %21 = constant %20 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %22 = arith.extsi %21 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%13] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %23:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %24 = arith.muli %23#1, %23#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %25 = tehb [2003] %23#0 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i32
    %26 = arith.muli %24, %25 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %27 = oehb [1] %15 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %28 = tehb [4001] %27 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %29 = arith.addi %28, %26 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %30 = arith.addi %12, %22 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %31 = oehb [1] %30 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i12
    %32:2 = fork [2] %31 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %33 = arith.trunci %32#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %34 = arith.cmpi ult, %32#1, %19 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %35:3 = fork [3] %34 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %35#0, %33 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %36 = tehb [2007] %35#1 {bb = 1 : ui32, name = #handshake.name<"tehb5">} : i1
    %trueResult_0, %falseResult_1 = cond_br %36, %29 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %37 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %38 = tehb [4001] %37 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : none
    %trueResult_2, %falseResult_3 = cond_br %35#2, %38 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %39 = merge %falseResult_1 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %40 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %39 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %40, %done : i32, none
  }
}

