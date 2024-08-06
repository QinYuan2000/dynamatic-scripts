module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%80, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg3 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %3 = mux %index [%trueResult_25, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %result, %index = control_merge %trueResult_27, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %4 = tehb [3001] %result {bb = 1 : ui32, name = #handshake.name<"tehb1">} : none
    %5:2 = fork [2] %4 {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %6 = constant %5#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %7 = arith.extsi %6 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %8 = tehb [3001] %3 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i6
    %9 = mux %11#1 [%trueResult_19, %7] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %10 = mux %11#0 [%trueResult_21, %8] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %5#1 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %11:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %12:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %13 = constant %12#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %14:2 = fork [2] %13 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %15 = arith.extsi %14#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %16 = tehb [3001] %14#1 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i1
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %18 = mux %33#2 [%trueResult, %15] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %19:3 = fork [3] %18 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %20 = arith.extsi %19#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %21 = arith.extsi %19#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %22 = arith.extsi %19#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %23 = oehb [4003] %33#3 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i1
    %24 = mux %23 [%trueResult_9, %17] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %25 = mux %33#0 [%trueResult_11, %10] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %26:2 = fork [2] %25 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %27 = arith.extsi %26#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %28 = mux %33#1 [%trueResult_13, %9] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %29 = oehb [1] %28 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %30 = tehb [1] %29 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i6
    %31:2 = fork [2] %30 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %32 = arith.extsi %31#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %12#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %33:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %34 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %35 = constant %34 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %36:3 = fork [3] %35 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %37 = arith.extsi %36#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %38 = arith.extsi %36#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %39 = arith.extsi %36#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %40 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %41 = constant %40 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %42 = arith.extsi %41 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %43 = arith.muli %27, %37 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %44 = arith.extsi %43 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %45 = oehb [4002] %20 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i13
    %46 = arith.addi %45, %44 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %47 = arith.extsi %46 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%47] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %48 = arith.muli %22, %39 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %50 = oehb [1] %32 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i13
    %51 = tehb [1] %50 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i13
    %52 = arith.addi %51, %49 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%53] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %54 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %55 = oehb [1] %24 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %56 = tehb [1] %55 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i32
    %57 = arith.addi %56, %54 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %58 = tehb [3001] %21 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i7
    %59 = arith.addi %58, %42 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %60:2 = fork [2] %59 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %61 = tehb [3001] %60#0 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i7
    %62 = arith.trunci %61 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = tehb [3001] %38 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i7
    %64 = arith.cmpi ult, %60#1, %63 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %65 = tehb [3001] %64 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i1
    %66:5 = fork [5] %65 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %66#0, %62 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %67 = oehb [4003] %66#3 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i1
    %trueResult_9, %falseResult_10 = cond_br %67, %57 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %68 = oehb [1] %26#0 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %69 = tehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_11, %falseResult_12 = cond_br %66#1, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %66#2, %31#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %70 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %71 = tehb [1] %70 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : none
    %trueResult_15, %falseResult_16 = cond_br %66#4, %71 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %72:2 = fork [2] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %73 = arith.extsi %72#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %74:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %75 = tehb [3001] %74#0 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i6
    %76 = arith.extsi %75 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %77 = arith.extsi %74#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %78:2 = fork [2] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %79 = constant %78#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %80 = arith.extsi %79 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %81 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %82 = constant %81 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %83:2 = fork [2] %82 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %84 = arith.extsi %83#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %85 = arith.extsi %83#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %86 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %87 = constant %86 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %88 = arith.extsi %87 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %89 = arith.muli %73, %84 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %90 = arith.extsi %89 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %91 = arith.addi %76, %90 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %92 = arith.extsi %91 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%92] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %93 = arith.addi %77, %88 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %94:2 = fork [2] %93 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %95 = tehb [3001] %94#0 {bb = 4 : ui32, name = #handshake.name<"tehb15">} : i7
    %96 = arith.trunci %95 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %97 = arith.cmpi ult, %94#1, %85 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %98 = tehb [3001] %97 {bb = 4 : ui32, name = #handshake.name<"tehb16">} : i1
    %99:3 = fork [3] %98 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %99#0, %96 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %100 = tehb [3001] %72#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %trueResult_21, %falseResult_22 = cond_br %99#1, %100 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %101 = tehb [3001] %78#0 {bb = 4 : ui32, name = #handshake.name<"tehb14">} : none
    %trueResult_23, %falseResult_24 = cond_br %99#2, %101 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %102 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %103 = tehb [3001] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"tehb17">} : none
    %104 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %105 = constant %104 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %106 = arith.extsi %105 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %107 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %108 = constant %107 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %109 = arith.extsi %108 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %110 = arith.addi %102, %109 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %111 = tehb [3001] %110 {bb = 5 : ui32, name = #handshake.name<"tehb18">} : i7
    %112:2 = fork [2] %111 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %113 = arith.trunci %112#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %114 = arith.cmpi ult, %112#1, %106 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %115:2 = fork [2] %114 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %115#0, %113 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %115#1, %103 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %116 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %116, %done, %done_0, %done_2 : none, none, none, none
  }
}

