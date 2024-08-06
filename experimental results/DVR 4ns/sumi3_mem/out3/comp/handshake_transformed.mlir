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
    %9 = mux %14#0 [%trueResult, %5] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %10:2 = fork [2] %9 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %11 = arith.extsi %10#0 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %12 = arith.extsi %10#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %13 = mux %14#1 [%trueResult_0, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %14:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %15 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %16 = constant %15 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %17 = arith.extsi %16 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %18 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %19 = constant %18 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %20 = arith.extsi %19 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%12] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %21:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %22 = arith.muli %21#1, %21#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %23 = arith.muli %22, %21#0 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %24 = arith.addi %13, %23 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %25 = arith.addi %11, %20 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %26:2 = fork [2] %25 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %27 = arith.trunci %26#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %28 = arith.cmpi ult, %26#1, %17 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %29:3 = fork [3] %28 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %29#0, %27 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %trueResult_0, %falseResult_1 = cond_br %29#1, %24 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_2, %falseResult_3 = cond_br %29#2, %result {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %30 = merge %falseResult_1 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %31 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %30 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %31, %done : i32, none
  }
}

