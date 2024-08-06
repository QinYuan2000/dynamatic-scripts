module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%77, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg3 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %3 = mux %index [%trueResult_25, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %result, %index = control_merge %trueResult_27, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %4 = oehb [1] %result {bb = 1 : ui32, name = #handshake.name<"oehb1">} : none
    %5:2 = fork [2] %4 {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %6 = constant %5#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %7 = arith.extsi %6 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %8 = oehb [1] %3 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i6
    %9 = mux %11#1 [%trueResult_19, %7] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %10 = mux %11#0 [%trueResult_21, %8] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %5#1 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %11:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %12:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %13 = constant %12#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %14:2 = fork [2] %13 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %15 = arith.extsi %14#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %16 = arith.extsi %14#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %17 = mux %35#2 [%trueResult, %15] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %18 = tehb [4001] %17 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %19:3 = fork [3] %18 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %20 = arith.extsi %19#0 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %21 = arith.extsi %19#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %22 = arith.extsi %19#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %23 = oehb [1] %16 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i32
    %24 = tehb [2007] %35#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %25 = mux %24 [%trueResult_9, %23] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %26 = mux %35#0 [%trueResult_11, %10] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %27 = tehb [4001] %26 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %28:2 = fork [2] %27 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %29 = arith.extsi %28#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %30 = mux %35#1 [%trueResult_13, %9] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %31 = oehb [1] %30 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : i6
    %32 = tehb [4001] %31 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %33:2 = fork [2] %32 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %34 = arith.extsi %33#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %12#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
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
    %47 = tehb [2003] %20 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i13
    %48 = arith.addi %47, %46 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%49] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %50 = arith.muli %22, %41 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %51 = arith.extsi %50 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %52 = tehb [2003] %34 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i13
    %53 = arith.addi %52, %51 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%54] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %55 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %56 = oehb [1] %25 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i32
    %57 = tehb [4001] %56 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %58 = arith.addi %57, %55 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %59 = arith.addi %21, %44 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %60:2 = fork [2] %59 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %61 = oehb [1] %60#0 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : i7
    %62 = arith.trunci %61 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %63 = arith.cmpi ult, %60#1, %40 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %64 = oehb [1] %63 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i1
    %65:5 = fork [5] %64 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %65#0, %62 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %66 = tehb [2007] %65#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_9, %falseResult_10 = cond_br %66, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %67 = oehb [1] %28#0 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i6
    %trueResult_11, %falseResult_12 = cond_br %65#1, %67 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %65#2, %33#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %68 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb6">} : none
    %69 = tehb [4001] %68 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_15, %falseResult_16 = cond_br %65#4, %69 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %70:2 = fork [2] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %71 = arith.extsi %70#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %72:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %73 = arith.extsi %72#0 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %74 = arith.extsi %72#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %75:2 = fork [2] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %76 = constant %75#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %77 = arith.extsi %76 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %78 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %79 = constant %78 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %80:2 = fork [2] %79 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %81 = arith.extsi %80#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %82 = arith.extsi %80#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %83 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %84 = constant %83 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %85 = arith.extsi %84 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %86 = arith.muli %71, %81 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %87 = arith.extsi %86 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %88 = oehb [1] %73 {bb = 4 : ui32, name = #handshake.name<"oehb10">} : i13
    %89 = arith.addi %88, %87 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %90 = arith.extsi %89 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%90] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %91 = arith.addi %74, %85 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %92:2 = fork [2] %91 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %93 = oehb [1] %92#0 {bb = 4 : ui32, name = #handshake.name<"oehb12">} : i7
    %94 = arith.trunci %93 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %95 = arith.cmpi ult, %92#1, %82 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %96 = oehb [1] %95 {bb = 4 : ui32, name = #handshake.name<"oehb13">} : i1
    %97:3 = fork [3] %96 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %97#0, %94 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %98 = oehb [1] %70#0 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : i6
    %trueResult_21, %falseResult_22 = cond_br %97#1, %98 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %99 = oehb [1] %75#0 {bb = 4 : ui32, name = #handshake.name<"oehb11">} : none
    %trueResult_23, %falseResult_24 = cond_br %97#2, %99 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %100 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %101 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb14">} : none
    %102 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %103 = constant %102 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %104 = arith.extsi %103 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %105 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %106 = constant %105 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %107 = arith.extsi %106 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %108 = arith.addi %100, %107 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %109 = oehb [1] %108 {bb = 5 : ui32, name = #handshake.name<"oehb15">} : i7
    %110:2 = fork [2] %109 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %111 = arith.trunci %110#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %112 = arith.cmpi ult, %110#1, %104 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %113:2 = fork [2] %112 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %113#0, %111 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %113#1, %101 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %114 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %114, %done, %done_0, %done_2 : none, none, none, none
  }
}

