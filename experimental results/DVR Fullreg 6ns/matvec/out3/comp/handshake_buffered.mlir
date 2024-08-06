module {
  handshake.func @matvec(%arg0: memref<10000xi32>, %arg1: memref<100xi32>, %arg2: memref<100xi32>, %arg3: none, ...) -> i32 attributes {argNames = ["m", "v", "out", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<100xi32>] (%70, %addressResult_13, %dataResult_14) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<100xi32>] (%addressResult) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<10000xi32>] (%addressResult_5) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %3 = br %2 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi7">} : i1 to i8
    %5 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br3">} : none
    %6 = mux %index [%trueResult_15, %4] {bb = 1 : ui32, name = #handshake.name<"mux4">} : i1, i8
    %result, %index = control_merge %trueResult_17, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %7:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %8 = constant %7#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %9:2 = fork [2] %8 {bb = 1 : ui32, name = #handshake.name<"fork2">} : i1
    %10 = br %9#0 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi8">} : i1 to i8
    %12 = br %9#1 {bb = 1 : ui32, name = #handshake.name<"br8">} : i1
    %13 = arith.extsi %12 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i32
    %14 = br %6 {bb = 1 : ui32, name = #handshake.name<"br9">} : i8
    %15 = br %7#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %16 = mux %30#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i8
    %17 = oehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i8
    %18 = tehb [1] %17 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i8
    %19:3 = fork [3] %18 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i8
    %20 = oehb [4003] %19#0 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i8
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i8 to i17
    %22 = arith.extsi %19#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i8 to i9
    %23 = arith.extsi %19#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i8 to i32
    %24 = tehb [3001] %13 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i32
    %25 = oehb [4008] %30#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %26 = mux %25 [%trueResult_7, %24] {bb = 2 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %27 = mux %30#0 [%trueResult_9, %14] {bb = 2 : ui32, name = #handshake.name<"mux6">} : i1, i8
    %28:2 = fork [2] %27 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i8
    %29 = arith.extsi %28#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i8 to i16
    %result_3, %index_4 = control_merge %trueResult_11, %15 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %30:3 = fork [3] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i1
    %31 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %32 = constant %31 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 100 : i8} : i8
    %33:2 = fork [2] %32 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i8
    %34 = arith.extsi %33#0 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i8 to i16
    %35 = arith.extsi %33#1 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i8 to i9
    %36 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %37 = constant %36 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %38 = arith.extsi %37 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i2 to i9
    %addressResult, %dataResult = mc_load[%23] %memOutputs {bb = 2 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %39 = arith.muli %29, %34 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i16
    %40 = arith.extsi %39 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i16 to i17
    %41 = arith.addi %21, %40 {bb = 2 : ui32, name = #handshake.name<"addi4">} : i17
    %42 = arith.extsi %41 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i17 to i32
    %addressResult_5, %dataResult_6 = mc_load[%42] %memOutputs_1 {bb = 2 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %43 = oehb [4003] %dataResult {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %44 = arith.muli %43, %dataResult_6 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %45 = oehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %46 = tehb [1] %45 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i32
    %47 = arith.addi %46, %44 {bb = 2 : ui32, name = #handshake.name<"addi0">} : i32
    %48 = arith.addi %22, %38 {bb = 2 : ui32, name = #handshake.name<"addi5">} : i9
    %49:2 = fork [2] %48 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i9
    %50 = arith.trunci %49#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i9 to i8
    %51 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i9
    %52 = tehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i9
    %53 = arith.cmpi ult, %49#1, %52 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i9
    %54:4 = fork [4] %53 {bb = 2 : ui32, name = #handshake.name<"fork8">} : i1
    %trueResult, %falseResult = cond_br %54#0, %50 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i8
    sink %falseResult {name = #handshake.name<"sink0">} : i8
    %55 = oehb [4008] %54#2 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i1
    %trueResult_7, %falseResult_8 = cond_br %55, %47 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %56 = oehb [1] %28#0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i8
    %57 = tehb [1] %56 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i8
    %trueResult_9, %falseResult_10 = cond_br %54#1, %57 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i8
    %58 = oehb [1] %result_3 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %59 = tehb [1] %58 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : none
    %trueResult_11, %falseResult_12 = cond_br %54#3, %59 {bb = 2 : ui32, name = #handshake.name<"cond_br5">} : none
    %60 = merge %falseResult_10 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i8
    %61:2 = fork [2] %60 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i8
    %62 = arith.extsi %61#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i8 to i9
    %63 = tehb [3001] %61#1 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i8
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i8 to i32
    %65 = merge %falseResult_8 {bb = 3 : ui32, name = #handshake.name<"merge2">} : i32
    %66:2 = fork [2] %65 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i32
    %67 = merge %falseResult_12 {bb = 3 : ui32, name = #handshake.name<"merge5">} : none
    %68:2 = fork [2] %67 {bb = 3 : ui32, name = #handshake.name<"fork11">} : none
    %69 = constant %68#1 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 1 : i2} : i2
    %70 = arith.extsi %69 {bb = 3 : ui32, name = #handshake.name<"extsi4">} : i2 to i32
    %71 = source {bb = 3 : ui32, name = #handshake.name<"source2">}
    %72 = constant %71 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 100 : i8} : i8
    %73 = arith.extsi %72 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i8 to i9
    %74 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %75 = constant %74 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 1 : i2} : i2
    %76 = arith.extsi %75 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i9
    %addressResult_13, %dataResult_14 = mc_store[%64] %66#1 {bb = 3 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %77 = arith.addi %62, %76 {bb = 3 : ui32, name = #handshake.name<"addi6">} : i9
    %78 = tehb [3001] %77 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i9
    %79:2 = fork [2] %78 {bb = 3 : ui32, name = #handshake.name<"fork12">} : i9
    %80 = arith.trunci %79#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i9 to i8
    %81 = arith.cmpi ult, %79#1, %73 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i9
    %82:3 = fork [3] %81 {bb = 3 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult_15, %falseResult_16 = cond_br %82#0, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i8
    sink %falseResult_16 {name = #handshake.name<"sink1">} : i8
    %83 = tehb [3001] %68#0 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_17, %falseResult_18 = cond_br %82#1, %83 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    sink %falseResult_18 {name = #handshake.name<"sink2">} : none
    %trueResult_19, %falseResult_20 = cond_br %82#2, %66#0 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %trueResult_19 {name = #handshake.name<"sink3">} : i32
    %84 = merge %falseResult_20 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %85 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %84 : i32
    end {bb = 4 : ui32, name = #handshake.name<"end0">} %85, %done, %done_0, %done_2 : i32, none, none, none
  }
}

