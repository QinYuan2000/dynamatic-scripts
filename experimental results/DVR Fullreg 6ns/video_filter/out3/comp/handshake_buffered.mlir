module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%58#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%58#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%58#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = tehb [3001] %11 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %19 = br %18 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %20 = tehb [3001] %12 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %21 = br %20 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %22 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %23 = br %14#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %24 = mux %54#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %25 = oehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %26 = tehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %27:7 = fork [7] %26 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %28 = arith.extsi %27#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %29 = arith.extsi %27#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %30 = arith.extsi %27#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %31 = arith.extsi %27#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %32 = oehb [4003] %27#4 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %34 = arith.extsi %27#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %35 = arith.extsi %27#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %36 = oehb [4004] %54#3 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i1
    %37 = mux %36 [%trueResult_16, %19] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %38 = oehb [1] %37 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %39 = tehb [1] %38 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %40:4 = fork [4] %39 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %41 = oehb [4004] %54#2 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i1
    %42 = mux %41 [%trueResult_18, %21] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %43 = oehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %44 = tehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %45:4 = fork [4] %44 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %46 = mux %54#0 [%trueResult_20, %22] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %47:7 = fork [7] %46 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %48 = arith.extsi %47#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %49 = arith.extsi %47#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %50 = arith.extsi %47#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %51 = arith.extsi %47#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %52 = arith.extsi %47#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %53 = arith.extsi %47#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %23 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %54:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %55:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %56 = constant %55#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %57 = arith.extsi %56 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %58:3 = fork [3] %57 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %59 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %60 = constant %59 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %61 = arith.extsi %60 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %62:3 = fork [3] %61 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %63 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %64 = constant %63 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %65:7 = fork [7] %64 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %66 = arith.extsi %65#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %67 = arith.extsi %65#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %68 = arith.extsi %65#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %69 = arith.extsi %65#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %70 = arith.extsi %65#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %71 = arith.extsi %65#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %72 = arith.extsi %65#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %73 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %74 = constant %73 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %75 = arith.extsi %74 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %76 = arith.muli %53, %71 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %77 = arith.extsi %76 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %78 = oehb [4003] %34 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i13
    %79 = arith.addi %78, %77 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %80 = arith.extsi %79 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%80] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %81 = arith.subi %dataResult, %40#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %82 = arith.muli %81, %45#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %83 = arith.shrsi %82, %62#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %84 = arith.muli %52, %70 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %85 = arith.extsi %84 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %86 = arith.addi %33, %85 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %87 = oehb [4005] %86 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i13
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%88] %83 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %89 = arith.muli %51, %69 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %90 = arith.extsi %89 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %91 = oehb [4003] %31 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %92 = arith.addi %91, %90 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%93] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %94 = arith.subi %dataResult_9, %40#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %95 = arith.muli %94, %45#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %96 = arith.shrsi %95, %62#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %97 = arith.muli %50, %68 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %99 = oehb [4003] %30 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %100 = arith.addi %99, %98 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %101 = oehb [4005] %100 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i13
    %102 = arith.extsi %101 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%102] %96 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %103 = arith.muli %49, %67 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %104 = arith.extsi %103 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %105 = oehb [4003] %29 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %106 = arith.addi %105, %104 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %107 = arith.extsi %106 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%107] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %108 = arith.subi %dataResult_13, %40#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %109 = arith.muli %108, %45#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %110 = arith.shrsi %109, %62#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %111 = arith.muli %48, %66 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %112 = arith.extsi %111 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %113 = oehb [4003] %28 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %114 = arith.addi %113, %112 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %115 = oehb [4005] %114 {bb = 2 : ui32, name = #handshake.name<"oehb16">} : i13
    %116 = arith.extsi %115 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%116] %110 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %117 = arith.addi %35, %75 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %118:2 = fork [2] %117 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %119 = arith.trunci %118#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %120 = oehb [1] %72 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i7
    %121 = tehb [1] %120 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i7
    %122 = arith.cmpi ult, %118#1, %121 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %123:5 = fork [5] %122 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %123#0, %119 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %124 = oehb [4004] %123#2 {bb = 2 : ui32, name = #handshake.name<"oehb17">} : i1
    %trueResult_16, %falseResult_17 = cond_br %124, %40#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %125 = oehb [4004] %123#3 {bb = 2 : ui32, name = #handshake.name<"oehb18">} : i1
    %trueResult_18, %falseResult_19 = cond_br %125, %45#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %126 = oehb [1] %47#0 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i6
    %127 = tehb [1] %126 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_20, %falseResult_21 = cond_br %123#1, %127 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %128 = oehb [1] %55#0 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : none
    %129 = tehb [1] %128 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %trueResult_22, %falseResult_23 = cond_br %123#4, %129 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %130 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %131 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %132 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %133 = arith.extsi %132 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %134 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : none
    %135 = merge %134 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %136 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %137 = constant %136 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %138 = arith.extsi %137 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %139 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %140 = constant %139 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %141 = arith.extsi %140 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %142 = arith.addi %133, %141 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %143 = tehb [3001] %142 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i7
    %144:2 = fork [2] %143 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %145 = arith.trunci %144#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %146 = arith.cmpi ult, %144#1, %138 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %147:4 = fork [4] %146 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %147#0, %145 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %147#1, %130 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %147#2, %131 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %147#3, %135 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %148 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %149 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %148 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %149, %done_3, %done_1, %done : none, none, none, none
  }
}

