module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%92, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %7 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %8:2 = fork [2] %7 {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %9 = constant %8#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %10 = br %9 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %12 = oehb [1] %6 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i6
    %13 = br %12 {bb = 1 : ui32, name = #handshake.name<"br2">} : i6
    %14 = br %8#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %15 = mux %17#1 [%trueResult_19, %11] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %16 = mux %17#0 [%trueResult_21, %13] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %14 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %17:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %18:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %19 = constant %18#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %20:2 = fork [2] %19 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %21 = br %20#0 {bb = 2 : ui32, name = #handshake.name<"br13">} : i1
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %23 = br %20#1 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %25 = br %16 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %26 = br %15 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %27 = br %18#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %28 = mux %46#2 [%trueResult, %22] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %29 = tehb [4001] %28 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %30:3 = fork [3] %29 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %31 = arith.extsi %30#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %32 = arith.extsi %30#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %33 = arith.extsi %30#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %34 = oehb [1] %24 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i32
    %35 = tehb [2007] %46#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %36 = mux %35 [%trueResult_9, %34] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %37 = mux %46#0 [%trueResult_11, %25] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %38 = tehb [4001] %37 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %39:2 = fork [2] %38 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %40 = arith.extsi %39#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %41 = mux %46#1 [%trueResult_13, %26] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %42 = oehb [1] %41 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %43 = tehb [4001] %42 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %44:2 = fork [2] %43 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %45 = arith.extsi %44#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %27 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %46:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %47 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %48 = constant %47 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %49:3 = fork [3] %48 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %50 = arith.extsi %49#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %51 = arith.extsi %49#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %52 = arith.extsi %49#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %53 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %54 = constant %53 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %55 = arith.extsi %54 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %56 = arith.muli %40, %50 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %57 = arith.extsi %56 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %58 = tehb [2003] %31 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i13
    %59 = arith.addi %58, %57 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%60] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %61 = arith.muli %33, %52 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %63 = tehb [2003] %45 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i13
    %64 = arith.addi %63, %62 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %65 = arith.extsi %64 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%65] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %66 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %67 = oehb [1] %36 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i32
    %68 = tehb [4001] %67 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %69 = arith.addi %68, %66 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %70 = arith.addi %32, %55 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %71:2 = fork [2] %70 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %72 = oehb [1] %71#0 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %73 = arith.trunci %72 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %74 = arith.cmpi ult, %71#1, %51 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %75 = oehb [1] %74 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %76:5 = fork [5] %75 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %76#0, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %77 = tehb [2007] %76#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_9, %falseResult_10 = cond_br %77, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %78 = oehb [1] %39#0 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i6
    %trueResult_11, %falseResult_12 = cond_br %76#1, %78 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %76#2, %44#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %79 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : none
    %80 = tehb [4001] %79 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_15, %falseResult_16 = cond_br %76#4, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %81 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %82:2 = fork [2] %81 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %83 = arith.extsi %82#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %84 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %85:2 = fork [2] %84 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %86 = arith.extsi %85#0 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %87 = arith.extsi %85#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %88 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %89 = merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %90:2 = fork [2] %89 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %91 = constant %90#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %92 = arith.extsi %91 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %93 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %94 = constant %93 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %95:2 = fork [2] %94 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %96 = arith.extsi %95#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %97 = arith.extsi %95#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %98 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %99 = constant %98 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %100 = arith.extsi %99 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %101 = arith.muli %83, %96 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %102 = arith.extsi %101 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %103 = oehb [1] %86 {bb = 4 : ui32, name = #handshake.name<"oehb10">} : i13
    %104 = arith.addi %103, %102 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %105 = arith.extsi %104 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%105] %88 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %106 = arith.addi %87, %100 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %107:2 = fork [2] %106 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %108 = oehb [1] %107#0 {bb = 4 : ui32, name = #handshake.name<"oehb12">} : i7
    %109 = arith.trunci %108 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %110 = arith.cmpi ult, %107#1, %97 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %111 = oehb [1] %110 {bb = 4 : ui32, name = #handshake.name<"oehb13">} : i1
    %112:3 = fork [3] %111 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %112#0, %109 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %113 = oehb [1] %82#0 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : i6
    %trueResult_21, %falseResult_22 = cond_br %112#1, %113 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %114 = oehb [1] %90#0 {bb = 4 : ui32, name = #handshake.name<"oehb11">} : none
    %trueResult_23, %falseResult_24 = cond_br %112#2, %114 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %115 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %116 = arith.extsi %115 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %117 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb14">} : none
    %118 = merge %117 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %119 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %120 = constant %119 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %121 = arith.extsi %120 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %122 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %123 = constant %122 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %124 = arith.extsi %123 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %125 = arith.addi %116, %124 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %126 = oehb [1] %125 {bb = 5 : ui32, name = #handshake.name<"oehb15">} : i7
    %127:2 = fork [2] %126 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %128 = arith.trunci %127#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %129 = arith.cmpi ult, %127#1, %121 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %130:2 = fork [2] %129 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %130#0, %128 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %130#1, %118 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %131 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %132 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %131 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %132, %done, %done_0, %done_2 : none, none, none, none
  }
}

