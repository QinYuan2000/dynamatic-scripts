module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%30, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %9 = tehb [3001] %trueResult {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i6
    %10 = mux %27#1 [%9, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %11 = tehb [3001] %10 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %13 = oehb [4002] %12#0 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %14 = arith.extsi %13 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %15 = oehb [1] %12#1 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %16 = tehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %18 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %19 = mux %27#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %20 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %21 = tehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %22:2 = fork [2] %21 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %23 = mux %27#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %24:3 = fork [3] %23 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %25 = arith.extsi %24#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %26 = arith.extsi %24#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %27:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %28:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %29 = constant %28#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %33:3 = fork [3] %32 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %34 = arith.extsi %33#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %35 = arith.extsi %33#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %36 = arith.extsi %33#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %37 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %38 = constant %37 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %40 = arith.muli %26, %35 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %41 = arith.extsi %40 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %42 = arith.addi %17, %41 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%43] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %44 = oehb [1] %22#1 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %45 = tehb [1] %44 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %46 = arith.subi %45, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %47 = arith.muli %25, %34 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %48 = arith.extsi %47 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %49 = arith.addi %14, %48 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%50] %46 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %51 = arith.addi %18, %39 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %52:2 = fork [2] %51 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %53 = arith.trunci %52#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %54 = tehb [3001] %36 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i7
    %55 = arith.cmpi ult, %52#1, %54 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %56:4 = fork [4] %55 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %56#0, %53 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %57 = tehb [3001] %56#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %trueResult_4, %falseResult_5 = cond_br %57, %22#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %58 = oehb [1] %24#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i6
    %59 = tehb [1] %58 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %60 = tehb [3001] %56#1 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_6, %falseResult_7 = cond_br %60, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %61 = oehb [1] %28#0 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : none
    %62 = tehb [1] %61 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : none
    %63 = tehb [3001] %56#3 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_8, %falseResult_9 = cond_br %63, %62 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %64 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %65 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %66 = constant %65 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %67 = arith.extsi %66 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %68 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %69 = constant %68 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %70 = arith.extsi %69 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %71 = arith.addi %64, %70 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %72:2 = fork [2] %71 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %73 = arith.trunci %72#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %74 = arith.cmpi ult, %72#1, %67 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %75 = tehb [3001] %74 {bb = 3 : ui32, name = #handshake.name<"tehb12">} : i1
    %76:3 = fork [3] %75 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %77 = tehb [3001] %73 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i6
    %trueResult_10, %falseResult_11 = cond_br %76#0, %77 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %76#1, %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %76#2, %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %78 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %78, %done : none, none
  }
}

