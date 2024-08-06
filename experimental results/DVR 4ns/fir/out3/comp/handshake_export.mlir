module {
  handshake.func @fir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: none, ...) -> i32 attributes {argNames = ["di", "idx", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i11
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i1 to i32
    %5 = mux %13#0 [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %6 = tehb [3001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i11
    %7:3 = fork [3] %6 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %8 = arith.extsi %7#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %9 = arith.extsi %7#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %10 = arith.extsi %7#2 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i32
    %11 = oehb [4002] %13#1 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i1
    %12 = mux %11 [%trueResult_4, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_6, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %13:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %14 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %15 = constant %14 {bb = 1 : ui32, name = #handshake.name<"constant4">, value = 999 : i11} : i11
    %16 = arith.extsi %15 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i11 to i12
    %17 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %18 = constant %17 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1000 : i11} : i11
    %19 = arith.extsi %18 {bb = 1 : ui32, name = #handshake.name<"extsi10">} : i11 to i12
    %20 = source {bb = 1 : ui32, name = #handshake.name<"source2">}
    %21 = constant %20 {bb = 1 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %22 = arith.extsi %21 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i2 to i12
    %addressResult, %dataResult = mc_load[%10] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %23 = arith.subi %16, %9 {bb = 1 : ui32, name = #handshake.name<"subi1">} : i12
    %24 = arith.extsi %23 {bb = 1 : ui32, name = #handshake.name<"extsi12">} : i12 to i32
    %addressResult_2, %dataResult_3 = mc_load[%24] %memOutputs_0 {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %25 = arith.muli %dataResult, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %26 = oehb [1] %12 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %27 = tehb [1] %26 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %28 = arith.addi %27, %25 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %29 = arith.addi %8, %22 {bb = 1 : ui32, name = #handshake.name<"addi1">} : i12
    %30 = tehb [3001] %29 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i12
    %31:2 = fork [2] %30 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i12
    %32 = arith.trunci %31#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %33 = arith.cmpi ult, %31#1, %19 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %34:3 = fork [3] %33 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %trueResult, %falseResult = cond_br %34#0, %32 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %35 = oehb [4002] %34#1 {bb = 1 : ui32, name = #handshake.name<"oehb3">} : i1
    %trueResult_4, %falseResult_5 = cond_br %35, %28 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %36 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %37 = tehb [1] %36 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : none
    %trueResult_6, %falseResult_7 = cond_br %34#2, %37 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_7 {name = #handshake.name<"sink1">} : none
    %38 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %falseResult_5 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %38, %done, %done_1 : i32, none, none
  }
}

