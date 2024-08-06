module {
  handshake.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: none, ...) -> i32 attributes {argNames = ["di", "idx", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %3:2 = fork [2] %2 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %4 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i11
    %6 = br %3#1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i1
    %7 = arith.extsi %6 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %8 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %9 = oehb [1] %trueResult {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i11
    %10 = tehb [1] %9 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i11
    %11 = mux %20#0 [%10, %5] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %12:3 = fork [3] %11 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %13 = arith.extsi %12#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %14 = arith.extsi %12#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %15 = arith.extsi %12#2 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i32
    %16 = tehb [2004] %20#1 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %17 = mux %16 [%trueResult_4, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %18 = oehb [1] %trueResult_6 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : none
    %19 = tehb [1] %18 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : none
    %result, %index = control_merge %19, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %20:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %21 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %22 = constant %21 {bb = 1 : ui32, name = #handshake.name<"constant4">, value = 999 : i11} : i11
    %23 = arith.extsi %22 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i11 to i12
    %24 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %25 = constant %24 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1000 : i11} : i11
    %26 = arith.extsi %25 {bb = 1 : ui32, name = #handshake.name<"extsi10">} : i11 to i12
    %27 = source {bb = 1 : ui32, name = #handshake.name<"source2">}
    %28 = constant %27 {bb = 1 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %29 = arith.extsi %28 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i2 to i12
    %addressResult, %dataResult = mc_load[%15] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %30 = arith.subi %23, %14 {bb = 1 : ui32, name = #handshake.name<"subi1">} : i12
    %31 = arith.extsi %30 {bb = 1 : ui32, name = #handshake.name<"extsi12">} : i12 to i32
    %addressResult_2, %dataResult_3 = mc_load[%31] %memOutputs_0 {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %32 = arith.muli %dataResult, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %33 = oehb [1] %17 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %34 = tehb [1] %33 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %35 = arith.addi %34, %32 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %36 = arith.addi %13, %29 {bb = 1 : ui32, name = #handshake.name<"addi1">} : i12
    %37:2 = fork [2] %36 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i12
    %38 = arith.trunci %37#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %39 = arith.cmpi ult, %37#1, %26 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %40:3 = fork [3] %39 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %40#0, %38 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %41 = tehb [2005] %40#1 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i1
    %trueResult_4, %falseResult_5 = cond_br %41, %35 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %trueResult_6, %falseResult_7 = cond_br %40#2, %result {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_7 {name = #handshake.name<"sink1">} : none
    %42 = merge %falseResult_5 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %43 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %42 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %43, %done, %done_1 : i32, none, none
  }
}

