module {
  handshake.func @sumi3_mem(%arg0: memref<1000xi32>, %arg1: none, ...) -> i32 attributes {argNames = ["a", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<1000xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork1">} : i1
    %3 = arith.extsi %2#0 {bb = 0 : ui32, name = #handshake.name<"extsi3">} : i1 to i11
    %4 = arith.extsi %2#1 {bb = 0 : ui32, name = #handshake.name<"extsi4">} : i1 to i32
    %5 = mux %14#0 [%trueResult, %3] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %6:2 = fork [2] %5 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %7 = oehb [1] %6#0 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i11
    %8 = tehb [1] %7 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i11
    %9 = arith.extsi %8 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %10 = arith.extsi %6#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %11 = oehb [1] %14#1 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i1
    %12 = tehb [9] %11 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i1
    %13 = mux %12 [%trueResult_0, %4] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %14:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %15 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %16 = constant %15 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %17 = arith.extsi %16 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %18 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %19 = constant %18 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %20 = arith.extsi %19 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%10] %memOutputs {bb = 1 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %21:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %22 = arith.muli %21#1, %21#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %23 = tehb [4] %21#0 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i32
    %24 = arith.muli %22, %23 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %25 = arith.addi %13, %24 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %26 = arith.addi %9, %20 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %27:2 = fork [2] %26 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %28 = arith.trunci %27#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %29 = arith.cmpi ult, %27#1, %17 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %30:3 = fork [3] %29 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %30#0, %28 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %31 = oehb [1] %25 {bb = 1 : ui32, name = #handshake.name<"oehb3">} : i32
    %32 = tehb [1] %31 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i32
    %33 = oehb [1] %30#1 {bb = 1 : ui32, name = #handshake.name<"oehb4">} : i1
    %34 = tehb [9] %33 {bb = 1 : ui32, name = #handshake.name<"tehb5">} : i1
    %trueResult_0, %falseResult_1 = cond_br %34, %32 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %35 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %36 = tehb [1] %35 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : none
    %trueResult_2, %falseResult_3 = cond_br %30#2, %36 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %37 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %falseResult_1 : i32
    end {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %37, %done : i32, none
  }
}

