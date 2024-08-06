module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%37, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = mux %34#1 [%trueResult, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %19 = tehb [4001] %18 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %20:3 = fork [3] %19 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %21 = arith.extsi %20#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %22 = arith.extsi %20#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %23 = arith.extsi %20#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %24 = mux %34#2 [%trueResult_4, %15] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %25 = oehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %26 = tehb [4001] %25 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %27:2 = fork [2] %26 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %28 = mux %34#0 [%trueResult_6, %16] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %29 = oehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %30 = tehb [4001] %29 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %31:3 = fork [3] %30 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %32 = arith.extsi %31#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %33 = arith.extsi %31#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %34:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %35:2 = fork [2] %result_0 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %36 = constant %35#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %38 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %39 = constant %38 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %40:3 = fork [3] %39 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %41 = arith.extsi %40#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %42 = arith.extsi %40#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %43 = arith.extsi %40#2 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %44 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %45 = constant %44 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %46 = arith.extsi %45 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %47 = arith.muli %33, %42 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %48 = arith.extsi %47 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %49 = tehb [2005] %22 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %50 = arith.addi %49, %48 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%51] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %52 = tehb [2005] %27#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %53 = arith.subi %52, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %54 = arith.muli %32, %41 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %55 = arith.extsi %54 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %56 = tehb [2005] %21 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %57 = arith.addi %56, %55 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %58 = arith.extsi %57 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%58] %53 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %59 = arith.addi %23, %46 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %60 = oehb [1] %59 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i7
    %61:2 = fork [2] %60 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %62 = arith.trunci %61#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = arith.cmpi ult, %61#1, %43 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %64:4 = fork [4] %63 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %64#0, %62 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %64#2, %27#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %64#1, %31#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %65 = oehb [1] %35#0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : none
    %66 = tehb [4001] %65 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_8, %falseResult_9 = cond_br %64#3, %66 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %67 = oehb [1] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i32
    %68 = merge %67 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %69 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %70 = arith.extsi %69 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %71 = oehb [1] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %72 = merge %71 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %73 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %74 = constant %73 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %76 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %77 = constant %76 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %78 = arith.extsi %77 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %79 = arith.addi %70, %78 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %80 = oehb [1] %79 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i7
    %81:2 = fork [2] %80 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %82 = arith.trunci %81#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %83 = arith.cmpi ult, %81#1, %75 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %84 = oehb [1] %83 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %85:3 = fork [3] %84 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %86 = oehb [1] %82 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i6
    %trueResult_10, %falseResult_11 = cond_br %85#0, %86 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %85#1, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %85#2, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %87 = merge %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %88 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %87 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %88, %done : none, none
  }
}

