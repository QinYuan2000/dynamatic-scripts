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
    %19 = mux %35#1 [%18, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %20 = tehb [3001] %19 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %21:3 = fork [3] %20 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %22 = arith.extsi %21#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %23 = arith.extsi %21#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %24 = arith.extsi %21#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %25 = mux %35#2 [%trueResult_4, %15] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %26 = oehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %27 = tehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %29 = tehb [3001] %trueResult_6 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i6
    %30 = mux %35#0 [%29, %16] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %31:3 = fork [3] %30 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %32 = arith.extsi %31#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %33 = arith.extsi %31#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %34 = tehb [3001] %trueResult_8 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : none
    %result_0, %index_1 = control_merge %34, %17 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %35:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %36 = tehb [3001] %result_0 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %37:2 = fork [2] %36 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %38 = constant %37#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %40 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %41 = constant %40 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %42:3 = fork [3] %41 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %43 = arith.extsi %42#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %44 = arith.extsi %42#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %45 = tehb [3001] %42#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i6
    %46 = arith.extsi %45 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %47 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %48 = constant %47 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %50 = arith.muli %33, %44 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %52 = oehb [1] %23 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %53 = tehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %54 = arith.addi %53, %51 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %55 = arith.extsi %54 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%55] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %56 = oehb [1] %28#1 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %57 = tehb [1] %56 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %58 = arith.subi %57, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %59 = arith.muli %32, %43 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %60 = arith.extsi %59 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %61 = oehb [1] %22 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i13
    %62 = tehb [1] %61 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %63 = arith.addi %62, %60 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %64 = arith.extsi %63 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %65 = tehb [3001] %64 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%65] %58 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %66 = arith.addi %24, %49 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %67:2 = fork [2] %66 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %68 = arith.trunci %67#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %69 = arith.cmpi ult, %67#1, %46 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %70:4 = fork [4] %69 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %70#0, %68 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %71 = tehb [3001] %70#2 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_4, %falseResult_5 = cond_br %71, %28#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %72 = tehb [3001] %31#0 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_6, %falseResult_7 = cond_br %70#1, %72 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %70#3, %37#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %73 = merge %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %74 = merge %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i6
    %75 = arith.extsi %74 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %76 = tehb [3001] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"tehb13">} : none
    %77 = merge %76 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %78 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %79 = constant %78 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %80 = arith.extsi %79 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %81 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %82 = constant %81 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %83 = arith.extsi %82 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %84 = tehb [3001] %75 {bb = 3 : ui32, name = #handshake.name<"tehb14">} : i7
    %85 = arith.addi %84, %83 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %86:2 = fork [2] %85 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %87 = tehb [3001] %86#0 {bb = 3 : ui32, name = #handshake.name<"tehb15">} : i7
    %88 = arith.trunci %87 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %89 = arith.cmpi ult, %86#1, %80 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %90 = tehb [3001] %89 {bb = 3 : ui32, name = #handshake.name<"tehb16">} : i1
    %91:3 = fork [3] %90 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %91#0, %88 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %91#1, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %91#2, %77 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %92 = merge %falseResult_15 {bb = 4 : ui32, name = #handshake.name<"merge6">} : none
    %93 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %92 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %93, %done : none, none
  }
}

