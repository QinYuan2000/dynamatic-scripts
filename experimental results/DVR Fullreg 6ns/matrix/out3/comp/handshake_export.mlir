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
    %4:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %5 = constant %4#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %6 = arith.extsi %5 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %7 = mux %9#1 [%trueResult_19, %6] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %8 = mux %9#0 [%trueResult_21, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %4#1 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %9:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %10 = tehb [3001] %result_3 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : none
    %11:2 = fork [2] %10 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %12 = constant %11#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %13:2 = fork [2] %12 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %14 = arith.extsi %13#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %15 = tehb [3001] %13#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i1
    %16 = arith.extsi %15 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %17 = tehb [3001] %8 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %18 = tehb [3001] %7 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %19 = mux %35#2 [%trueResult, %14] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %20:3 = fork [3] %19 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %21 = oehb [4004] %20#0 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %22 = arith.extsi %21 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %23 = arith.extsi %20#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %24 = arith.extsi %20#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %25 = oehb [4008] %35#3 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i1
    %26 = mux %25 [%trueResult_9, %16] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %27 = mux %35#0 [%trueResult_11, %17] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %28:2 = fork [2] %27 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %29 = arith.extsi %28#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %30 = mux %35#1 [%trueResult_13, %18] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %31 = oehb [1] %30 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %32 = tehb [1] %31 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i6
    %33:2 = fork [2] %32 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %34 = arith.extsi %33#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %11#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %35:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %36 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %37 = constant %36 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %38:3 = fork [3] %37 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %39 = arith.extsi %38#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %40 = arith.extsi %38#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %41 = arith.extsi %38#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %42 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %43 = constant %42 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %44 = arith.extsi %43 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %45 = arith.muli %29, %39 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %46 = arith.extsi %45 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %47 = arith.addi %22, %46 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %48 = arith.extsi %47 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%48] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %49 = arith.muli %24, %41 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %50 = arith.extsi %49 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %51 = oehb [4003] %34 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i13
    %52 = arith.addi %51, %50 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%53] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %54 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %55 = oehb [1] %26 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %56 = tehb [1] %55 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i32
    %57 = arith.addi %56, %54 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %58 = arith.addi %23, %44 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %59:2 = fork [2] %58 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %60 = oehb [1] %59#0 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %61 = tehb [1] %60 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %62 = arith.trunci %61 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = arith.cmpi ult, %59#1, %40 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %64 = oehb [1] %63 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %65 = tehb [1] %64 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %66:5 = fork [5] %65 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %66#0, %62 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %67 = oehb [4008] %66#3 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %67, %57 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %68 = oehb [1] %28#0 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %69 = tehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_11, %falseResult_12 = cond_br %66#1, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %66#2, %33#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %70 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %71 = tehb [1] %70 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_15, %falseResult_16 = cond_br %66#4, %71 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %72:2 = fork [2] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %73 = arith.extsi %72#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %74:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %75 = tehb [3001] %74#0 {bb = 4 : ui32, name = #handshake.name<"tehb10">} : i6
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
    %95 = arith.trunci %94#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %96 = arith.cmpi ult, %94#1, %85 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %97:3 = fork [3] %96 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %97#0, %95 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %97#1, %72#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %97#2, %78#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %98 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %99 = tehb [3001] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"tehb11">} : none
    %100 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %101 = constant %100 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %102 = arith.extsi %101 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %103 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %104 = constant %103 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %105 = arith.extsi %104 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %106 = arith.addi %98, %105 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %107 = tehb [3001] %106 {bb = 5 : ui32, name = #handshake.name<"tehb12">} : i7
    %108:2 = fork [2] %107 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %109 = arith.trunci %108#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %110 = arith.cmpi ult, %108#1, %102 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %111:2 = fork [2] %110 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %111#0, %109 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %111#1, %99 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %112 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %112, %done, %done_0, %done_2 : none, none, none, none
  }
}

