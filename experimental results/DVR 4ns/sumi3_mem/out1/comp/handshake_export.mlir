module {
  handshake.func @sumi3_mem(%arg0: memref<1000xi32>, %arg1: none, ...) -> i32 attributes {argNames = ["a", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<1000xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi3">} : i1 to i11
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %5 = mux %12#0 [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %6:2 = fork [2] %5 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %7 = oehb [1] %6#0 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i11
    %8 = arith.extsi %7 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %9 = arith.extsi %6#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %10 = tehb [4] %12#1 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %11 = mux %10 [%trueResult_0, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %12:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %13 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %14 = constant %13 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %15 = arith.extsi %14 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %16 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %17 = constant %16 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %18 = arith.extsi %17 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%9] %memOutputs {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %19:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %20 = arith.muli %19#1, %19#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %21 = tehb [2] %19#0 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i32
    %22 = arith.muli %20, %21 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %23 = oehb [1] %11 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %24 = arith.addi %23, %22 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %25 = arith.addi %8, %18 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %26 = oehb [1] %25 {bb = 1 : ui32, name = #handshake.name<"oehb4">} : i12
    %27:2 = fork [2] %26 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %28 = arith.trunci %27#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %29 = arith.cmpi ult, %27#1, %15 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %30:3 = fork [3] %29 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %30#0, %28 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %31 = oehb [1] %24 {bb = 1 : ui32, name = #handshake.name<"oehb3">} : i32
    %32 = oehb [1] %30#1 {bb = 1 : ui32, name = #handshake.name<"oehb5">} : i1
    %33 = tehb [4] %32 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i1
    %trueResult_0, %falseResult_1 = cond_br %33, %31 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %34 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb2">} : none
    %35 = tehb [1] %34 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : none
    %trueResult_2, %falseResult_3 = cond_br %30#2, %35 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %36 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %falseResult_1 : i32
    end {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %36, %done : i32, none
  }
}

