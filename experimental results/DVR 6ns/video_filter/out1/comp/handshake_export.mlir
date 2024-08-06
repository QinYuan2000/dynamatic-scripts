module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%48#2, %addressResult, %addressResult_6, %dataResult_7) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%48#1, %addressResult_12, %addressResult_14, %dataResult_15) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%48#0, %addressResult_8, %addressResult_10, %dataResult_11) {bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
    %0:2 = fork [2] %arg5 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %3 = mux %8#0 [%trueResult_24, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %4 = tehb [2] %8#2 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i1
    %5 = mux %4 [%trueResult_26, %arg0] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %6 = tehb [2] %8#1 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i1
    %7 = mux %6 [%trueResult_28, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %result, %index = control_merge %trueResult_30, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %8:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %9:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %10 = constant %9#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %11 = arith.extsi %10 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i6
    %12 = mux %44#1 [%trueResult, %11] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13:7 = fork [7] %12 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %14 = tehb [4] %13#0 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %15 = arith.extsi %14 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %16 = tehb [4] %13#1 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %18 = tehb [4] %13#2 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %19 = arith.extsi %18 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %20 = arith.extsi %13#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %21 = tehb [4] %13#4 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %23 = tehb [4] %13#5 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i6
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %25 = arith.extsi %13#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %26 = tehb [4] %44#3 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %27 = mux %26 [%trueResult_16, %5] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %28 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i32
    %29 = tehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %30:4 = fork [4] %29 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %31 = tehb [4] %44#2 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %32 = mux %31 [%trueResult_18, %7] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %33 = oehb [1] %32 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %34 = tehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %35:4 = fork [4] %34 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %36 = mux %44#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %37:7 = fork [7] %36 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %38 = arith.extsi %37#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %39 = arith.extsi %37#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %40 = arith.extsi %37#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %41 = arith.extsi %37#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %42 = arith.extsi %37#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %43 = arith.extsi %37#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %9#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %44:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %45:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %46 = constant %45#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %47 = arith.extsi %46 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %48:3 = fork [3] %47 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %49 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %50 = constant %49 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %51 = arith.extsi %50 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %52:3 = fork [3] %51 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %53 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %54 = constant %53 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %55:7 = fork [7] %54 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %56 = arith.extsi %55#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %57 = arith.extsi %55#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %58 = arith.extsi %55#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %59 = arith.extsi %55#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %60 = arith.extsi %55#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %61 = arith.extsi %55#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %62 = tehb [1] %55#6 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i6
    %63 = arith.extsi %62 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %64 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %65 = constant %64 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %67 = arith.muli %43, %61 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %68 = arith.extsi %67 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %69 = arith.addi %24, %68 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %70 = arith.extsi %69 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%70] %memOutputs {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %71 = arith.subi %dataResult, %30#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %72 = arith.muli %71, %35#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %73 = arith.shrsi %72, %52#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %74 = arith.muli %42, %60 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %75 = arith.extsi %74 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %76 = arith.addi %22, %75 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %77 = tehb [5] %76 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i13
    %78 = arith.extsi %77 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%78] %73 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %79 = arith.muli %41, %59 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %80 = arith.extsi %79 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %81 = tehb [4] %20 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %82 = arith.addi %81, %80 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %83 = arith.extsi %82 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%83] %memOutputs_2 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %84 = arith.subi %dataResult_9, %30#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %85 = arith.muli %84, %35#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %86 = arith.shrsi %85, %52#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %87 = arith.muli %40, %58 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %89 = arith.addi %19, %88 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %90 = tehb [5] %89 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i13
    %91 = arith.extsi %90 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%91] %86 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %92 = arith.muli %39, %57 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %94 = arith.addi %17, %93 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%95] %memOutputs_0 {bb = 2 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %96 = arith.subi %dataResult_13, %30#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %97 = arith.muli %96, %35#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %98 = arith.shrsi %97, %52#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %99 = arith.muli %38, %56 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %100 = arith.extsi %99 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %101 = arith.addi %15, %100 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %102 = arith.extsi %101 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %103 = tehb [5] %102 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i32
    %addressResult_14, %dataResult_15 = mc_store[%103] %98 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %104 = arith.addi %25, %66 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %105 = oehb [1] %104 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i7
    %106 = tehb [1] %105 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i7
    %107:2 = fork [2] %106 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %108 = arith.trunci %107#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %109 = arith.cmpi ult, %107#1, %63 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %110:5 = fork [5] %109 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %110#0, %108 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %111 = oehb [1] %110#2 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i1
    %112 = tehb [4] %111 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_16, %falseResult_17 = cond_br %112, %30#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %113 = oehb [1] %110#3 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i1
    %114 = tehb [4] %113 {bb = 2 : ui32, name = #handshake.name<"tehb20">} : i1
    %trueResult_18, %falseResult_19 = cond_br %114, %35#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %115 = oehb [1] %37#0 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %116 = tehb [1] %115 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i6
    %trueResult_20, %falseResult_21 = cond_br %110#1, %116 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %117 = oehb [1] %45#0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : none
    %118 = tehb [1] %117 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : none
    %trueResult_22, %falseResult_23 = cond_br %110#4, %118 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %119 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %120 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %121 = constant %120 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %122 = arith.extsi %121 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %123 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %124 = constant %123 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %125 = arith.extsi %124 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %126 = arith.addi %119, %125 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %127 = oehb [1] %126 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i7
    %128:2 = fork [2] %127 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %129 = arith.trunci %128#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %130 = arith.cmpi ult, %128#1, %122 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %131:4 = fork [4] %130 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %131#0, %129 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %132 = tehb [2] %131#1 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i1
    %trueResult_26, %falseResult_27 = cond_br %132, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %133 = tehb [2] %131#2 {bb = 3 : ui32, name = #handshake.name<"tehb22">} : i1
    %trueResult_28, %falseResult_29 = cond_br %133, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %134 = oehb [1] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : none
    %trueResult_30, %falseResult_31 = cond_br %131#3, %134 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %135 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, name = #handshake.name<"end1">} %135, %done_3, %done_1, %done : none, none, none, none
  }
}

