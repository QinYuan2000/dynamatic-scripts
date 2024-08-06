module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%79, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0:2 = fork [2] %arg3 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %3 = tehb [4001] %trueResult_25 {bb = 1 : ui32, name = #handshake.name<"tehb14">} : i6
    %4 = mux %index [%3, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %5 = tehb [4001] %trueResult_27 {bb = 1 : ui32, name = #handshake.name<"tehb15">} : none
    %result, %index = control_merge %5, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %6:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %7 = constant %6#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %8 = arith.extsi %7 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %9 = mux %11#1 [%trueResult_19, %8] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %10 = mux %11#0 [%trueResult_21, %4] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %result_3, %index_4 = control_merge %trueResult_23, %6#1 {bb = 2 : ui32, name = #handshake.name<"control_merge7">} : none, i1
    %11:2 = fork [2] %index_4 {bb = 2 : ui32, name = #handshake.name<"fork2">} : i1
    %12:2 = fork [2] %result_3 {bb = 2 : ui32, name = #handshake.name<"fork3">} : none
    %13 = constant %12#0 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = false} : i1
    %14:2 = fork [2] %13 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i1
    %15 = arith.extsi %14#0 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i1 to i6
    %16 = arith.extsi %14#1 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i1 to i32
    %17 = mux %38#2 [%trueResult, %15] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %18 = oehb [1] %17 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %19 = tehb [1] %18 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i6
    %20:3 = fork [3] %19 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %21 = tehb [2004] %20#0 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i6
    %22 = arith.extsi %21 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %23 = arith.extsi %20#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %24 = arith.extsi %20#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %25 = tehb [4001] %16 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i32
    %26 = tehb [2009] %38#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %27 = mux %26 [%trueResult_9, %25] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %28 = mux %38#0 [%trueResult_11, %10] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %29 = oehb [1] %28 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %30 = tehb [1] %29 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %31:2 = fork [2] %30 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %32 = arith.extsi %31#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %33 = mux %38#1 [%trueResult_13, %9] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %34 = oehb [1] %33 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %35 = tehb [1] %34 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %36:2 = fork [2] %35 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %37 = arith.extsi %36#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
    %result_5, %index_6 = control_merge %trueResult_15, %12#1 {bb = 3 : ui32, name = #handshake.name<"control_merge8">} : none, i1
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
    %48 = arith.muli %32, %42 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %49 = arith.extsi %48 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %50 = arith.addi %22, %49 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %51 = arith.extsi %50 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%51] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %52 = arith.muli %24, %44 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %53 = arith.extsi %52 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %54 = tehb [2004] %37 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i13
    %55 = arith.addi %54, %53 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %56 = arith.extsi %55 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%56] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %57 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %58 = oehb [1] %27 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %59 = tehb [1] %58 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i32
    %60 = arith.addi %59, %57 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %61 = arith.addi %23, %47 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %62:2 = fork [2] %61 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %63 = arith.trunci %62#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %64 = arith.cmpi ult, %62#1, %43 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %65:5 = fork [5] %64 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %65#0, %63 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %66 = tehb [2009] %65#3 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %66, %60 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %65#1, %31#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %65#2, %36#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %67 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : none
    %68 = tehb [1] %67 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_15, %falseResult_16 = cond_br %65#4, %68 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %69 = tehb [4001] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"tehb10">} : i6
    %70:2 = fork [2] %69 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %71 = arith.extsi %70#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %72:2 = fork [2] %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %73 = tehb [4001] %72#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %74 = arith.extsi %73 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %75 = arith.extsi %72#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %76 = tehb [4001] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"tehb11">} : none
    %77:2 = fork [2] %76 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %78 = constant %77#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %79 = arith.extsi %78 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %80 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %81 = constant %80 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %82:2 = fork [2] %81 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %83 = arith.extsi %82#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %84 = arith.extsi %82#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %85 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %86 = constant %85 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %87 = arith.extsi %86 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %88 = arith.muli %71, %83 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %89 = arith.extsi %88 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %90 = arith.addi %74, %89 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %91 = arith.extsi %90 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%91] %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %92 = arith.addi %75, %87 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %93 = tehb [4001] %92 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i7
    %94:2 = fork [2] %93 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %95 = arith.trunci %94#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %96 = arith.cmpi ult, %94#1, %84 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %97:3 = fork [3] %96 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %97#0, %95 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %97#1, %70#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %97#2, %77#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %98 = arith.extsi %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %99 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %100 = constant %99 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %101 = arith.extsi %100 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %102 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %103 = constant %102 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %104 = arith.extsi %103 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %105 = arith.addi %98, %104 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %106:2 = fork [2] %105 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %107 = arith.trunci %106#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %108 = arith.cmpi ult, %106#1, %101 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %109:2 = fork [2] %108 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %109#0, %107 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %109#1, %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %110 = tehb [4001] %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"tehb16">} : none
    %111 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %110 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %111, %done, %done_0, %done_2 : none, none, none, none
  }
}

