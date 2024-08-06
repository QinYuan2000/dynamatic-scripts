module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%76, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
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
    %14 = oehb [1] %12#1 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i1
    %15 = arith.extsi %14 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %16 = mux %36#2 [%trueResult, %13] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %17 = oehb [1] %16 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i6
    %18 = tehb [1] %17 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i6
    %19:3 = fork [3] %18 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %20 = tehb [2004] %19#0 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i6
    %21 = arith.extsi %20 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %22 = arith.extsi %19#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %23 = arith.extsi %19#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %24 = tehb [2009] %36#3 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : i1
    %25 = mux %24 [%trueResult_9, %15] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %26 = mux %36#0 [%trueResult_11, %8] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %27 = oehb [1] %26 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %28 = tehb [1] %27 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i6
    %29:2 = fork [2] %28 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %30 = arith.extsi %29#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %31 = mux %36#1 [%trueResult_13, %7] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %32 = oehb [1] %31 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : i6
    %33 = tehb [1] %32 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %34:2 = fork [2] %33 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %35 = arith.extsi %34#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
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
    %46 = arith.muli %30, %40 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %47 = arith.extsi %46 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %48 = arith.addi %21, %47 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%49] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %50 = arith.muli %23, %42 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %51 = arith.extsi %50 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %52 = tehb [2004] %35 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i13
    %53 = arith.addi %52, %51 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %54 = arith.extsi %53 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%54] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %55 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %56 = oehb [1] %25 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i32
    %57 = tehb [1] %56 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i32
    %58 = arith.addi %57, %55 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %59 = arith.addi %22, %45 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %60:2 = fork [2] %59 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %61 = arith.trunci %60#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %62 = arith.cmpi ult, %60#1, %41 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %63:5 = fork [5] %62 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %63#0, %61 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %64 = tehb [2009] %63#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %trueResult_9, %falseResult_10 = cond_br %64, %58 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %63#1, %29#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %63#2, %34#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %65 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb5">} : none
    %66 = tehb [1] %65 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_15, %falseResult_16 = cond_br %63#4, %66 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %67 = oehb [1] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"oehb6">} : i6
    %68:2 = fork [2] %67 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %69 = arith.extsi %68#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %70:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %71 = arith.extsi %70#0 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %72 = arith.extsi %70#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %73 = oehb [1] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"oehb7">} : none
    %74:2 = fork [2] %73 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %75 = constant %74#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %76 = arith.extsi %75 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %77 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %78 = constant %77 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %79:2 = fork [2] %78 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %80 = arith.extsi %79#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %81 = arith.extsi %79#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %82 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %83 = constant %82 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %84 = arith.extsi %83 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %85 = arith.muli %69, %80 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %86 = arith.extsi %85 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %87 = oehb [1] %71 {bb = 4 : ui32, name = #handshake.name<"oehb8">} : i13
    %88 = arith.addi %87, %86 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %89 = arith.extsi %88 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%89] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %90 = arith.addi %72, %84 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %91 = oehb [1] %90 {bb = 4 : ui32, name = #handshake.name<"oehb9">} : i7
    %92:2 = fork [2] %91 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %93 = arith.trunci %92#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %94 = arith.cmpi ult, %92#1, %81 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %95:3 = fork [3] %94 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %95#0, %93 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %95#1, %68#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %95#2, %74#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %96 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %97 = oehb [1] %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"oehb10">} : none
    %98 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %99 = constant %98 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %100 = arith.extsi %99 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %101 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %102 = constant %101 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %103 = arith.extsi %102 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %104 = arith.addi %96, %103 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %105:2 = fork [2] %104 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %106 = arith.trunci %105#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %107 = arith.cmpi ult, %105#1, %100 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %108 = oehb [1] %107 {bb = 5 : ui32, name = #handshake.name<"oehb12">} : i1
    %109:2 = fork [2] %108 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %110 = oehb [1] %106 {bb = 5 : ui32, name = #handshake.name<"oehb11">} : i6
    %trueResult_25, %falseResult_26 = cond_br %109#0, %110 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %109#1, %97 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %111 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %falseResult_28 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %111, %done, %done_0, %done_2 : none, none, none, none
  }
}

