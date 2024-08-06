module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%32, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = mux %29#1 [%trueResult, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %19:3 = fork [3] %18 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %20 = arith.extsi %19#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %21 = arith.extsi %19#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %22 = arith.extsi %19#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %23 = mux %29#2 [%trueResult_4, %15] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %24:2 = fork [2] %23 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %25 = mux %29#0 [%trueResult_6, %16] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %26:3 = fork [3] %25 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %27 = arith.extsi %26#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %28 = arith.extsi %26#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %29:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %30:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %31 = constant %30#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %32 = arith.extsi %31 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %33 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %34 = constant %33 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %35:3 = fork [3] %34 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %36 = arith.extsi %35#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %37 = arith.extsi %35#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %38 = arith.extsi %35#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %39 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %40 = constant %39 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %41 = arith.extsi %40 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %42 = arith.muli %28, %37 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %44 = arith.addi %21, %43 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %45 = arith.extsi %44 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%45] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %46 = arith.subi %24#1, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %47 = arith.muli %27, %36 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %48 = arith.extsi %47 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %49 = arith.addi %20, %48 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%50] %46 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %51 = arith.addi %22, %41 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %52:2 = fork [2] %51 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %53 = arith.trunci %52#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %54 = arith.cmpi ult, %52#1, %38 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %55:4 = fork [4] %54 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %55#0, %53 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %55#2, %24#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %55#1, %26#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %55#3, %30#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %56 = merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %57 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %59 = merge %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %60 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %61 = constant %60 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %63 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %64 = constant %63 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %65 = arith.extsi %64 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %66 = arith.addi %58, %65 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %67:2 = fork [2] %66 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %68 = arith.trunci %67#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %69 = arith.cmpi ult, %67#1, %62 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %70:3 = fork [3] %69 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %70#0, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %70#1, %56 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %70#2, %59 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %71 = merge %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %72 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %71 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %72, %done : none, none
  }
}

