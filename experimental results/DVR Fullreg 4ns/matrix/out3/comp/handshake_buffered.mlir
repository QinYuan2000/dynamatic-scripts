module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%95, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
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
    %7 = tehb [3001] %result {bb = 1 : ui32, name = #handshake.name<"tehb1">} : none
    %8:2 = fork [2] %7 {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %9 = constant %8#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %10 = br %9 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %12 = tehb [3001] %6 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i6
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
    %23 = tehb [3001] %20#1 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i1
    %24 = br %23 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %25 = arith.extsi %24 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %26 = br %16 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %27 = br %15 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %28 = br %18#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %29 = mux %44#2 [%trueResult, %22] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %30:3 = fork [3] %29 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %31 = arith.extsi %30#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %32 = arith.extsi %30#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %33 = arith.extsi %30#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %34 = oehb [4003] %44#3 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i1
    %35 = mux %34 [%trueResult_9, %25] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %36 = mux %44#0 [%trueResult_11, %26] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %37:2 = fork [2] %36 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %38 = arith.extsi %37#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %39 = mux %44#1 [%trueResult_13, %27] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %40 = oehb [1] %39 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %41 = tehb [1] %40 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i6
    %42:2 = fork [2] %41 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %43 = arith.extsi %42#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %28 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %44:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %45 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %46 = constant %45 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %47:3 = fork [3] %46 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %48 = arith.extsi %47#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %49 = arith.extsi %47#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %50 = arith.extsi %47#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %51 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %52 = constant %51 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %54 = arith.muli %38, %48 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %55 = arith.extsi %54 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %56 = oehb [4002] %31 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i13
    %57 = arith.addi %56, %55 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %58 = arith.extsi %57 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%58] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %59 = arith.muli %33, %50 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %61 = oehb [1] %43 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i13
    %62 = tehb [1] %61 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i13
    %63 = arith.addi %62, %60 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%64] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %65 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %66 = oehb [1] %35 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %67 = tehb [1] %66 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i32
    %68 = arith.addi %67, %65 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %69 = tehb [3001] %32 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i7
    %70 = arith.addi %69, %53 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %71:2 = fork [2] %70 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %72 = tehb [3001] %71#0 {bb = 3 : ui32, name = #handshake.name<"tehb10">} : i7
    %73 = arith.trunci %72 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %74 = tehb [3001] %49 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i7
    %75 = arith.cmpi ult, %71#1, %74 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %76 = tehb [3001] %75 {bb = 3 : ui32, name = #handshake.name<"tehb11">} : i1
    %77:5 = fork [5] %76 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %77#0, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %78 = oehb [4003] %77#3 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i1
    %trueResult_9, %falseResult_10 = cond_br %78, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %79 = oehb [1] %37#0 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %80 = tehb [1] %79 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_11, %falseResult_12 = cond_br %77#1, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %77#2, %42#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %81 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %82 = tehb [1] %81 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : none
    %trueResult_15, %falseResult_16 = cond_br %77#4, %82 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %83 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %84:2 = fork [2] %83 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %85 = arith.extsi %84#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %86 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %87:2 = fork [2] %86 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %88 = tehb [3001] %87#0 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i6
    %89 = arith.extsi %88 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %90 = arith.extsi %87#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %91 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %92 = merge %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %93:2 = fork [2] %92 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %94 = constant %93#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %95 = arith.extsi %94 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %96 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %97 = constant %96 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %98:2 = fork [2] %97 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %99 = arith.extsi %98#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %100 = arith.extsi %98#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %101 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %102 = constant %101 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %103 = arith.extsi %102 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %104 = arith.muli %85, %99 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %105 = arith.extsi %104 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %106 = arith.addi %89, %105 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %107 = arith.extsi %106 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%107] %91 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %108 = arith.addi %90, %103 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %109:2 = fork [2] %108 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %110 = tehb [3001] %109#0 {bb = 4 : ui32, name = #handshake.name<"tehb15">} : i7
    %111 = arith.trunci %110 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %112 = arith.cmpi ult, %109#1, %100 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %113 = tehb [3001] %112 {bb = 4 : ui32, name = #handshake.name<"tehb16">} : i1
    %114:3 = fork [3] %113 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %114#0, %111 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %115 = tehb [3001] %84#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %trueResult_21, %falseResult_22 = cond_br %114#1, %115 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %116 = tehb [3001] %93#0 {bb = 4 : ui32, name = #handshake.name<"tehb14">} : none
    %trueResult_23, %falseResult_24 = cond_br %114#2, %116 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %117 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %118 = arith.extsi %117 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %119 = tehb [3001] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"tehb17">} : none
    %120 = merge %119 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %121 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %122 = constant %121 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %123 = arith.extsi %122 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %124 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %125 = constant %124 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %126 = arith.extsi %125 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %127 = arith.addi %118, %126 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %128 = tehb [3001] %127 {bb = 5 : ui32, name = #handshake.name<"tehb18">} : i7
    %129:2 = fork [2] %128 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %130 = arith.trunci %129#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %131 = arith.cmpi ult, %129#1, %123 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %132:2 = fork [2] %131 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %132#0, %130 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %132#1, %120 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %133 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %134 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %133 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %134, %done, %done_0, %done_2 : none, none, none, none
  }
}

