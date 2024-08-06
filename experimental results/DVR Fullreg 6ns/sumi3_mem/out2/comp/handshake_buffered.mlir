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
    %9 = mux %15#0 [%trueResult, %5] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i11
    %10:2 = fork [2] %9 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i11
    %11 = arith.extsi %10#0 {bb = 1 : ui32, name = #handshake.name<"extsi5">} : i11 to i12
    %12 = arith.extsi %10#1 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i32
    %13 = tehb [2008] %15#1 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i1
    %14 = mux %13 [%trueResult_0, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_2, %8 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %15:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork3">} : i1
    %16 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %17 = constant %16 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1000 : i11} : i11
    %18 = arith.extsi %17 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i12
    %19 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %20 = constant %19 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1 : i2} : i2
    %21 = arith.extsi %20 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i2 to i12
    %addressResult, %dataResult = mc_load[%12] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %22:3 = fork [3] %dataResult {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %23 = arith.muli %22#1, %22#2 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %24 = tehb [2004] %22#0 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i32
    %25 = arith.muli %23, %24 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %26 = oehb [1] %14 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %27 = tehb [1] %26 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %28 = arith.addi %27, %25 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %29 = arith.addi %11, %21 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %30 = oehb [1] %29 {bb = 1 : ui32, name = #handshake.name<"oehb2">} : i12
    %31 = tehb [1] %30 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i12
    %32:2 = fork [2] %31 {bb = 1 : ui32, name = #handshake.name<"fork5">} : i12
    %33 = arith.trunci %32#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %34 = arith.cmpi ult, %32#1, %18 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %35:3 = fork [3] %34 {bb = 1 : ui32, name = #handshake.name<"fork6">} : i1
    %trueResult, %falseResult = cond_br %35#0, %33 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %36 = tehb [2008] %35#1 {bb = 1 : ui32, name = #handshake.name<"tehb5">} : i1
    %trueResult_0, %falseResult_1 = cond_br %36, %28 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %37 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %38 = tehb [1] %37 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : none
    %trueResult_2, %falseResult_3 = cond_br %35#2, %38 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : none
    sink %falseResult_3 {name = #handshake.name<"sink1">} : none
    %39 = merge %falseResult_1 {bb = 2 : ui32, name = #handshake.name<"merge1">} : i32
    %40 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %39 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %40, %done : i32, none
  }
}

