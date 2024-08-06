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
    %10 = mux %26#1 [%9, %8] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i6
    %11 = tehb [3001] %10 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %12:3 = fork [3] %11 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %13 = arith.extsi %12#0 {bb = 2 : ui32, name = #handshake.name<"extsi9">} : i6 to i13
    %14 = arith.extsi %12#1 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %15 = arith.extsi %12#2 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i7
    %16 = mux %26#2 [%trueResult_4, %4] {bb = 2 : ui32, name = #handshake.name<"mux3">} : i1, i32
    %17 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %18 = tehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %19:2 = fork [2] %18 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %20 = tehb [3001] %trueResult_6 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i6
    %21 = mux %26#0 [%20, %3] {bb = 2 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %22:3 = fork [3] %21 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i6
    %23 = arith.extsi %22#1 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i12
    %24 = arith.extsi %22#2 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i12
    %25 = tehb [3001] %trueResult_8 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : none
    %result_0, %index_1 = control_merge %25, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %26:3 = fork [3] %index_1 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i1
    %27 = tehb [3001] %result_0 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork7">} : none
    %29 = constant %28#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant8">, value = 30 : i6} : i6
    %33:3 = fork [3] %32 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i6
    %34 = arith.extsi %33#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i12
    %35 = arith.extsi %33#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i12
    %36 = tehb [3001] %33#2 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i6
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %38 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %39 = constant %38 {bb = 2 : ui32, name = #handshake.name<"constant9">, value = 1 : i2} : i2
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i2 to i7
    %41 = arith.muli %24, %35 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i12
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i12 to i13
    %43 = oehb [1] %14 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %44 = tehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i13
    %45 = arith.addi %44, %42 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i13
    %46 = arith.extsi %45 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i13 to i32
    %addressResult, %dataResult = mc_load[%46] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %47 = oehb [1] %19#1 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %48 = tehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %49 = arith.subi %48, %dataResult {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %50 = arith.muli %23, %34 {bb = 2 : ui32, name = #handshake.name<"muli3">} : i12
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i12 to i13
    %52 = oehb [1] %13 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i13
    %53 = tehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i13
    %54 = arith.addi %53, %51 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i13
    %55 = arith.extsi %54 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i13 to i32
    %56 = tehb [3001] %55 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %addressResult_2, %dataResult_3 = mc_store[%56] %49 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %57 = arith.addi %15, %40 {bb = 2 : ui32, name = #handshake.name<"addi6">} : i7
    %58:2 = fork [2] %57 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i7
    %59 = arith.trunci %58#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %60 = arith.cmpi ult, %58#1, %37 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %61:4 = fork [4] %60 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i1
    %trueResult, %falseResult = cond_br %61#0, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %62 = tehb [3001] %61#2 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_4, %falseResult_5 = cond_br %62, %19#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %63 = tehb [3001] %22#0 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_6, %falseResult_7 = cond_br %61#1, %63 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_8, %falseResult_9 = cond_br %61#3, %28#0 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %64 = arith.extsi %falseResult_7 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i6 to i7
    %65 = tehb [3001] %falseResult_9 {bb = 3 : ui32, name = #handshake.name<"tehb13">} : none
    %66 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %67 = constant %66 {bb = 3 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %68 = arith.extsi %67 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i6 to i7
    %69 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %70 = constant %69 {bb = 3 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %71 = arith.extsi %70 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i2 to i7
    %72 = tehb [3001] %64 {bb = 3 : ui32, name = #handshake.name<"tehb14">} : i7
    %73 = arith.addi %72, %71 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i7
    %74:2 = fork [2] %73 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i7
    %75 = tehb [3001] %74#0 {bb = 3 : ui32, name = #handshake.name<"tehb15">} : i7
    %76 = arith.trunci %75 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %77 = arith.cmpi ult, %74#1, %68 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %78 = tehb [3001] %77 {bb = 3 : ui32, name = #handshake.name<"tehb16">} : i1
    %79:3 = fork [3] %78 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i1
    %trueResult_10, %falseResult_11 = cond_br %79#0, %76 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i6
    sink %falseResult_11 {name = #handshake.name<"sink1">} : i6
    %trueResult_12, %falseResult_13 = cond_br %79#1, %falseResult_5 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : i32
    sink %falseResult_13 {name = #handshake.name<"sink2">} : i32
    %trueResult_14, %falseResult_15 = cond_br %79#2, %65 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : none
    %80 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_15 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %80, %done : none, none
  }
}

