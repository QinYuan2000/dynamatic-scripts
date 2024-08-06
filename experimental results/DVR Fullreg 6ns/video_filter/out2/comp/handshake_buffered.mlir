module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%67#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%67#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%67#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
    %0 = merge %arg0 {bb = 0 : ui32, name = #handshake.name<"merge0">} : i32
    %1 = merge %arg1 {bb = 0 : ui32, name = #handshake.name<"merge1">} : i32
    %2 = merge %arg5 {bb = 0 : ui32, name = #handshake.name<"merge2">} : none
    %3:2 = fork [2] %2 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %4 = constant %3#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %5 = br %4 {bb = 0 : ui32, name = #handshake.name<"br0">} : i1
    %6 = arith.extsi %5 {bb = 0 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %7 = br %0 {bb = 0 : ui32, name = #handshake.name<"br3">} : i32
    %8 = br %1 {bb = 0 : ui32, name = #handshake.name<"br4">} : i32
    %9 = br %3#0 {bb = 0 : ui32, name = #handshake.name<"br5">} : none
    %10 = mux %13#0 [%trueResult_24, %6] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %11 = mux %13#2 [%trueResult_26, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %12 = mux %13#1 [%trueResult_28, %8] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %result, %index = control_merge %trueResult_30, %9 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %13:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %14:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %15 = constant %14#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %16 = br %15 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %17 = arith.extsi %16 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i6
    %18 = oehb [1] %11 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %19 = br %18 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %20 = oehb [1] %12 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %21 = br %20 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %22 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %23 = br %14#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %24 = mux %61#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %25 = oehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %26 = tehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %27:7 = fork [7] %26 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %28 = tehb [2004] %27#0 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %30 = tehb [2004] %27#1 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %31 = arith.extsi %30 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %32 = tehb [2004] %27#2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %34 = tehb [2004] %27#3 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %36 = tehb [2004] %27#4 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %38 = tehb [2004] %27#5 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i6
    %39 = arith.extsi %38 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %40 = arith.extsi %27#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %41 = tehb [2005] %61#3 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %42 = mux %41 [%trueResult_16, %19] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %43 = oehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %44 = tehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %45:4 = fork [4] %44 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %46 = tehb [2005] %61#2 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %47 = mux %46 [%trueResult_18, %21] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %48 = oehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %50:4 = fork [4] %49 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %51 = mux %61#0 [%trueResult_20, %22] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %52 = oehb [1] %51 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %53 = tehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i6
    %54:7 = fork [7] %53 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %55 = arith.extsi %54#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %56 = arith.extsi %54#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %57 = arith.extsi %54#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %58 = arith.extsi %54#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %59 = arith.extsi %54#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %60 = arith.extsi %54#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %23 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %61:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %62 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %63 = tehb [1] %62 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : none
    %64:2 = fork [2] %63 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %65 = constant %64#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %67:3 = fork [3] %66 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %68 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %69 = constant %68 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %70 = arith.extsi %69 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %71:3 = fork [3] %70 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %72 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %73 = constant %72 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %74:7 = fork [7] %73 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %75 = arith.extsi %74#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %76 = arith.extsi %74#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %77 = arith.extsi %74#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %78 = arith.extsi %74#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %79 = arith.extsi %74#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %80 = arith.extsi %74#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %81 = arith.extsi %74#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %82 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %83 = constant %82 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %85 = arith.muli %60, %80 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %86 = arith.extsi %85 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %87 = arith.addi %39, %86 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%88] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %89 = arith.subi %dataResult, %45#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %90 = arith.muli %89, %50#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %91 = arith.shrsi %90, %71#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %92 = arith.muli %59, %79 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %94 = arith.addi %37, %93 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %96 = tehb [2005] %95 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%96] %91 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %97 = arith.muli %58, %78 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %99 = arith.addi %35, %98 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %100 = arith.extsi %99 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%100] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %101 = arith.subi %dataResult_9, %45#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %102 = arith.muli %101, %50#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %103 = arith.shrsi %102, %71#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %104 = arith.muli %57, %77 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %106 = arith.addi %33, %105 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %107 = arith.extsi %106 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %108 = tehb [2005] %107 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%108] %103 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %109 = arith.muli %56, %76 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %110 = arith.extsi %109 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %111 = arith.addi %31, %110 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %112 = arith.extsi %111 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%112] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %113 = arith.subi %dataResult_13, %45#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %114 = arith.muli %113, %50#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %115 = arith.shrsi %114, %71#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %116 = arith.muli %55, %75 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %117 = arith.extsi %116 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %118 = arith.addi %29, %117 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %119 = tehb [2005] %118 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i13
    %120 = arith.extsi %119 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%120] %115 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %121 = arith.addi %40, %84 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %122:2 = fork [2] %121 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %123 = arith.trunci %122#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %124 = arith.cmpi ult, %122#1, %81 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %125:5 = fork [5] %124 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %125#0, %123 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %126 = tehb [2005] %125#2 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i1
    %trueResult_16, %falseResult_17 = cond_br %126, %45#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %127 = tehb [2005] %125#3 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %trueResult_18, %falseResult_19 = cond_br %127, %50#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %125#1, %54#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %125#4, %64#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %128 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %129 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %130 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %131 = arith.extsi %130 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %132 = oehb [1] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : none
    %133 = merge %132 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %134 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %135 = constant %134 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %136 = arith.extsi %135 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %137 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %138 = constant %137 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %139 = arith.extsi %138 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %140 = arith.addi %131, %139 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %141 = oehb [1] %140 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i7
    %142:2 = fork [2] %141 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %143 = arith.trunci %142#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %144 = arith.cmpi ult, %142#1, %136 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %145:4 = fork [4] %144 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %145#0, %143 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %145#1, %128 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %145#2, %129 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %145#3, %133 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %146 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %147 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %146 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %147, %done_3, %done_1, %done : none, none, none, none
  }
}

