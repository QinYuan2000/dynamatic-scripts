module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%33, %addressResult, %addressResult_2, %dataResult_3) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %0:2 = fork [2] %arg2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi7">} : i1 to i6
    %3 = mux %5#0 [%trueResult_10, %2] {bb = 1 : ui32, name = #handshake.name<"mux5">} : i1, i6
    %4 = mux %5#1 [%trueResult_12, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_14, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %5:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %6:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %7 = constant %6#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %8 = arith.extsi %7 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %9 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i6
    %10 = mux %30#1 [%9, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %11 = oehb [1] %10 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %13 = arith.extsi %12#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %14 = arith.extsi %12#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %15 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %16 = oehb [1] %4 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %17 = tehb [1] %30#2 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i1
    %18 = mux %17 [%trueResult_4, %16] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %19 = oehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %20 = tehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %21:2 = fork [2] %20 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %22 = oehb [1] %3 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %23 = tehb [1] %30#0 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i1
    %24 = oehb [1] %trueResult_6 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %25 = tehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i6
    %26 = mux %23 [%25, %22] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %27:3 = fork [3] %26 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %28 = arith.extsi %27#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %29 = arith.extsi %27#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %30:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %31:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %32 = constant %31#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %34 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %35 = constant %34 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %36:3 = fork [3] %35 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %37 = arith.extsi %36#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %38 = arith.extsi %36#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %39 = arith.extsi %36#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %40 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %41 = constant %40 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %43 = arith.muli %29, %38 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %44 = arith.extsi %43 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %45 = tehb [2] %14 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %46 = arith.addi %45, %44 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %47 = arith.extsi %46 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%47] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %48 = tehb [2] %21#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %49 = arith.subi %48, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %50 = arith.muli %28, %37 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %52 = tehb [2] %13 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i13
    %53 = arith.addi %52, %51 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %54 = arith.extsi %53 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %55 = tehb [1] %54 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%55] %49 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %56 = arith.addi %15, %42 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %57:2 = fork [2] %56 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %58 = arith.trunci %57#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %59 = arith.cmpi ult, %57#1, %39 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %60:4 = fork [4] %59 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %60#0, %58 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %61 = oehb [1] %60#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %trueResult_4, %falseResult_5 = cond_br %61, %21#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %60#1, %27#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %62 = oehb [1] %31#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %63 = tehb [1] %62 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %64 = oehb [1] %60#3 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i1
    %trueResult_8, %falseResult_9 = cond_br %64, %63 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %65 = oehb [1] %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i6
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %67 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %68 = constant %67 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %69 = arith.extsi %68 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %70 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %71 = constant %70 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %72 = arith.extsi %71 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %73 = arith.addi %66, %72 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %74 = oehb [1] %73 {bb = 3 : ui32, name = #handshake.name<"oehb10">} : i7
    %75:2 = fork [2] %74 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %76 = arith.trunci %75#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %77 = arith.cmpi ult, %75#1, %69 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %78:3 = fork [3] %77 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %78#0, %76 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %78#1, %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %78#2, %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %79 = oehb [1] %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"oehb11">} : none
    %80 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %79 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %80, %done : none, none
  }
}

