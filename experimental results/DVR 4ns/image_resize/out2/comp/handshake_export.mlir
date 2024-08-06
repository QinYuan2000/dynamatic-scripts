module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%31, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %9 = mux %26#1 [%trueResult, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %10 = tehb [4001] %9 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %11:3 = fork [3] %10 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %12 = tehb [2005] %11#0 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %13 = arith.extsi %12 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %14 = arith.extsi %11#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %15 = arith.extsi %11#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %16 = mux %26#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %17 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %18 = tehb [4001] %17 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %19:2 = fork [2] %18 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %20 = mux %26#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %21 = oehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %22 = tehb [4001] %21 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %23:3 = fork [3] %22 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %24 = arith.extsi %23#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %25 = arith.extsi %23#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %26:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %27 = oehb [1] %result_0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %28 = tehb [4001] %27 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %29:2 = fork [2] %28 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %30 = constant %29#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %31 = arith.extsi %30 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %32 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %33 = constant %32 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %34:3 = fork [3] %33 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %35 = arith.extsi %34#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %36 = arith.extsi %34#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %37 = arith.extsi %34#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %38 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %39 = constant %38 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %41 = arith.muli %25, %36 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %43 = tehb [2005] %14 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %44 = arith.addi %43, %42 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %45 = arith.extsi %44 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%45] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %46 = tehb [2005] %19#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %47 = arith.subi %46, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %48 = arith.muli %24, %35 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %50 = arith.addi %13, %49 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%51] %47 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %52 = arith.addi %15, %40 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %53 = oehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i7
    %54:2 = fork [2] %53 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %55 = arith.trunci %54#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %56 = arith.cmpi ult, %54#1, %37 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %57:4 = fork [4] %56 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %57#0, %55 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %57#2, %19#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %57#1, %23#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %57#3, %29#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %58 = oehb [1] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i32
    %59 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %60 = oehb [1] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %61 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %62 = constant %61 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %63 = arith.extsi %62 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %64 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %65 = constant %64 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %67 = arith.addi %59, %66 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %68:2 = fork [2] %67 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %69 = oehb [1] %68#0 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i7
    %70 = arith.trunci %69 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %71 = oehb [1] %68#1 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %72 = arith.cmpi ult, %71, %63 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %73 = oehb [1] %72 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %74:3 = fork [3] %73 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %74#0, %70 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %74#1, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %74#2, %60 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %75 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %75, %done : none, none
  }
}

