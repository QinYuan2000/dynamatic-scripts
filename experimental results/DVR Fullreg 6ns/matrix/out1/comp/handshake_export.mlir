module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%78, %addressResult_17, %dataResult_18) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
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
    %10:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %11 = constant %10#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %12:2 = fork [2] %11 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %13 = arith.extsi %12#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %14 = arith.extsi %12#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %15 = mux %36#2 [%trueResult, %13] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %16:3 = fork [3] %15 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %17 = arith.extsi %16#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %18 = arith.extsi %16#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %19 = tehb [1] %16#2 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %20 = arith.extsi %19 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %21 = tehb [9] %36#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %22 = mux %21 [%trueResult_9, %14] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %23 = oehb [1] %8 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %24 = tehb [1] %36#0 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i1
    %25 = oehb [1] %trueResult_11 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %26 = tehb [1] %25 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i6
    %27 = mux %24 [%26, %23] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %28:2 = fork [2] %27 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %29 = arith.extsi %28#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %30 = mux %36#1 [%trueResult_13, %7] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %31 = oehb [1] %30 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %32 = tehb [1] %31 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %33:2 = fork [2] %32 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %34 = tehb [4] %33#1 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %35 = arith.extsi %34 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %10#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %36:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %37 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %38 = constant %37 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %39:3 = fork [3] %38 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %40 = arith.extsi %39#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %41 = arith.extsi %39#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %42 = arith.extsi %39#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %43 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %44 = constant %43 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %45 = arith.extsi %44 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %46 = arith.muli %29, %40 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %47 = arith.extsi %46 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %48 = tehb [5] %17 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i13
    %49 = arith.addi %48, %47 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %50 = arith.extsi %49 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%50] %memOutputs_1 {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %51 = arith.muli %20, %42 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %52 = arith.extsi %51 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %53 = arith.addi %35, %52 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%54] %memOutputs {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %55 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %56 = oehb [1] %22 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %57 = tehb [5] %56 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %58 = arith.addi %57, %55 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %59 = arith.addi %18, %45 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %60 = oehb [1] %59 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i7
    %61 = tehb [1] %60 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %62:2 = fork [2] %61 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %63 = arith.trunci %62#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %64 = arith.cmpi ult, %62#1, %41 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %65:5 = fork [5] %64 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %65#0, %63 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %66 = tehb [9] %65#3 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %66, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %65#1, %28#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %65#2, %33#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %67 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : none
    %68 = tehb [1] %67 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : none
    %trueResult_15, %falseResult_16 = cond_br %65#4, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %69 = oehb [1] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i6
    %70:2 = fork [2] %69 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %71 = arith.extsi %70#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %72:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %73 = tehb [3] %72#0 {bb = 4 : ui32, name = #handshake.name<"tehb11">} : i6
    %74 = arith.extsi %73 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %75 = arith.extsi %72#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %76:2 = fork [2] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %77 = constant %76#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %78 = arith.extsi %77 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %79 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %80 = constant %79 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %81:2 = fork [2] %80 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %82 = arith.extsi %81#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %83 = arith.extsi %81#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %84 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %85 = constant %84 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %86 = arith.extsi %85 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %87 = arith.muli %71, %82 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %88 = arith.extsi %87 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %89 = arith.addi %74, %88 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %90 = arith.extsi %89 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %91 = tehb [2] %90 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i32
    %addressResult_17, %dataResult_18 = mc_store[%91] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %92 = arith.addi %75, %86 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %93 = oehb [1] %92 {bb = 4 : ui32, name = #handshake.name<"oehb8">} : i7
    %94:2 = fork [2] %93 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %95 = arith.trunci %94#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %96 = arith.cmpi ult, %94#1, %83 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %97:3 = fork [3] %96 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %97#0, %95 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %97#1, %70#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %98 = oehb [1] %76#0 {bb = 4 : ui32, name = #handshake.name<"oehb7">} : none
    %trueResult_23, %falseResult_24 = cond_br %97#2, %98 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %99 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %100 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %101 = constant %100 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %102 = arith.extsi %101 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %103 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %104 = constant %103 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %105 = arith.extsi %104 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %106 = arith.addi %99, %105 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %107 = oehb [1] %106 {bb = 5 : ui32, name = #handshake.name<"oehb10">} : i7
    %108:2 = fork [2] %107 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %109 = arith.trunci %108#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %110 = arith.cmpi ult, %108#1, %102 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %111:2 = fork [2] %110 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %111#0, %109 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %112 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb9">} : none
    %trueResult_27, %falseResult_28 = cond_br %111#1, %112 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %113 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %113, %done, %done_0, %done_2 : none, none, none, none
  }
}

