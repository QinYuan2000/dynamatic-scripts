module {
  handshake.func @matrix(%arg0: memref<900xi32>, %arg1: memref<900xi32>, %arg2: memref<900xi32>, %arg3: none, ...) -> none attributes {argNames = ["inA", "inB", "outC", "start"], resNames = ["out0"]} {
    %done = mem_controller[%arg2 : memref<900xi32>] (%94, %addressResult_17, %dataResult_18) {connectedBlocks = [4 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32) -> none
    %memOutputs, %done_0 = mem_controller[%arg1 : memref<900xi32>] (%addressResult_7) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller1">} : (i32) -> (i32, none)
    %memOutputs_1, %done_2 = mem_controller[%arg0 : memref<900xi32>] (%addressResult) {connectedBlocks = [3 : i32], name = #handshake.name<"mem_controller2">} : (i32) -> (i32, none)
    %0 = merge %arg3 {bb = 0 : ui32, name = #handshake.name<"merge0">} : none
    %1:2 = fork [2] %0 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %2 = constant %1#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %3 = br %2 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %4 = arith.extsi %3 {bb = 0 : ui32, name = #handshake.name<"extsi10">} : i1 to i6
    %5 = br %1#0 {bb = 0 : ui32, name = #handshake.name<"br4">} : none
    %6 = tehb [4001] %trueResult_25 {bb = 1 : ui32, name = #handshake.name<"tehb14">} : i6
    %7 = mux %index [%6, %4] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %8 = tehb [4001] %trueResult_27 {bb = 1 : ui32, name = #handshake.name<"tehb15">} : none
    %result, %index = control_merge %8, %5 {bb = 1 : ui32, name = #handshake.name<"control_merge6">} : none, i1
    %9:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork1">} : none
    %10 = constant %9#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %11 = br %10 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %12 = arith.extsi %11 {bb = 1 : ui32, name = #handshake.name<"extsi11">} : i1 to i6
    %13 = br %7 {bb = 1 : ui32, name = #handshake.name<"br2">} : i6
    %14 = br %9#1 {bb = 1 : ui32, name = #handshake.name<"br7">} : none
    %15 = mux %17#1 [%trueResult_19, %12] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
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
    %28 = mux %49#2 [%trueResult, %22] {bb = 3 : ui32, name = #handshake.name<"mux10">} : i1, i6
    %29 = oehb [1] %28 {bb = 3 : ui32, name = #handshake.name<"oehb0">} : i6
    %30 = tehb [1] %29 {bb = 3 : ui32, name = #handshake.name<"tehb1">} : i6
    %31:3 = fork [3] %30 {bb = 3 : ui32, name = #handshake.name<"fork5">} : i6
    %32 = tehb [2004] %31#0 {bb = 3 : ui32, name = #handshake.name<"tehb2">} : i6
    %33 = arith.extsi %32 {bb = 3 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %34 = arith.extsi %31#1 {bb = 3 : ui32, name = #handshake.name<"extsi15">} : i6 to i7
    %35 = arith.extsi %31#2 {bb = 3 : ui32, name = #handshake.name<"extsi16">} : i6 to i12
    %36 = tehb [4001] %24 {bb = 3 : ui32, name = #handshake.name<"tehb0">} : i32
    %37 = tehb [2009] %49#3 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : i1
    %38 = mux %37 [%trueResult_9, %36] {bb = 3 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %39 = mux %49#0 [%trueResult_11, %25] {bb = 3 : ui32, name = #handshake.name<"mux11">} : i1, i6
    %40 = oehb [1] %39 {bb = 3 : ui32, name = #handshake.name<"oehb2">} : i6
    %41 = tehb [1] %40 {bb = 3 : ui32, name = #handshake.name<"tehb4">} : i6
    %42:2 = fork [2] %41 {bb = 3 : ui32, name = #handshake.name<"fork6">} : i6
    %43 = arith.extsi %42#1 {bb = 3 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %44 = mux %49#1 [%trueResult_13, %26] {bb = 3 : ui32, name = #handshake.name<"mux12">} : i1, i6
    %45 = oehb [1] %44 {bb = 3 : ui32, name = #handshake.name<"oehb3">} : i6
    %46 = tehb [1] %45 {bb = 3 : ui32, name = #handshake.name<"tehb5">} : i6
    %47:2 = fork [2] %46 {bb = 3 : ui32, name = #handshake.name<"fork7">} : i6
    %48 = arith.extsi %47#1 {bb = 3 : ui32, name = #handshake.name<"extsi18">} : i6 to i13
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
    %59 = arith.muli %43, %53 {bb = 3 : ui32, name = #handshake.name<"muli4">} : i12
    %60 = arith.extsi %59 {bb = 3 : ui32, name = #handshake.name<"extsi23">} : i12 to i13
    %61 = arith.addi %33, %60 {bb = 3 : ui32, name = #handshake.name<"addi7">} : i13
    %62 = arith.extsi %61 {bb = 3 : ui32, name = #handshake.name<"extsi24">} : i13 to i32
    %addressResult, %dataResult = mc_load[%62] %memOutputs_1 {bb = 3 : ui32, name = #handshake.name<"mc_load0">} : i32, i32
    %63 = arith.muli %35, %55 {bb = 3 : ui32, name = #handshake.name<"muli5">} : i12
    %64 = arith.extsi %63 {bb = 3 : ui32, name = #handshake.name<"extsi25">} : i12 to i13
    %65 = tehb [2004] %48 {bb = 3 : ui32, name = #handshake.name<"tehb6">} : i13
    %66 = arith.addi %65, %64 {bb = 3 : ui32, name = #handshake.name<"addi8">} : i13
    %67 = arith.extsi %66 {bb = 3 : ui32, name = #handshake.name<"extsi26">} : i13 to i32
    %addressResult_7, %dataResult_8 = mc_load[%67] %memOutputs {bb = 3 : ui32, name = #handshake.name<"mc_load1">} : i32, i32
    %68 = arith.muli %dataResult, %dataResult_8 {bb = 3 : ui32, name = #handshake.name<"muli0">} : i32
    %69 = oehb [1] %38 {bb = 3 : ui32, name = #handshake.name<"oehb1">} : i32
    %70 = tehb [1] %69 {bb = 3 : ui32, name = #handshake.name<"tehb3">} : i32
    %71 = arith.addi %70, %68 {bb = 3 : ui32, name = #handshake.name<"addi0">} : i32
    %72 = arith.addi %34, %58 {bb = 3 : ui32, name = #handshake.name<"addi9">} : i7
    %73:2 = fork [2] %72 {bb = 3 : ui32, name = #handshake.name<"fork10">} : i7
    %74 = arith.trunci %73#0 {bb = 3 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %75 = arith.cmpi ult, %73#1, %54 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %76:5 = fork [5] %75 {bb = 3 : ui32, name = #handshake.name<"fork11">} : i1
    %trueResult, %falseResult = cond_br %76#0, %74 {bb = 3 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %77 = tehb [2009] %76#3 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i1
    %trueResult_9, %falseResult_10 = cond_br %77, %71 {bb = 3 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_11, %falseResult_12 = cond_br %76#1, %42#0 {bb = 3 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_13, %falseResult_14 = cond_br %76#2, %47#0 {bb = 3 : ui32, name = #handshake.name<"cond_br2">} : i6
    %78 = oehb [1] %result_5 {bb = 3 : ui32, name = #handshake.name<"oehb4">} : none
    %79 = tehb [1] %78 {bb = 3 : ui32, name = #handshake.name<"tehb7">} : none
    %trueResult_15, %falseResult_16 = cond_br %76#4, %79 {bb = 3 : ui32, name = #handshake.name<"cond_br7">} : none
    %80 = tehb [4001] %falseResult_12 {bb = 4 : ui32, name = #handshake.name<"tehb10">} : i6
    %81 = merge %80 {bb = 4 : ui32, name = #handshake.name<"merge5">} : i6
    %82:2 = fork [2] %81 {bb = 4 : ui32, name = #handshake.name<"fork12">} : i6
    %83 = arith.extsi %82#1 {bb = 4 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %84 = merge %falseResult_14 {bb = 4 : ui32, name = #handshake.name<"merge6">} : i6
    %85:2 = fork [2] %84 {bb = 4 : ui32, name = #handshake.name<"fork13">} : i6
    %86 = tehb [4001] %85#0 {bb = 4 : ui32, name = #handshake.name<"tehb12">} : i6
    %87 = arith.extsi %86 {bb = 4 : ui32, name = #handshake.name<"extsi28">} : i6 to i13
    %88 = arith.extsi %85#1 {bb = 4 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %89 = merge %falseResult_10 {bb = 4 : ui32, name = #handshake.name<"merge3">} : i32
    %90 = tehb [4001] %falseResult_16 {bb = 4 : ui32, name = #handshake.name<"tehb11">} : none
    %91 = merge %90 {bb = 4 : ui32, name = #handshake.name<"merge7">} : none
    %92:2 = fork [2] %91 {bb = 4 : ui32, name = #handshake.name<"fork14">} : none
    %93 = constant %92#1 {bb = 4 : ui32, name = #handshake.name<"constant16">, value = 1 : i2} : i2
    %94 = arith.extsi %93 {bb = 4 : ui32, name = #handshake.name<"extsi5">} : i2 to i32
    %95 = source {bb = 4 : ui32, name = #handshake.name<"source2">}
    %96 = constant %95 {bb = 4 : ui32, name = #handshake.name<"constant17">, value = 30 : i6} : i6
    %97:2 = fork [2] %96 {bb = 4 : ui32, name = #handshake.name<"fork15">} : i6
    %98 = arith.extsi %97#0 {bb = 4 : ui32, name = #handshake.name<"extsi30">} : i6 to i12
    %99 = arith.extsi %97#1 {bb = 4 : ui32, name = #handshake.name<"extsi31">} : i6 to i7
    %100 = source {bb = 4 : ui32, name = #handshake.name<"source3">}
    %101 = constant %100 {bb = 4 : ui32, name = #handshake.name<"constant18">, value = 1 : i2} : i2
    %102 = arith.extsi %101 {bb = 4 : ui32, name = #handshake.name<"extsi32">} : i2 to i7
    %103 = arith.muli %83, %98 {bb = 4 : ui32, name = #handshake.name<"muli6">} : i12
    %104 = arith.extsi %103 {bb = 4 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %105 = arith.addi %87, %104 {bb = 4 : ui32, name = #handshake.name<"addi10">} : i13
    %106 = arith.extsi %105 {bb = 4 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_17, %dataResult_18 = mc_store[%106] %89 {bb = 4 : ui32, name = #handshake.name<"mc_store0">} : i32, i32
    %107 = arith.addi %88, %102 {bb = 4 : ui32, name = #handshake.name<"addi11">} : i7
    %108 = tehb [4001] %107 {bb = 4 : ui32, name = #handshake.name<"tehb13">} : i7
    %109:2 = fork [2] %108 {bb = 4 : ui32, name = #handshake.name<"fork16">} : i7
    %110 = arith.trunci %109#0 {bb = 4 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %111 = arith.cmpi ult, %109#1, %99 {bb = 4 : ui32, name = #handshake.name<"cmpi4">} : i7
    %112:3 = fork [3] %111 {bb = 4 : ui32, name = #handshake.name<"fork17">} : i1
    %trueResult_19, %falseResult_20 = cond_br %112#0, %110 {bb = 4 : ui32, name = #handshake.name<"cond_br13">} : i6
    sink %falseResult_20 {name = #handshake.name<"sink1">} : i6
    %trueResult_21, %falseResult_22 = cond_br %112#1, %82#0 {bb = 4 : ui32, name = #handshake.name<"cond_br14">} : i6
    %trueResult_23, %falseResult_24 = cond_br %112#2, %92#0 {bb = 4 : ui32, name = #handshake.name<"cond_br10">} : none
    %113 = merge %falseResult_22 {bb = 5 : ui32, name = #handshake.name<"merge8">} : i6
    %114 = arith.extsi %113 {bb = 5 : ui32, name = #handshake.name<"extsi35">} : i6 to i7
    %115 = merge %falseResult_24 {bb = 5 : ui32, name = #handshake.name<"merge9">} : none
    %116 = source {bb = 5 : ui32, name = #handshake.name<"source4">}
    %117 = constant %116 {bb = 5 : ui32, name = #handshake.name<"constant19">, value = 30 : i6} : i6
    %118 = arith.extsi %117 {bb = 5 : ui32, name = #handshake.name<"extsi36">} : i6 to i7
    %119 = source {bb = 5 : ui32, name = #handshake.name<"source5">}
    %120 = constant %119 {bb = 5 : ui32, name = #handshake.name<"constant20">, value = 1 : i2} : i2
    %121 = arith.extsi %120 {bb = 5 : ui32, name = #handshake.name<"extsi37">} : i2 to i7
    %122 = arith.addi %114, %121 {bb = 5 : ui32, name = #handshake.name<"addi12">} : i7
    %123:2 = fork [2] %122 {bb = 5 : ui32, name = #handshake.name<"fork18">} : i7
    %124 = arith.trunci %123#0 {bb = 5 : ui32, name = #handshake.name<"trunci2">} : i7 to i6
    %125 = arith.cmpi ult, %123#1, %118 {bb = 5 : ui32, name = #handshake.name<"cmpi5">} : i7
    %126:2 = fork [2] %125 {bb = 5 : ui32, name = #handshake.name<"fork19">} : i1
    %trueResult_25, %falseResult_26 = cond_br %126#0, %124 {bb = 5 : ui32, name = #handshake.name<"cond_br15">} : i6
    sink %falseResult_26 {name = #handshake.name<"sink2">} : i6
    %trueResult_27, %falseResult_28 = cond_br %126#1, %115 {bb = 5 : ui32, name = #handshake.name<"cond_br12">} : none
    %127 = tehb [4001] %falseResult_28 {bb = 6 : ui32, name = #handshake.name<"tehb16">} : none
    %128 = merge %127 {bb = 6 : ui32, name = #handshake.name<"merge10">} : none
    %129 = return {bb = 6 : ui32, name = #handshake.name<"return1">} %128 : none
    end {bb = 6 : ui32, name = #handshake.name<"end0">} %129, %done, %done_0, %done_2 : none, none, none, none
  }
}

