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
    %16 = arith.extsi %14#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %17 = mux %37#2 [%trueResult, %15] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %18:3 = fork [3] %17 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %19 = oehb [4002] %18#0 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %20 = arith.extsi %19 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %21 = tehb [3001] %18#1 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %22 = arith.extsi %21 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %23 = arith.extsi %18#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %24 = tehb [3001] %16 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %25 = oehb [4003] %37#3 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i1
    %26 = mux %25 [%trueResult_9, %24] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %27 = mux %37#0 [%trueResult_11, %10] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %28:2 = fork [2] %27 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %29 = arith.extsi %28#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %30 = mux %37#1 [%trueResult_13, %9] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %31 = oehb [1] %30 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %32 = tehb [1] %31 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i6
    %33:2 = fork [2] %32 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %34 = oehb [1] %33#1 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i6
    %35 = tehb [1] %34 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i6
    %36 = arith.extsi %35 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %12#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %37:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %38 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %39 = constant %38 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %40:3 = fork [3] %39 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %41 = arith.extsi %40#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %42 = arith.extsi %40#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %43 = arith.extsi %40#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %44 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %45 = constant %44 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %46 = arith.extsi %45 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %47 = arith.muli %29, %41 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %48 = arith.extsi %47 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %49 = arith.addi %20, %48 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %50 = arith.extsi %49 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%50] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %51 = arith.muli %23, %43 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %52 = arith.extsi %51 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %53 = arith.addi %36, %52 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%54] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %55 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %56 = oehb [1] %26 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %57 = tehb [1] %56 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i32
    %58 = arith.addi %57, %55 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %59 = arith.addi %22, %46 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %60:2 = fork [2] %59 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %61 = arith.trunci %60#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %62 = tehb [3001] %42 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i7
    %63 = arith.cmpi ult, %60#1, %62 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %64 = tehb [3001] %63 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i1
    %65:5 = fork [5] %64 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %66 = tehb [3001] %61 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i6
    %trueResult, %falseResult = cond_br %65#0, %66 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %67 = oehb [4003] %65#3 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i1
    %trueResult_9, %falseResult_10 = cond_br %67, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %68 = oehb [1] %28#0 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %69 = tehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_11, %falseResult_12 = cond_br %65#1, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %65#2, %33#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %70 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %71 = tehb [1] %70 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : none
    %trueResult_15, %falseResult_16 = cond_br %65#4, %71 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
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

