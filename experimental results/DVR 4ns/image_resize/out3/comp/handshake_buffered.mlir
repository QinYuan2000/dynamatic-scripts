module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%39, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = tehb [3001] %trueResult {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i6
    %19 = mux %36#1 [%18, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %20 = tehb [3001] %19 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %22 = oehb [4002] %21#0 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %24 = oehb [1] %21#1 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %25 = tehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %26 = arith.extsi %25 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %27 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %28 = mux %36#2 [%trueResult_4, %15] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %29 = oehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %30 = tehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %31:2 = fork [2] %30 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %32 = mux %36#0 [%trueResult_6, %16] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %33:3 = fork [3] %32 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %34 = arith.extsi %33#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %35 = arith.extsi %33#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %36:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %37:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %38 = constant %37#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %40 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %41 = constant %40 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %42:3 = fork [3] %41 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %43 = arith.extsi %42#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %44 = arith.extsi %42#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %45 = arith.extsi %42#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %46 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %47 = constant %46 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %48 = arith.extsi %47 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %49 = arith.muli %35, %44 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %51 = arith.addi %26, %50 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %52 = arith.extsi %51 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%52] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %53 = oehb [1] %31#1 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %54 = tehb [1] %53 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %55 = arith.subi %54, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %56 = arith.muli %34, %43 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %57 = arith.extsi %56 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %58 = arith.addi %23, %57 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %59 = arith.extsi %58 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%59] %55 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %60 = arith.addi %27, %48 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %61:2 = fork [2] %60 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %62 = arith.trunci %61#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = tehb [3001] %45 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i7
    %64 = arith.cmpi ult, %61#1, %63 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %65:4 = fork [4] %64 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %65#0, %62 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %66 = tehb [3001] %65#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i1
    %trueResult_4, %falseResult_5 = cond_br %66, %31#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %67 = oehb [1] %33#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i6
    %68 = tehb [1] %67 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %69 = tehb [3001] %65#1 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_6, %falseResult_7 = cond_br %69, %68 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %70 = oehb [1] %37#0 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : none
    %71 = tehb [1] %70 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : none
    %72 = tehb [3001] %65#3 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_8, %falseResult_9 = cond_br %72, %71 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %73 = merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %74 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %76 = merge %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %77 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %78 = constant %77 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %79 = arith.extsi %78 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %80 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %81 = constant %80 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %82 = arith.extsi %81 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %83 = arith.addi %75, %82 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %84:2 = fork [2] %83 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %85 = arith.trunci %84#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %86 = arith.cmpi ult, %84#1, %79 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %87 = tehb [3001] %86 {bb = 3 : ui32, name = #handshake.name<"tehb12">} : i1
    %88:3 = fork [3] %87 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %89 = tehb [3001] %85 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i6
    %trueResult_10, %falseResult_11 = cond_br %88#0, %89 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %88#1, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %88#2, %76 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %90 = merge %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %91 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %90 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %91, %done : none, none
  }
}

