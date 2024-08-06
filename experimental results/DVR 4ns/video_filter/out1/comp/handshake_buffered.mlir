module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%69#2, %addressResult, %addressResult_6, %dataResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%69#1, %addressResult_12, %addressResult_14, %dataResult_15) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%69#0, %addressResult_8, %addressResult_10, %dataResult_11) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %10 = mux %15#0 [%trueResult_24, %6] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %11 = tehb [1] %15#2 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %12 = mux %11 [%trueResult_26, %7] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %13 = tehb [1] %15#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %14 = mux %13 [%trueResult_28, %8] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %result, %index = control_merge %trueResult_30, %9 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %15:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %16:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %17 = constant %16#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %18 = br %17 {bb = 1 : ui32, name = #handshake.name<"br1">} : i1
    %19 = arith.extsi %18 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i6
    %20 = oehb [1] %12 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %21 = br %20 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %22 = br %14 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %23 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %24 = br %16#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %25 = oehb [1] %trueResult {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i6
    %26 = mux %63#1 [%25, %19] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %27 = oehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i6
    %28:7 = fork [7] %27 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %29 = tehb [2] %28#0 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %31 = arith.extsi %28#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %32 = tehb [2] %28#2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %33 = arith.extsi %32 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %34 = tehb [2] %28#3 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %35 = arith.extsi %34 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %36 = tehb [2] %28#4 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %37 = arith.extsi %36 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %38 = arith.extsi %28#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %39 = arith.extsi %28#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %40 = tehb [2] %63#3 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %41 = mux %40 [%trueResult_16, %21] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %42 = oehb [1] %41 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %43 = tehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %44:4 = fork [4] %43 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %45 = oehb [1] %22 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %46 = tehb [2] %63#2 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %47 = mux %46 [%trueResult_18, %45] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %48 = oehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i32
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %50:4 = fork [4] %49 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %51 = oehb [1] %23 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %52 = tehb [1] %63#0 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %53 = oehb [1] %trueResult_20 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i6
    %54 = tehb [1] %53 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i6
    %55 = mux %52 [%54, %51] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %56:7 = fork [7] %55 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %57 = arith.extsi %56#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %58 = arith.extsi %56#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %59 = arith.extsi %56#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %60 = arith.extsi %56#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %61 = arith.extsi %56#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %62 = arith.extsi %56#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %24 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %63:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %64 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %65 = tehb [1] %64 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : none
    %66:2 = fork [2] %65 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %67 = constant %66#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %68 = arith.extsi %67 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %69:3 = fork [3] %68 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %70 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %71 = constant %70 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %72 = arith.extsi %71 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %73:3 = fork [3] %72 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %74 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %75 = constant %74 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %76:7 = fork [7] %75 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %77 = arith.extsi %76#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %78 = arith.extsi %76#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %79 = arith.extsi %76#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %80 = arith.extsi %76#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %81 = arith.extsi %76#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %82 = arith.extsi %76#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %83 = arith.extsi %76#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %84 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %85 = constant %84 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %86 = arith.extsi %85 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %87 = arith.muli %62, %82 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %89 = tehb [2] %38 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %90 = arith.addi %89, %88 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %91 = arith.extsi %90 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%91] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %92 = arith.subi %dataResult, %44#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %93 = arith.muli %92, %50#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %94 = arith.shrsi %93, %73#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %95 = arith.muli %61, %81 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %96 = arith.extsi %95 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %97 = arith.addi %37, %96 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %99 = tehb [3] %98 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%99] %94 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %100 = arith.muli %60, %80 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %102 = arith.addi %35, %101 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %103 = arith.extsi %102 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%103] %memOutputs_2 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %104 = arith.subi %dataResult_9, %44#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %105 = arith.muli %104, %50#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %106 = arith.shrsi %105, %73#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %107 = arith.muli %59, %79 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %108 = arith.extsi %107 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %109 = arith.addi %33, %108 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %110 = arith.extsi %109 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %111 = tehb [3] %110 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%111] %106 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %112 = arith.muli %58, %78 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %113 = arith.extsi %112 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %114 = tehb [2] %31 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %115 = arith.addi %114, %113 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %116 = arith.extsi %115 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%116] %memOutputs_0 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %117 = arith.subi %dataResult_13, %44#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %118 = arith.muli %117, %50#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %119 = arith.shrsi %118, %73#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %120 = arith.muli %57, %77 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %121 = arith.extsi %120 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %122 = arith.addi %30, %121 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %123 = arith.extsi %122 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %124 = tehb [3] %123 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i32
    %addressResult_14, %dataResult_15 = mc_store[%124] %119 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %125 = arith.addi %39, %86 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %126:2 = fork [2] %125 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %127 = arith.trunci %126#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %128 = arith.cmpi ult, %126#1, %83 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %129:5 = fork [5] %128 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %129#0, %127 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %130 = oehb [1] %129#2 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i1
    %131 = tehb [2] %130 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %trueResult_16, %falseResult_17 = cond_br %131, %44#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %132 = oehb [1] %129#3 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i1
    %133 = tehb [2] %132 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_18, %falseResult_19 = cond_br %133, %50#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %129#1, %56#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %134 = oehb [1] %129#4 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i1
    %trueResult_22, %falseResult_23 = cond_br %134, %66#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %135 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %136 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %137 = oehb [1] %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"oehb12">} : i6
    %138 = merge %137 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %139 = arith.extsi %138 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %140 = merge %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %141 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %142 = constant %141 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %143 = arith.extsi %142 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %144 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %145 = constant %144 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %146 = arith.extsi %145 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %147 = arith.addi %139, %146 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %148 = oehb [1] %147 {bb = 3 : ui32, name = #handshake.name<"oehb13">} : i7
    %149:2 = fork [2] %148 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %150 = arith.trunci %149#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %151 = arith.cmpi ult, %149#1, %143 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %152:4 = fork [4] %151 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %152#0, %150 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %153 = tehb [1] %152#1 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : i1
    %trueResult_26, %falseResult_27 = cond_br %153, %135 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %154 = tehb [1] %152#2 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i1
    %trueResult_28, %falseResult_29 = cond_br %154, %136 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %152#3, %140 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %155 = oehb [1] %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"oehb14">} : none
    %156 = merge %155 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %157 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %156 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %157, %done_3, %done_1, %done : none, none, none, none
  }
}

