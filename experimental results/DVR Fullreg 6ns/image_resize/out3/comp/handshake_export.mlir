module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%27, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %10 = oehb [1] %9 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %11 = tehb [1] %10 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %13 = arith.extsi %12#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %14 = arith.extsi %12#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %15 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %16 = mux %24#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %17 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %18 = tehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i32
    %19:2 = fork [2] %18 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %20 = mux %24#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %22 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %23 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %24:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %25:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %26 = constant %25#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %27 = arith.extsi %26 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %28 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %29 = constant %28 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %30:3 = fork [3] %29 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %31 = arith.extsi %30#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %32 = arith.extsi %30#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %33 = oehb [1] %30#2 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i6
    %34 = tehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %36 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %37 = constant %36 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %38 = arith.extsi %37 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %39 = arith.muli %23, %32 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %41 = oehb [4003] %14 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %42 = arith.addi %41, %40 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%43] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %44 = oehb [4004] %19#1 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %45 = arith.subi %44, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %46 = arith.muli %22, %31 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %47 = arith.extsi %46 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %48 = oehb [4003] %13 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %49 = arith.addi %48, %47 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %51 = oehb [1] %50 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %52 = tehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%52] %45 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %53 = arith.addi %15, %38 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %54:2 = fork [2] %53 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %55 = arith.trunci %54#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %56 = arith.cmpi ult, %54#1, %35 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %57:4 = fork [4] %56 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %57#0, %55 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %57#2, %19#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %58 = oehb [1] %21#0 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %59 = tehb [1] %58 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %trueResult_6, %falseResult_7 = cond_br %57#1, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %60 = oehb [1] %25#0 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %61 = tehb [1] %60 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : none
    %trueResult_8, %falseResult_9 = cond_br %57#3, %61 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %62 = tehb [3001] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i32
    %63 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %64 = tehb [3001] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %65 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %66 = constant %65 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %67 = arith.extsi %66 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %68 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %69 = constant %68 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %70 = arith.extsi %69 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %71 = arith.addi %63, %70 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %72 = tehb [3001] %71 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %73:2 = fork [2] %72 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %74 = arith.trunci %73#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %75 = arith.cmpi ult, %73#1, %67 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %76:3 = fork [3] %75 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %76#0, %74 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %76#1, %62 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %76#2, %64 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %77 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %77, %done : none, none
  }
}

