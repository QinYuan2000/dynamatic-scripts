module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%29, %addressResult, %addressResult_2, %dataResult_3) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %9 = mux %24#1 [%trueResult, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %10:3 = fork [3] %9 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %11 = arith.extsi %10#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %12 = arith.extsi %10#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %13 = arith.extsi %10#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %14 = mux %24#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %15 = oehb [1] %14 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %16 = tehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %17:2 = fork [2] %16 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %18 = mux %24#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %19 = oehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %20 = tehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %22 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %23 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %24:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %25 = oehb [1] %result_0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %26 = tehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : none
    %27:2 = fork [2] %26 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %28 = constant %27#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %30 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %31 = constant %30 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %32:3 = fork [3] %31 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %33 = arith.extsi %32#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %34 = arith.extsi %32#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %35 = arith.extsi %32#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %36 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %37 = constant %36 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %38 = arith.extsi %37 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %39 = arith.muli %23, %34 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %41 = tehb [5] %12 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %42 = arith.addi %41, %40 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%43] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %44 = tehb [5] %17#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %45 = arith.subi %44, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %46 = arith.muli %22, %33 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %47 = arith.extsi %46 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %48 = tehb [5] %11 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i13
    %49 = arith.addi %48, %47 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %51 = tehb [1] %50 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%51] %45 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %52 = arith.addi %13, %38 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %53 = oehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i7
    %54 = tehb [1] %53 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i7
    %55:2 = fork [2] %54 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %56 = arith.trunci %55#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %57 = arith.cmpi ult, %55#1, %35 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %58:4 = fork [4] %57 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %58#0, %56 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %58#2, %17#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %58#1, %21#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %58#3, %27#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %59 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %60 = oehb [1] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : none
    %61 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %62 = constant %61 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %63 = arith.extsi %62 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %64 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %65 = constant %64 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %67 = arith.addi %59, %66 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %68 = oehb [1] %67 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i7
    %69:2 = fork [2] %68 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %70 = arith.trunci %69#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %71 = arith.cmpi ult, %69#1, %63 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %72:3 = fork [3] %71 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %72#0, %70 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %73 = oehb [1] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i32
    %trueResult_12, %falseResult_13 = cond_br %72#1, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %72#2, %60 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %74 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %74, %done : none, none
  }
}

