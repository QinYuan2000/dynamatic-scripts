module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%91, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %21 = oehb [1] %18#1 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i1
    %22 = br %21 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %24 = br %14 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %25 = br %13 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %26 = br %16#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %27 = mux %47#2 [%trueResult, %20] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %28 = oehb [1] %27 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i6
    %29 = tehb [1] %28 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %30:3 = fork [3] %29 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %31 = tehb [2004] %30#0 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i6
    %32 = arith.extsi %31 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %33 = arith.extsi %30#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %34 = arith.extsi %30#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %35 = tehb [2009] %47#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %36 = mux %35 [%trueResult_9, %23] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %37 = mux %47#0 [%trueResult_11, %24] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %38 = oehb [1] %37 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %39 = tehb [1] %38 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %40:2 = fork [2] %39 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %41 = arith.extsi %40#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %42 = mux %47#1 [%trueResult_13, %25] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %43 = oehb [1] %42 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i6
    %44 = tehb [1] %43 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %45:2 = fork [2] %44 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %46 = arith.extsi %45#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %26 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
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
    %57 = arith.muli %41, %51 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %59 = arith.addi %32, %58 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%60] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %61 = arith.muli %34, %53 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %63 = tehb [2004] %46 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i13
    %64 = arith.addi %63, %62 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %65 = arith.extsi %64 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%65] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %66 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %67 = oehb [1] %36 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i32
    %68 = tehb [1] %67 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %69 = arith.addi %68, %66 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %70 = arith.addi %33, %56 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %71:2 = fork [2] %70 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %72 = arith.trunci %71#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %73 = arith.cmpi ult, %71#1, %52 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %74:5 = fork [5] %73 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %74#0, %72 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %75 = tehb [2009] %74#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_9, %falseResult_10 = cond_br %75, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %74#1, %40#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %74#2, %45#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %76 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %77 = tehb [1] %76 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_15, %falseResult_16 = cond_br %74#4, %77 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %78 = oehb [1] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i6
    %79 = merge %78 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %80:2 = fork [2] %79 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %81 = arith.extsi %80#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %82 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %83:2 = fork [2] %82 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %84 = arith.extsi %83#0 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %85 = arith.extsi %83#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %86 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %87 = oehb [1] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"oehb7">} : none
    %88 = merge %87 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %89:2 = fork [2] %88 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %90 = constant %89#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %91 = arith.extsi %90 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %92 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %93 = constant %92 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %94:2 = fork [2] %93 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %95 = arith.extsi %94#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %96 = arith.extsi %94#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %97 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %98 = constant %97 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %99 = arith.extsi %98 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %100 = arith.muli %81, %95 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %101 = arith.extsi %100 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %102 = oehb [1] %84 {bb = 4 : ui32, name = #handshake.name<"oehb8">} : i13
    %103 = arith.addi %102, %101 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %104 = arith.extsi %103 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%104] %86 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %105 = arith.addi %85, %99 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %106 = oehb [1] %105 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : i7
    %107:2 = fork [2] %106 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %108 = arith.trunci %107#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %109 = arith.cmpi ult, %107#1, %96 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %110:3 = fork [3] %109 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %110#0, %108 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %110#1, %80#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %110#2, %89#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %111 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %112 = arith.extsi %111 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %113 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb10">} : none
    %114 = merge %113 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %115 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %116 = constant %115 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %117 = arith.extsi %116 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %118 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %119 = constant %118 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %120 = arith.extsi %119 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %121 = arith.addi %112, %120 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %122:2 = fork [2] %121 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %123 = arith.trunci %122#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %124 = arith.cmpi ult, %122#1, %117 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %125 = oehb [1] %124 {bb = 5 : ui32, name = #handshake.name<"oehb12">} : i1
    %126:2 = fork [2] %125 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %127 = oehb [1] %123 {bb = 5 : ui32, name = #handshake.name<"oehb11">} : i6
    %trueResult_25, %falseResult_26 = cond_br %126#0, %127 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %126#1, %114 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %128 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %129 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %128 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %129, %done, %done_0, %done_2 : none, none, none, none
  }
}

