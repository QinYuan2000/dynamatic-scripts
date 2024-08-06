module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%93, %addressResult_17, %dataResult_18) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
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
    %26 = mux %47#2 [%trueResult, %20] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %27:3 = fork [3] %26 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %28 = arith.extsi %27#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %29 = arith.extsi %27#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %30 = tehb [1] %27#2 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %31 = arith.extsi %30 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %32 = tehb [9] %47#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %33 = mux %32 [%trueResult_9, %22] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %34 = oehb [1] %23 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %35 = tehb [1] %47#0 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i1
    %36 = oehb [1] %trueResult_11 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %37 = tehb [1] %36 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i6
    %38 = mux %35 [%37, %34] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %39:2 = fork [2] %38 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %40 = arith.extsi %39#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %41 = mux %47#1 [%trueResult_13, %24] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %42 = oehb [1] %41 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %43 = tehb [1] %42 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %44:2 = fork [2] %43 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %45 = tehb [4] %44#1 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %46 = arith.extsi %45 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %25 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %47:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %48 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %49 = constant %48 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %50:3 = fork [3] %49 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %51 = arith.extsi %50#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %52 = arith.extsi %50#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %53 = arith.extsi %50#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %54 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %55 = constant %54 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %56 = arith.extsi %55 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %57 = arith.muli %40, %51 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %59 = tehb [5] %28 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i13
    %60 = arith.addi %59, %58 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%61] %memOutputs_1 {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %62 = arith.muli %31, %53 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %63 = arith.extsi %62 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %64 = arith.addi %46, %63 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %65 = arith.extsi %64 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%65] %memOutputs {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %66 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %67 = oehb [1] %33 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %68 = tehb [5] %67 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %69 = arith.addi %68, %66 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %70 = arith.addi %29, %56 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %71 = oehb [1] %70 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i7
    %72 = tehb [1] %71 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %73:2 = fork [2] %72 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %74 = arith.trunci %73#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %75 = arith.cmpi ult, %73#1, %52 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %76:5 = fork [5] %75 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %76#0, %74 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %77 = tehb [9] %76#3 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %77, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %76#1, %39#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %76#2, %44#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %78 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : none
    %79 = tehb [1] %78 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : none
    %trueResult_15, %falseResult_16 = cond_br %76#4, %79 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %80 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %81 = oehb [1] %80 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i6
    %82:2 = fork [2] %81 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %83 = arith.extsi %82#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %84 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %85:2 = fork [2] %84 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %86 = tehb [3] %85#0 {bb = 4 : ui32, name = #handshake.name<"tehb11">} : i6
    %87 = arith.extsi %86 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %88 = arith.extsi %85#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %89 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %90 = merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %91:2 = fork [2] %90 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %92 = constant %91#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %93 = arith.extsi %92 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %94 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %95 = constant %94 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %96:2 = fork [2] %95 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %97 = arith.extsi %96#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %98 = arith.extsi %96#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %99 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %100 = constant %99 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %101 = arith.extsi %100 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %102 = arith.muli %83, %97 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %103 = arith.extsi %102 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %104 = arith.addi %87, %103 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %105 = arith.extsi %104 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %106 = tehb [2] %105 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i32
    %addressResult_17, %dataResult_18 = mc_store[%106] %89 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %107 = arith.addi %88, %101 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %108 = oehb [1] %107 {bb = 4 : ui32, name = #handshake.name<"oehb8">} : i7
    %109:2 = fork [2] %108 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %110 = arith.trunci %109#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %111 = arith.cmpi ult, %109#1, %98 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %112:3 = fork [3] %111 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %112#0, %110 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %112#1, %82#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %113 = oehb [1] %91#0 {bb = 4 : ui32, name = #handshake.name<"oehb7">} : none
    %trueResult_23, %falseResult_24 = cond_br %112#2, %113 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %114 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %115 = arith.extsi %114 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %116 = merge %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %117 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %118 = constant %117 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %119 = arith.extsi %118 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %120 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %121 = constant %120 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %122 = arith.extsi %121 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %123 = arith.addi %115, %122 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %124 = oehb [1] %123 {bb = 5 : ui32, name = #handshake.name<"oehb10">} : i7
    %125:2 = fork [2] %124 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %126 = arith.trunci %125#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %127 = arith.cmpi ult, %125#1, %119 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %128:2 = fork [2] %127 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %128#0, %126 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %129 = oehb [1] %116 {bb = 5 : ui32, name = #handshake.name<"oehb9">} : none
    %trueResult_27, %falseResult_28 = cond_br %128#1, %129 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %130 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %131 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %130 : none
    end {bb = 6 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %131, %done, %done_0, %done_2 : none, none, none, none
  }
}

