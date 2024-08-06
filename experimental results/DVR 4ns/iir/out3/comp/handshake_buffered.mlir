module {
  handshake.func @iir(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: i32, %arg3: i32, %arg4: none, ...) -> i32 attributes {argNames = ["y", "x", "a", "b", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg1 : memref<1000xi32>] (%addressResult_2) {connectedBlocks = [1 : i32], name = #handshake.name<"mem_controller0">} : (i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg0 : memref<1000xi32>] (%addressResult, %32, %addressResult_4, %dataResult_5) {connectedBlocks = [0 : i32, 1 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %0 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg4 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3:3 = fork [3] %2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %4 = constant %3#2 {bb = 0 : ui32, name = #handshake.name<"constant2">, value = false} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi0">} : i1 to i32
    %6 = constant %3#1 {bb = 0 : ui32, name = #handshake.name<"constant5">, value = 1 : i2} : i2
    %addressResult, %dataResult = mc_load[%5] %memOutputs_0 {bb = 0 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %7 = br %6 {bb = 0 : ui32, name = #handshake.name<"br0">} : i2
    %8 = arith.extsi %7 {bb = 0 : ui32, name = #handshake.name<"extsi5">} : i2 to i11
    %9 = br %dataResult {bb = 0 : ui32, name = #handshake.name<"br2">} : i32
    %10 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %11 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %12 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %13 = mux %27#0 [%trueResult, %8] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i11
    %14 = tehb [3001] %13 {bb = 1 : ui32, name = #handshake.name<"tehb2">} : i11
    %15:2 = fork [2] %14 {bb = 1 : ui32, name = #handshake.name<"fork1">} : i11
    %16 = arith.extsi %15#0 {bb = 1 : ui32, name = #handshake.name<"extsi6">} : i11 to i12
    %17 = arith.extsi %15#1 {bb = 1 : ui32, name = #handshake.name<"extsi7">} : i11 to i32
    %18:2 = fork [2] %17 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i32
    %19 = tehb [3001] %27#3 {bb = 1 : ui32, name = #handshake.name<"tehb7">} : i1
    %20 = mux %19 [%trueResult_6, %9] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %21 = mux %27#2 [%trueResult_8, %10] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %22 = tehb [3001] %21 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %23:2 = fork [2] %22 {bb = 1 : ui32, name = #handshake.name<"fork3">} : i32
    %24 = mux %27#1 [%trueResult_10, %11] {bb = 1 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %25 = tehb [3001] %24 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %26:2 = fork [2] %25 {bb = 1 : ui32, name = #handshake.name<"fork4">} : i32
    %result, %index = control_merge %trueResult_12, %12 {bb = 1 : ui32, name = #handshake.name<"control_merge2">} : none, i1
    %27:4 = fork [4] %index {bb = 1 : ui32, name = #handshake.name<"fork5">} : i1
    %28 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %29 = tehb [1] %28 {bb = 1 : ui32, name = #handshake.name<"tehb6">} : none
    %30:2 = fork [2] %29 {bb = 1 : ui32, name = #handshake.name<"fork6">} : none
    %31 = constant %30#0 {bb = 1 : ui32, name = #handshake.name<"constant6">, value = 1 : i2} : i2
    %32 = arith.extsi %31 {bb = 1 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %33 = source {bb = 1 : ui32, name = #handshake.name<"source0">}
    %34 = constant %33 {bb = 1 : ui32, name = #handshake.name<"constant7">, value = 1000 : i11} : i11
    %35 = arith.extsi %34 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i11 to i12
    %36 = source {bb = 1 : ui32, name = #handshake.name<"source1">}
    %37 = constant %36 {bb = 1 : ui32, name = #handshake.name<"constant8">, value = 1 : i2} : i2
    %38 = arith.extsi %37 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i2 to i12
    %39 = arith.muli %23#1, %20 {bb = 1 : ui32, name = #handshake.name<"muli0">} : i32
    %addressResult_2, %dataResult_3 = mc_load[%18#0] %memOutputs {bb = 1 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %40 = arith.muli %26#1, %dataResult_3 {bb = 1 : ui32, name = #handshake.name<"muli1">} : i32
    %41 = arith.addi %39, %40 {bb = 1 : ui32, name = #handshake.name<"addi0">} : i32
    %42:2 = fork [2] %41 {bb = 1 : ui32, name = #handshake.name<"fork7">} : i32
    %43 = oehb [1] %18#1 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %44 = tehb [1] %43 {bb = 1 : ui32, name = #handshake.name<"tehb3">} : i32
    %addressResult_4, %dataResult_5 = mc_store[%44] %42#1 {bb = 1 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %45 = arith.addi %16, %38 {bb = 1 : ui32, name = #handshake.name<"addi2">} : i12
    %46 = tehb [3001] %45 {bb = 1 : ui32, name = #handshake.name<"tehb8">} : i12
    %47:2 = fork [2] %46 {bb = 1 : ui32, name = #handshake.name<"fork8">} : i12
    %48 = arith.trunci %47#0 {bb = 1 : ui32, name = #handshake.name<"trunci0">} : i12 to i11
    %49 = arith.cmpi ult, %47#1, %35 {bb = 1 : ui32, name = #handshake.name<"cmpi1">} : i12
    %50:5 = fork [5] %49 {bb = 1 : ui32, name = #handshake.name<"fork9">} : i1
    %trueResult, %falseResult = cond_br %50#0, %48 {bb = 1 : ui32, name = #handshake.name<"cond_br0">} : i11
    sink %falseResult {name = #handshake.name<"sink0">} : i11
    %51 = tehb [3001] %50#1 {bb = 1 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_6, %falseResult_7 = cond_br %51, %42#0 {bb = 1 : ui32, name = #handshake.name<"cond_br2">} : i32
    %52 = tehb [3001] %23#0 {bb = 1 : ui32, name = #handshake.name<"tehb4">} : i32
    %trueResult_8, %falseResult_9 = cond_br %50#2, %52 {bb = 1 : ui32, name = #handshake.name<"cond_br3">} : i32
    sink %falseResult_9 {name = #handshake.name<"sink1">} : i32
    %53 = tehb [3001] %26#0 {bb = 1 : ui32, name = #handshake.name<"tehb5">} : i32
    %trueResult_10, %falseResult_11 = cond_br %50#3, %53 {bb = 1 : ui32, name = #handshake.name<"cond_br4">} : i32
    sink %falseResult_11 {name = #handshake.name<"sink2">} : i32
    %trueResult_12, %falseResult_13 = cond_br %50#4, %30#1 {bb = 1 : ui32, name = #handshake.name<"cond_br5">} : none
    sink %falseResult_13 {name = #handshake.name<"sink3">} : none
    %54 = merge %falseResult_7 {bb = 2 : ui32, name = #handshake.name<"merge3">} : i32
    %55 = return {bb = 2 : ui32, name = #handshake.name<"return1">} %54 : i32
    end {bb = 2 : ui32, name = #handshake.name<"end0">} %55, %done, %done_1 : i32, none, none
  }
}

