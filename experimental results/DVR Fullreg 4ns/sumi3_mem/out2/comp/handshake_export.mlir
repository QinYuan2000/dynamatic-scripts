module {
  handshake.func @sumi3_mem(%arg0: memref<1000xi32>, %arg1: none, ...) -> i32 attributes {argNames = ["a", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi3">} : i1 to i11
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %5 = mux %12#0 [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %6 = tehb [4001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i11
    %7:2 = fork [2] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %8 = arith.extsi %7#0 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %9 = arith.extsi %7#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %10 = tehb [2007] %12#1 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i1
    %11 = mux %10 [%trueResult_0, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %12:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %13 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %14 = constant %13 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %15 = arith.extsi %14 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %16 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %17 = constant %16 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %18 = arith.extsi %17 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%9] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %19:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %20 = arith.muli %19#1, %19#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %21 = tehb [2003] %19#0 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i32
    %22 = arith.muli %20, %21 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %23 = oehb [1] %11 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %24 = tehb [4001] %23 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %25 = arith.addi %24, %22 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %26 = arith.addi %8, %18 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %27 = oehb [1] %26 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i12
    %28:2 = fork [2] %27 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %29 = arith.trunci %28#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %30 = arith.cmpi ult, %28#1, %15 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %31:3 = fork [3] %30 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %31#0, %29 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %32 = tehb [2007] %31#1 {bb = 1 : ui32, name = #handshake.name<"tehb5">} : i1
    %trueResult_0, %falseResult_1 = cond_br %32, %25 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %33 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %34 = tehb [4001] %33 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : none
    %trueResult_2, %falseResult_3 = cond_br %31#2, %34 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %35 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %falseResult_1 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %35, %done : i32, none
  }
}

