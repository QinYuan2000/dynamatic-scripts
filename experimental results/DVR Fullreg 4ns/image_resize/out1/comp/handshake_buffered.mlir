module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%42, %addressResult, %addressResult_2, %dataResult_3) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %0 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg2 {bb = 0 : ui32, name = #handshake.name<"merge1">} : none
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %3 = constant %2#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %4 = br %3 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi7">} : i1 to i6
    %6 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %7 = br %2#0 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %8 = mux %10#0 [%trueResult_10, %5] {bb = 1 : ui32, name = #handshake.name<"mux5">} : i1, i6
    %9 = mux %10#1 [%trueResult_12, %6] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %result, %index = control_merge %trueResult_14, %7 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %10:2 = fork [2] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %11:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %12 = constant %11#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %13 = br %12 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %14 = arith.extsi %13 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %15 = br %9 {bb = 1 : ui32, name = #handshake.name<"br6">} : i32
    %16 = br %8 {bb = 1 : ui32, name = #handshake.name<"br9">} : i6
    %17 = br %11#1 {bb = 1 : ui32, name = #handshake.name<"br8">} : none
    %18 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i6
    %19 = mux %39#1 [%18, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %20 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %22 = arith.extsi %21#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %23 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %24 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %25 = oehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %26 = tehb [1] %39#2 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i1
    %27 = mux %26 [%trueResult_4, %25] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %28 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %29 = tehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %30:2 = fork [2] %29 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %31 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %32 = tehb [1] %39#0 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i1
    %33 = oehb [1] %trueResult_6 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %34 = tehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i6
    %35 = mux %32 [%34, %31] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %36:3 = fork [3] %35 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %37 = arith.extsi %36#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %38 = arith.extsi %36#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %39:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %40:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %41 = constant %40#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %43 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %44 = constant %43 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %45:3 = fork [3] %44 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %46 = arith.extsi %45#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %47 = arith.extsi %45#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %48 = arith.extsi %45#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %49 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %50 = constant %49 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %52 = arith.muli %38, %47 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %53 = arith.extsi %52 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %54 = tehb [2] %23 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %55 = arith.addi %54, %53 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %56 = arith.extsi %55 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%56] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %57 = tehb [2] %30#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %58 = arith.subi %57, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %59 = arith.muli %37, %46 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %60 = arith.extsi %59 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %61 = tehb [2] %22 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i13
    %62 = arith.addi %61, %60 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %63 = arith.extsi %62 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %64 = tehb [1] %63 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%64] %58 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %65 = arith.addi %24, %51 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %66:2 = fork [2] %65 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %67 = arith.trunci %66#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %68 = arith.cmpi ult, %66#1, %48 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %69:4 = fork [4] %68 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %69#0, %67 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %70 = oehb [1] %69#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %trueResult_4, %falseResult_5 = cond_br %70, %30#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %69#1, %36#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %71 = oehb [1] %40#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %72 = tehb [1] %71 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %73 = oehb [1] %69#3 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i1
    %trueResult_8, %falseResult_9 = cond_br %73, %72 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %74 = merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %75 = oehb [1] %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i6
    %76 = merge %75 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %77 = arith.extsi %76 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %78 = merge %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %79 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %80 = constant %79 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %81 = arith.extsi %80 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %82 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %83 = constant %82 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %84 = arith.extsi %83 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %85 = arith.addi %77, %84 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %86 = oehb [1] %85 {bb = 3 : ui32, name = #handshake.name<"oehb10">} : i7
    %87:2 = fork [2] %86 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %88 = arith.trunci %87#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %89 = arith.cmpi ult, %87#1, %81 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %90:3 = fork [3] %89 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %90#0, %88 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %90#1, %74 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %90#2, %78 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %91 = oehb [1] %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"oehb11">} : none
    %92 = merge %91 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %93 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %92 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %93, %done : none, none
  }
}

