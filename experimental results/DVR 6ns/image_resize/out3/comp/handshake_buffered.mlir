module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%38, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = mux %33#1 [%trueResult, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %19 = oehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %20 = tehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %22 = arith.extsi %21#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %23 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %24 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %25 = mux %33#2 [%trueResult_4, %15] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %26 = oehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %27 = tehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i32
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %29 = mux %33#0 [%trueResult_6, %16] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %30:3 = fork [3] %29 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %31 = arith.extsi %30#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %32 = arith.extsi %30#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %33:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %34 = oehb [1] %result_0 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %35 = tehb [1] %34 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : none
    %36:2 = fork [2] %35 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %37 = constant %36#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %38 = arith.extsi %37 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %39 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %40 = constant %39 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %41:3 = fork [3] %40 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %42 = arith.extsi %41#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %43 = arith.extsi %41#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %44 = arith.extsi %41#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %45 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %46 = constant %45 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %47 = arith.extsi %46 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %48 = arith.muli %32, %43 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %50 = oehb [4003] %23 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %51 = arith.addi %50, %49 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %52 = arith.extsi %51 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%52] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %53 = oehb [4004] %28#1 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %54 = arith.subi %53, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %55 = arith.muli %31, %42 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %56 = arith.extsi %55 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %57 = oehb [4003] %22 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %58 = arith.addi %57, %56 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %59 = arith.extsi %58 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %60 = oehb [1] %59 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %61 = tehb [1] %60 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%61] %54 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %62 = arith.addi %24, %47 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %63:2 = fork [2] %62 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %64 = arith.trunci %63#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %65 = oehb [1] %44 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i7
    %66 = tehb [1] %65 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i7
    %67 = arith.cmpi ult, %63#1, %66 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %68:4 = fork [4] %67 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %68#0, %64 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %68#2, %28#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %69 = oehb [1] %30#0 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %70 = tehb [1] %69 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %trueResult_6, %falseResult_7 = cond_br %68#1, %70 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %68#3, %36#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %71 = tehb [3001] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i32
    %72 = merge %71 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %73 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %74 = arith.extsi %73 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %75 = tehb [3001] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %76 = merge %75 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %77 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %78 = constant %77 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %79 = arith.extsi %78 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %80 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %81 = constant %80 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %82 = arith.extsi %81 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %83 = arith.addi %74, %82 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %84 = tehb [3001] %83 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %85:2 = fork [2] %84 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %86 = arith.trunci %85#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %87 = arith.cmpi ult, %85#1, %79 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %88:3 = fork [3] %87 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %88#0, %86 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %88#1, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %88#2, %76 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %89 = merge %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %90 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %89 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %90, %done : none, none
  }
}

