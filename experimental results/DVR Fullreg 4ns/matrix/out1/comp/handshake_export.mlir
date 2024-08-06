module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%81, %addressResult_17, %dataResult_18) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = oehb [1] %arg3 {bb = 0 : ui32, name = #handshake.name<"oehb0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %3 = arith.extsi %2 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %4 = mux %index [%trueResult_25, %3] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %result, %index = control_merge %trueResult_27, %1#0 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %5:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %6 = constant %5#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %7 = arith.extsi %6 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %8 = mux %10#1 [%trueResult_19, %7] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %9 = mux %10#0 [%trueResult_21, %4] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %5#1 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %10:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %11:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %12 = constant %11#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %13:2 = fork [2] %12 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %14 = arith.extsi %13#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %15 = arith.extsi %13#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %16 = oehb [1] %9 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %17 = mux %38#2 [%trueResult, %14] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %18 = oehb [1] %17 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %19:3 = fork [3] %18 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %20 = tehb [2] %19#0 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %21 = arith.extsi %20 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %22 = arith.extsi %19#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %23 = arith.extsi %19#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %24 = tehb [4] %38#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %25 = mux %24 [%trueResult_9, %15] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %26 = tehb [1] %38#0 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i1
    %27 = mux %26 [%trueResult_11, %16] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %28:2 = fork [2] %27 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %29 = arith.extsi %28#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %30 = oehb [1] %8 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %31 = tehb [1] %38#1 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %32 = mux %31 [%trueResult_13, %30] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %33 = oehb [1] %32 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i6
    %34 = tehb [1] %33 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %35:2 = fork [2] %34 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %36 = tehb [2] %35#1 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %37 = arith.extsi %36 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %11#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
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
    %48 = arith.muli %29, %42 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %50 = arith.addi %21, %49 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %51 = arith.extsi %50 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%51] %memOutputs_1 {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %52 = arith.muli %23, %44 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %54 = arith.addi %37, %53 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %55 = arith.extsi %54 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%55] %memOutputs {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %56 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %57 = oehb [1] %25 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i32
    %58 = tehb [3] %57 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i32
    %59 = arith.addi %58, %56 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %60 = arith.addi %22, %47 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %61:2 = fork [2] %60 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %62 = arith.trunci %61#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = arith.cmpi ult, %61#1, %43 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %64 = oehb [1] %63 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %65:5 = fork [5] %64 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %66 = tehb [1] %62 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i6
    %trueResult, %falseResult = cond_br %65#0, %66 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %67 = tehb [4] %65#3 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i1
    %trueResult_9, %falseResult_10 = cond_br %67, %59 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %68 = oehb [1] %28#0 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %69 = tehb [1] %68 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i6
    %70 = tehb [1] %65#1 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i1
    %trueResult_11, %falseResult_12 = cond_br %70, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %65#2, %35#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %71 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : none
    %72 = tehb [1] %71 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : none
    %trueResult_15, %falseResult_16 = cond_br %65#4, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %73:2 = fork [2] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %74 = arith.extsi %73#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %75:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %76 = tehb [2] %75#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %77 = arith.extsi %76 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %78 = arith.extsi %75#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %79:2 = fork [2] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %80 = constant %79#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %81 = arith.extsi %80 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %82 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %83 = constant %82 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %84:2 = fork [2] %83 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %85 = arith.extsi %84#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %86 = arith.extsi %84#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %87 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %88 = constant %87 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %89 = arith.extsi %88 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %90 = arith.muli %74, %85 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %91 = arith.extsi %90 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %92 = arith.addi %77, %91 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %93 = tehb [1] %92 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i13
    %94 = arith.extsi %93 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%94] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %95 = arith.addi %78, %89 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %96 = oehb [1] %95 {bb = 4 : ui32, name = #handshake.name<"oehb10">} : i7
    %97:2 = fork [2] %96 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %98 = arith.trunci %97#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %99 = arith.cmpi ult, %97#1, %86 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %100:3 = fork [3] %99 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %100#0, %98 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %100#1, %73#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %101 = oehb [1] %79#0 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : none
    %trueResult_23, %falseResult_24 = cond_br %100#2, %101 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %102 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %103 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %104 = constant %103 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %105 = arith.extsi %104 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %106 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %107 = constant %106 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %108 = arith.extsi %107 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %109 = oehb [1] %102 {bb = 5 : ui32, name = #handshake.name<"oehb11">} : i7
    %110 = arith.addi %109, %108 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %111:2 = fork [2] %110 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %112 = oehb [1] %111#0 {bb = 5 : ui32, name = #handshake.name<"oehb13">} : i7
    %113 = arith.trunci %112 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %114 = arith.cmpi ult, %111#1, %105 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %115 = oehb [1] %114 {bb = 5 : ui32, name = #handshake.name<"oehb14">} : i1
    %116:2 = fork [2] %115 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %116#0, %113 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %117 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb12">} : none
    %trueResult_27, %falseResult_28 = cond_br %116#1, %117 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %118 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %118, %done, %done_0, %done_2 : none, none, none, none
  }
}

