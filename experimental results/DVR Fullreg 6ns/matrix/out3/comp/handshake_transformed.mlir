module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%74, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %3 = br %2 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %5 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %6 = mux %index [%trueResult_25, %4] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %result, %index = control_merge %trueResult_27, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %7:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %8 = constant %7#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %9 = br %8 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %10 = arith.extsi %9 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %11 = br %6 {bb = 1 : ui32, name = #handshake.name<"br2">} : i6
    %12 = br %7#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %13 = mux %15#1 [%trueResult_19, %10] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %14 = mux %15#0 [%trueResult_21, %11] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %12 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %15:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %16:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %17 = constant %16#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %18:2 = fork [2] %17 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %19 = br %18#0 {bb = 2 : ui32, name = #handshake.name<"br13">} : i1
    %20 = arith.extsi %19 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %21 = br %18#1 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %23 = br %14 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %24 = br %13 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %25 = br %16#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %26 = mux %38#2 [%trueResult, %20] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %27:3 = fork [3] %26 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %28 = arith.extsi %27#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %29 = arith.extsi %27#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %30 = arith.extsi %27#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %31 = mux %38#3 [%trueResult_9, %22] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %32 = mux %38#0 [%trueResult_11, %23] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %33:2 = fork [2] %32 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %34 = arith.extsi %33#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %35 = mux %38#1 [%trueResult_13, %24] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %36:2 = fork [2] %35 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %37 = arith.extsi %36#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %25 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %38:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %39 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %40 = constant %39 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %41:3 = fork [3] %40 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %42 = arith.extsi %41#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %43 = arith.extsi %41#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %44 = arith.extsi %41#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %45 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %46 = constant %45 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %47 = arith.extsi %46 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %48 = arith.muli %34, %42 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %50 = arith.addi %28, %49 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %51 = arith.extsi %50 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%51] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %52 = arith.muli %30, %44 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %54 = arith.addi %37, %53 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %55 = arith.extsi %54 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%55] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %56 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %57 = arith.addi %31, %56 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %58 = arith.addi %29, %47 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %59:2 = fork [2] %58 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %60 = arith.trunci %59#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %61 = arith.cmpi ult, %59#1, %43 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %62:5 = fork [5] %61 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %62#0, %60 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_9, %falseResult_10 = cond_br %62#3, %57 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %62#1, %33#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %62#2, %36#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %trueResult_15, %falseResult_16 = cond_br %62#4, %result_5 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %63 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %64:2 = fork [2] %63 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %65 = arith.extsi %64#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %66 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %67:2 = fork [2] %66 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %68 = arith.extsi %67#0 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %69 = arith.extsi %67#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %70 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %71 = merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %72:2 = fork [2] %71 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %73 = constant %72#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %74 = arith.extsi %73 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %75 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %76 = constant %75 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %77:2 = fork [2] %76 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %78 = arith.extsi %77#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %79 = arith.extsi %77#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %80 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %81 = constant %80 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %82 = arith.extsi %81 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %83 = arith.muli %65, %78 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %84 = arith.extsi %83 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %85 = arith.addi %68, %84 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %86 = arith.extsi %85 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%86] %70 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %87 = arith.addi %69, %82 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %88:2 = fork [2] %87 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %89 = arith.trunci %88#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %90 = arith.cmpi ult, %88#1, %79 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %91:3 = fork [3] %90 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %91#0, %89 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %91#1, %64#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %91#2, %72#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %92 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %93 = arith.extsi %92 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %94 = merge %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %95 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %96 = constant %95 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %97 = arith.extsi %96 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %98 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %99 = constant %98 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %100 = arith.extsi %99 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %101 = arith.addi %93, %100 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %102:2 = fork [2] %101 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %103 = arith.trunci %102#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %104 = arith.cmpi ult, %102#1, %97 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %105:2 = fork [2] %104 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %105#0, %103 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %105#1, %94 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %106 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %107 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %106 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %107, %done, %done_0, %done_2 : none, none, none, none
  }
}

