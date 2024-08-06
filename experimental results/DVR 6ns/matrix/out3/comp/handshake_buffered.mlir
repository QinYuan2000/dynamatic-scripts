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
    %16 = tehb [3001] %result_3 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : none
    %17:2 = fork [2] %16 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %18 = constant %17#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %19:2 = fork [2] %18 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %20 = br %19#0 {bb = 2 : ui32, name = #handshake.name<"br13">} : i1
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %22 = tehb [3001] %19#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i1
    %23 = br %22 {bb = 2 : ui32, name = #handshake.name<"br14">} : i1
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %25 = tehb [3001] %14 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %26 = br %25 {bb = 2 : ui32, name = #handshake.name<"br15">} : i6
    %27 = tehb [3001] %13 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %28 = br %27 {bb = 2 : ui32, name = #handshake.name<"br16">} : i6
    %29 = br %17#1 {bb = 2 : ui32, name = #handshake.name<"br12">} : none
    %30 = mux %45#2 [%trueResult, %21] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %31:3 = fork [3] %30 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %32 = arith.extsi %31#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %33 = arith.extsi %31#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %34 = arith.extsi %31#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %35 = oehb [4008] %45#3 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : i1
    %36 = mux %35 [%trueResult_9, %24] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %37 = mux %45#0 [%trueResult_11, %26] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %38:2 = fork [2] %37 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %39 = arith.extsi %38#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %40 = mux %45#1 [%trueResult_13, %28] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %41 = oehb [1] %40 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %42 = tehb [1] %41 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i6
    %43:2 = fork [2] %42 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %44 = arith.extsi %43#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %29 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
    %45:4 = fork [4] %index_6 {bb = 3 : ui32, name = #handshake.name<"fork8">} : i1
    %46 = source {bb = 3 : ui32, name = #handshake.name<"source0">}
    %47 = constant %46 {bb = 3 : ui32, name = #handshake.name<"constant14">, value = 30 : i6} : i6
    %48:3 = fork [3] %47 {bb = 3 : ui32, name = #handshake.name<"fork9">} : i6
    %49 = arith.extsi %48#0 {bb = 3 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %50 = arith.extsi %48#1 {bb = 3 : ui32, name = #handshake.name<"extsi20">} : i6 to i7
    %51 = arith.extsi %48#2 {bb = 3 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %52 = source {bb = 3 : ui32, name = #handshake.name<"source1">}
    %53 = constant %52 {bb = 3 : ui32, name = #handshake.name<"constant15">, value = 1 : i2} : i2
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi22">} : i2 to i7
    %55 = arith.muli %39, %49 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %56 = arith.extsi %55 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %57 = oehb [4004] %32 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i13
    %58 = arith.addi %57, %56 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %59 = arith.extsi %58 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%59] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %60 = arith.muli %34, %51 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %61 = arith.extsi %60 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %62 = oehb [4003] %44 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i13
    %63 = arith.addi %62, %61 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%64] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %65 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %66 = oehb [1] %36 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %67 = tehb [1] %66 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i32
    %68 = arith.addi %67, %65 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %69 = arith.addi %33, %54 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %70:2 = fork [2] %69 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %71 = oehb [1] %70#0 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %72 = tehb [1] %71 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i7
    %73 = arith.trunci %72 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %74 = arith.cmpi ult, %70#1, %50 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %75 = oehb [1] %74 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %76 = tehb [1] %75 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %77:5 = fork [5] %76 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %77#0, %73 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %78 = oehb [4008] %77#3 {bb = 3 : ui32, name = #handshake.name<"oehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %78, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %79 = oehb [1] %38#0 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %80 = tehb [1] %79 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_11, %falseResult_12 = cond_br %77#1, %80 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %77#2, %43#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %81 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %82 = tehb [1] %81 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_15, %falseResult_16 = cond_br %77#4, %82 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %83 = merge %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %84:2 = fork [2] %83 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %85 = arith.extsi %84#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %86 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %87:2 = fork [2] %86 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %88 = tehb [3001] %87#0 {bb = 4 : ui32, name = #handshake.name<"tehb10">} : i6
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
    %110 = arith.trunci %109#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %111 = arith.cmpi ult, %109#1, %100 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %112:3 = fork [3] %111 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %112#0, %110 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %112#1, %84#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %112#2, %93#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %113 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %114 = arith.extsi %113 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %115 = tehb [3001] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"tehb11">} : none
    %116 = merge %115 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %117 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %118 = constant %117 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %119 = arith.extsi %118 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %120 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %121 = constant %120 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %122 = arith.extsi %121 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %123 = arith.addi %114, %122 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %124 = tehb [3001] %123 {bb = 5 : ui32, name = #handshake.name<"tehb12">} : i7
    %125:2 = fork [2] %124 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %126 = arith.trunci %125#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %127 = arith.cmpi ult, %125#1, %119 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %128:2 = fork [2] %127 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %128#0, %126 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %128#1, %116 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %129 = merge %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %130 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %129 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %130, %done, %done_0, %done_2 : none, none, none, none
  }
}

