module {
  handshake.func @image_resize(%arg0: memref<900xi32>, %arg1: i32, %arg2: none, ...) -> none attributes {argNames = ["a", "c", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg0 : memref<900xi32>] (%32, %addressResult, %addressResult_2, %dataResult_3) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
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
    %9 = mux %27#1 [%trueResult, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %10 = oehb [1] %9 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %11 = tehb [1] %10 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %13 = arith.extsi %12#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %14 = tehb [2004] %12#1 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %15 = arith.extsi %14 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %16 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %17 = mux %27#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %18 = oehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %19 = tehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %20:2 = fork [2] %19 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %21 = mux %27#0 [%trueResult_6, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %22 = oehb [1] %21 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %23 = tehb [1] %22 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %24:3 = fork [3] %23 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %25 = arith.extsi %24#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %26 = arith.extsi %24#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %result_0, %index_1 = control_merge %trueResult_8, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %27:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %28 = oehb [1] %result_0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %29 = tehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %30:2 = fork [2] %29 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
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
    %42 = arith.muli %26, %37 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %43 = arith.extsi %42 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %44 = arith.addi %15, %43 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %45 = arith.extsi %44 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%45] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %46 = tehb [2005] %20#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %47 = arith.subi %46, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %48 = arith.muli %25, %36 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %50 = tehb [2004] %13 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %51 = arith.addi %50, %49 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %52 = oehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %53 = arith.extsi %52 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %addressResult_2, %dataResult_3 = mc_store[%53] %47 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %54 = arith.addi %16, %41 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %55:2 = fork [2] %54 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %56 = arith.trunci %55#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %57 = arith.cmpi ult, %55#1, %38 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %58:4 = fork [4] %57 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %58#0, %56 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_4, %falseResult_5 = cond_br %58#2, %20#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_6, %falseResult_7 = cond_br %58#1, %24#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %58#3, %30#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %59 = oehb [1] %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i32
    %60 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %61 = oehb [1] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : none
    %62 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %63 = constant %62 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %65 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %66 = constant %65 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %67 = arith.extsi %66 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %68 = arith.addi %60, %67 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %69 = oehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %70:2 = fork [2] %69 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %71 = arith.trunci %70#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %72 = arith.cmpi ult, %70#1, %64 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %73:3 = fork [3] %72 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %73#0, %71 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %73#1, %59 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %73#2, %61 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %74 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %74, %done : none, none
  }
}

