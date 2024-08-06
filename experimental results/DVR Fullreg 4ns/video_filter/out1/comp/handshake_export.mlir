module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%57#2, %addressResult, %addressResult_6, %dataResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%57#1, %addressResult_12, %addressResult_14, %dataResult_15) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%57#0, %addressResult_8, %addressResult_10, %dataResult_11) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
    %0:2 = fork [2] %arg5 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %3 = mux %8#0 [%trueResult_24, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %4 = tehb [1] %8#2 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %5 = mux %4 [%trueResult_26, %arg0] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %6 = tehb [1] %8#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %7 = mux %6 [%trueResult_28, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %result, %index = control_merge %trueResult_30, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %8:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %9:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %10 = constant %9#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i6
    %12 = oehb [1] %5 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %13 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i6
    %14 = mux %51#1 [%13, %11] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %15 = oehb [1] %14 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i6
    %16:7 = fork [7] %15 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %17 = tehb [2] %16#0 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %18 = arith.extsi %17 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %19 = arith.extsi %16#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %20 = tehb [2] %16#2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %22 = tehb [2] %16#3 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %24 = tehb [2] %16#4 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %25 = arith.extsi %24 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %26 = arith.extsi %16#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %27 = arith.extsi %16#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %28 = tehb [2] %51#3 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %29 = mux %28 [%trueResult_16, %12] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %30 = oehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %31 = tehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %32:4 = fork [4] %31 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %33 = oehb [1] %7 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %34 = tehb [2] %51#2 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %35 = mux %34 [%trueResult_18, %33] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %36 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %37 = tehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %38:4 = fork [4] %37 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %39 = oehb [1] %3 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %40 = tehb [1] %51#0 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %41 = oehb [1] %trueResult_20 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i6
    %42 = tehb [1] %41 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i6
    %43 = mux %40 [%42, %39] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %44:7 = fork [7] %43 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %45 = arith.extsi %44#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %46 = arith.extsi %44#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %47 = arith.extsi %44#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %48 = arith.extsi %44#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %49 = arith.extsi %44#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %50 = arith.extsi %44#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %9#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %51:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %52 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %53 = tehb [1] %52 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : none
    %54:2 = fork [2] %53 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %55 = constant %54#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %56 = arith.extsi %55 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %57:3 = fork [3] %56 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %58 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %59 = constant %58 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %60 = arith.extsi %59 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %61:3 = fork [3] %60 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %62 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %63 = constant %62 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %64:7 = fork [7] %63 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %65 = arith.extsi %64#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %66 = arith.extsi %64#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %67 = arith.extsi %64#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %68 = arith.extsi %64#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %69 = arith.extsi %64#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %70 = arith.extsi %64#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %71 = arith.extsi %64#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %72 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %73 = constant %72 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %74 = arith.extsi %73 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %75 = arith.muli %50, %70 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %76 = arith.extsi %75 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %77 = tehb [2] %26 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %78 = arith.addi %77, %76 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%79] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %80 = arith.subi %dataResult, %32#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %81 = arith.muli %80, %38#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %82 = arith.shrsi %81, %61#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %83 = arith.muli %49, %69 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %85 = arith.addi %25, %84 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %86 = arith.extsi %85 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %87 = tehb [3] %86 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%87] %82 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %88 = arith.muli %48, %68 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %90 = arith.addi %23, %89 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %91 = arith.extsi %90 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%91] %memOutputs_2 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %92 = arith.subi %dataResult_9, %32#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %93 = arith.muli %92, %38#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %94 = arith.shrsi %93, %61#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %95 = arith.muli %47, %67 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %96 = arith.extsi %95 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %97 = arith.addi %21, %96 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %99 = tehb [3] %98 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%99] %94 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %100 = arith.muli %46, %66 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %102 = tehb [2] %19 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %103 = arith.addi %102, %101 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %104 = arith.extsi %103 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%104] %memOutputs_0 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %105 = arith.subi %dataResult_13, %32#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %106 = arith.muli %105, %38#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %107 = arith.shrsi %106, %61#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %108 = arith.muli %45, %65 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %109 = arith.extsi %108 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %110 = arith.addi %18, %109 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %111 = arith.extsi %110 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %112 = tehb [3] %111 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i32
    %addressResult_14, %dataResult_15 = mc_store[%112] %107 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %113 = arith.addi %27, %74 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %114:2 = fork [2] %113 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %115 = arith.trunci %114#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %116 = arith.cmpi ult, %114#1, %71 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %117:5 = fork [5] %116 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %117#0, %115 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %118 = oehb [1] %117#2 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i1
    %119 = tehb [2] %118 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %trueResult_16, %falseResult_17 = cond_br %119, %32#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %120 = oehb [1] %117#3 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i1
    %121 = tehb [2] %120 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_18, %falseResult_19 = cond_br %121, %38#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %117#1, %44#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %122 = oehb [1] %117#4 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i1
    %trueResult_22, %falseResult_23 = cond_br %122, %54#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %123 = oehb [1] %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"oehb12">} : i6
    %124 = arith.extsi %123 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %125 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %126 = constant %125 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %127 = arith.extsi %126 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %128 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %129 = constant %128 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %130 = arith.extsi %129 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %131 = arith.addi %124, %130 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %132 = oehb [1] %131 {bb = 3 : ui32, name = #handshake.name<"oehb13">} : i7
    %133:2 = fork [2] %132 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %134 = arith.trunci %133#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %135 = arith.cmpi ult, %133#1, %127 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %136:4 = fork [4] %135 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %136#0, %134 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %137 = tehb [1] %136#1 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : i1
    %trueResult_26, %falseResult_27 = cond_br %137, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %138 = tehb [1] %136#2 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i1
    %trueResult_28, %falseResult_29 = cond_br %138, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %136#3, %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %139 = oehb [1] %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"oehb14">} : none
    %140 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %139 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %140, %done_3, %done_1, %done : none, none, none, none
  }
}

