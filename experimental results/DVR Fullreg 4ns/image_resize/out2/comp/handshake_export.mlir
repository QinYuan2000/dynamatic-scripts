module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%28, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %9 = mux %25#1 [%trueResult, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %10 = tehb [4001] %9 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %11:3 = fork [3] %10 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %12 = arith.extsi %11#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %13 = arith.extsi %11#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %14 = arith.extsi %11#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %15 = mux %25#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %16 = oehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %17 = tehb [4001] %16 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %18:2 = fork [2] %17 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %19 = mux %25#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %20 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %21 = tehb [4001] %20 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %22:3 = fork [3] %21 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %23 = arith.extsi %22#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %24 = arith.extsi %22#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %25:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %26:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %27 = constant %26#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %28 = arith.extsi %27 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %29 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %30 = constant %29 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %31:3 = fork [3] %30 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %32 = arith.extsi %31#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %33 = arith.extsi %31#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %34 = arith.extsi %31#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %35 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %36 = constant %35 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %38 = arith.muli %24, %33 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %40 = tehb [2005] %13 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %41 = arith.addi %40, %39 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%42] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %43 = tehb [2005] %18#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %44 = arith.subi %43, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %45 = arith.muli %23, %32 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %46 = arith.extsi %45 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %47 = tehb [2005] %12 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %48 = arith.addi %47, %46 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%49] %44 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %50 = arith.addi %14, %37 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %51 = oehb [1] %50 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i7
    %52:2 = fork [2] %51 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %53 = arith.trunci %52#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %54 = arith.cmpi ult, %52#1, %34 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %55:4 = fork [4] %54 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %55#0, %53 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %55#2, %18#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %55#1, %22#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %56 = oehb [1] %26#0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %57 = tehb [4001] %56 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_8, %falseResult_9 = cond_br %55#3, %57 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
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
    %68 = oehb [1] %67 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i7
    %69:2 = fork [2] %68 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %70 = arith.trunci %69#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %71 = arith.cmpi ult, %69#1, %63 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %72 = oehb [1] %71 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %73:3 = fork [3] %72 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %74 = oehb [1] %70 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i6
    %trueResult_10, %falseResult_11 = cond_br %73#0, %74 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %73#1, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %73#2, %60 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %75 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %75, %done : none, none
  }
}

