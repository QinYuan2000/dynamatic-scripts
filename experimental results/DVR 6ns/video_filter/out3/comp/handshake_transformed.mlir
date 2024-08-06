module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%47#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%47#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%47#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = br %11 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %19 = br %12 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %20 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %21 = br %14#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %22 = mux %43#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %23:7 = fork [7] %22 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %24 = arith.extsi %23#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %25 = arith.extsi %23#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %26 = arith.extsi %23#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %27 = arith.extsi %23#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %28 = arith.extsi %23#4 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %29 = arith.extsi %23#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %30 = arith.extsi %23#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %31 = mux %43#3 [%trueResult_16, %18] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %32:4 = fork [4] %31 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %33 = mux %43#2 [%trueResult_18, %19] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %34:4 = fork [4] %33 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %35 = mux %43#0 [%trueResult_20, %20] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %36:7 = fork [7] %35 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %37 = arith.extsi %36#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %38 = arith.extsi %36#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %39 = arith.extsi %36#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %40 = arith.extsi %36#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %41 = arith.extsi %36#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %42 = arith.extsi %36#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %21 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %43:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %44:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %45 = constant %44#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %46 = arith.extsi %45 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %47:3 = fork [3] %46 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %48 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %49 = constant %48 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %50 = arith.extsi %49 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %51:3 = fork [3] %50 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %52 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %53 = constant %52 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %54:7 = fork [7] %53 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %55 = arith.extsi %54#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %56 = arith.extsi %54#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %57 = arith.extsi %54#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %58 = arith.extsi %54#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %59 = arith.extsi %54#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %60 = arith.extsi %54#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %61 = arith.extsi %54#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %62 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %63 = constant %62 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %64 = arith.extsi %63 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %65 = arith.muli %42, %60 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %66 = arith.extsi %65 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %67 = arith.addi %29, %66 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %68 = arith.extsi %67 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%68] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %69 = arith.subi %dataResult, %32#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %70 = arith.muli %69, %34#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %71 = arith.shrsi %70, %51#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %72 = arith.muli %41, %59 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %73 = arith.extsi %72 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %74 = arith.addi %28, %73 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %75 = arith.extsi %74 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%75] %71 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %76 = arith.muli %40, %58 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %77 = arith.extsi %76 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %78 = arith.addi %27, %77 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%79] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %80 = arith.subi %dataResult_9, %32#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %81 = arith.muli %80, %34#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %82 = arith.shrsi %81, %51#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %83 = arith.muli %39, %57 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %85 = arith.addi %26, %84 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %86 = arith.extsi %85 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%86] %82 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %87 = arith.muli %38, %56 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %89 = arith.addi %25, %88 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %90 = arith.extsi %89 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%90] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %91 = arith.subi %dataResult_13, %32#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %92 = arith.muli %91, %34#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %93 = arith.shrsi %92, %51#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %94 = arith.muli %37, %55 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %96 = arith.addi %24, %95 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %97 = arith.extsi %96 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%97] %93 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %98 = arith.addi %30, %64 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %99:2 = fork [2] %98 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %100 = arith.trunci %99#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %101 = arith.cmpi ult, %99#1, %61 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %102:5 = fork [5] %101 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %102#0, %100 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %trueResult_16, %falseResult_17 = cond_br %102#2, %32#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %trueResult_18, %falseResult_19 = cond_br %102#3, %34#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %102#1, %36#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %102#4, %44#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %103 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %104 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %105 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %106 = arith.extsi %105 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %107 = merge %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %108 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %109 = constant %108 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %110 = arith.extsi %109 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %111 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %112 = constant %111 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %113 = arith.extsi %112 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %114 = arith.addi %106, %113 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %115:2 = fork [2] %114 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %116 = arith.trunci %115#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %117 = arith.cmpi ult, %115#1, %110 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %118:4 = fork [4] %117 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %118#0, %116 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %118#1, %103 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %118#2, %104 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %118#3, %107 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %119 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %120 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %119 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %120, %done_3, %done_1, %done : none, none, none, none
  }
}

