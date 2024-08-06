module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%96, %addressResult_17, %dataResult_18) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1 = oehb [1] %0 {bb = 0 : ui32, name = #handshake.name<"oehb0">} : none
    %2:2 = fork [2] %1 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %3 = constant %2#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %4 = br %3 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %5 = arith.extsi %4 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %6 = br %2#0 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %7 = mux %index [%trueResult_25, %5] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %result, %index = control_merge %trueResult_27, %6 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %8:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %9 = constant %8#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %10 = br %9 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %12 = br %7 {bb = 1 : ui32, name = #handshake.name<"br2">} : i6
    %13 = br %8#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %14 = mux %16#1 [%trueResult_19, %11] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %15 = mux %16#0 [%trueResult_21, %12] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %13 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %16:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %17:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %18 = constant %17#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %19:2 = fork [2] %18 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %20 = br %19#0 {bb = 2 : ui32, name = #handshake.name<"br13">} : i1
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %22 = br %19#1 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %24 = oehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %25 = br %24 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %26 = br %14 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %27 = br %17#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %28 = mux %49#2 [%trueResult, %21] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %29 = oehb [1] %28 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %30:3 = fork [3] %29 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %31 = tehb [2] %30#0 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %32 = arith.extsi %31 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %33 = arith.extsi %30#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %34 = arith.extsi %30#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %35 = tehb [4] %49#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %36 = mux %35 [%trueResult_9, %23] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %37 = tehb [1] %49#0 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i1
    %38 = mux %37 [%trueResult_11, %25] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %39:2 = fork [2] %38 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %40 = arith.extsi %39#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %41 = oehb [1] %26 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %42 = tehb [1] %49#1 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %43 = mux %42 [%trueResult_13, %41] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %44 = oehb [1] %43 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i6
    %45 = tehb [1] %44 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %46:2 = fork [2] %45 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %47 = tehb [2] %46#1 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %48 = arith.extsi %47 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %27 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %49:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %50 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %51 = constant %50 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %52:3 = fork [3] %51 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %53 = arith.extsi %52#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %54 = arith.extsi %52#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %55 = arith.extsi %52#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %56 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %57 = constant %56 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %59 = arith.muli %40, %53 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %61 = arith.addi %32, %60 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%62] %memOutputs_1 {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load0">} : i32, i32
    %63 = arith.muli %34, %55 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %65 = arith.addi %48, %64 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %66 = arith.extsi %65 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%66] %memOutputs {bb = 3 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"mc_load1">} : i32, i32
    %67 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %68 = oehb [1] %36 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i32
    %69 = tehb [3] %68 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i32
    %70 = arith.addi %69, %67 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %71 = arith.addi %33, %58 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %72:2 = fork [2] %71 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %73 = arith.trunci %72#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %74 = arith.cmpi ult, %72#1, %54 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %75 = oehb [1] %74 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %76:5 = fork [5] %75 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %77 = tehb [1] %73 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i6
    %trueResult, %falseResult = cond_br %76#0, %77 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %78 = tehb [4] %76#3 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i1
    %trueResult_9, %falseResult_10 = cond_br %78, %70 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %79 = oehb [1] %39#0 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %80 = tehb [1] %79 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i6
    %81 = tehb [1] %76#1 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i1
    %trueResult_11, %falseResult_12 = cond_br %81, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %76#2, %46#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %82 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : none
    %83 = tehb [1] %82 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : none
    %trueResult_15, %falseResult_16 = cond_br %76#4, %83 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %84 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %85:2 = fork [2] %84 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %86 = arith.extsi %85#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %87 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %88:2 = fork [2] %87 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %89 = tehb [2] %88#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %90 = arith.extsi %89 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %91 = arith.extsi %88#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %92 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %93 = merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %94:2 = fork [2] %93 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %95 = constant %94#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %96 = arith.extsi %95 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %97 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %98 = constant %97 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %99:2 = fork [2] %98 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %100 = arith.extsi %99#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %101 = arith.extsi %99#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %102 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %103 = constant %102 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %104 = arith.extsi %103 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %105 = arith.muli %86, %100 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %106 = arith.extsi %105 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %107 = arith.addi %90, %106 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %108 = tehb [1] %107 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i13
    %109 = arith.extsi %108 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%109] %92 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %110 = arith.addi %91, %104 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %111 = oehb [1] %110 {bb = 4 : ui32, name = #handshake.name<"oehb10">} : i7
    %112:2 = fork [2] %111 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %113 = arith.trunci %112#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %114 = arith.cmpi ult, %112#1, %101 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %115:3 = fork [3] %114 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %115#0, %113 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %115#1, %85#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %116 = oehb [1] %94#0 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : none
    %trueResult_23, %falseResult_24 = cond_br %115#2, %116 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %117 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %118 = arith.extsi %117 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %119 = merge %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %120 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %121 = constant %120 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %122 = arith.extsi %121 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %123 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %124 = constant %123 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %125 = arith.extsi %124 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %126 = oehb [1] %118 {bb = 5 : ui32, name = #handshake.name<"oehb11">} : i7
    %127 = arith.addi %126, %125 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %128:2 = fork [2] %127 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %129 = oehb [1] %128#0 {bb = 5 : ui32, name = #handshake.name<"oehb13">} : i7
    %130 = arith.trunci %129 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %131 = arith.cmpi ult, %128#1, %122 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %132 = oehb [1] %131 {bb = 5 : ui32, name = #handshake.name<"oehb14">} : i1
    %133:2 = fork [2] %132 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %133#0, %130 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %134 = oehb [1] %119 {bb = 5 : ui32, name = #handshake.name<"oehb12">} : none
    %trueResult_27, %falseResult_28 = cond_br %133#1, %134 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %135 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %136 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %135 : none
    end {bb = 6 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end0">} %136, %done, %done_0, %done_2 : none, none, none, none
  }
}

