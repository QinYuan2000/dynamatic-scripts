module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%48#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%48#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%48#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
    %0:2 = fork [2] %arg5 {bb = 0 : ui32, name = #handshake.name<"fork0">} : none
    %1 = constant %0#1 {bb = 0 : ui32, name = #handshake.name<"constant0">, value = false} : i1
    %2 = arith.extsi %1 {bb = 0 : ui32, name = #handshake.name<"extsi8">} : i1 to i6
    %3 = mux %6#0 [%trueResult_24, %2] {bb = 1 : ui32, name = #handshake.name<"mux7">} : i1, i6
    %4 = mux %6#2 [%trueResult_26, %arg0] {bb = 1 : ui32, name = #handshake.name<"mux1">} : i1, i32
    %5 = mux %6#1 [%trueResult_28, %arg1] {bb = 1 : ui32, name = #handshake.name<"mux2">} : i1, i32
    %result, %index = control_merge %trueResult_30, %0#0 {bb = 1 : ui32, name = #handshake.name<"control_merge4">} : none, i1
    %6:3 = fork [3] %index {bb = 1 : ui32, name = #handshake.name<"fork1">} : i1
    %7:2 = fork [2] %result {bb = 1 : ui32, name = #handshake.name<"fork2">} : none
    %8 = constant %7#0 {bb = 1 : ui32, name = #handshake.name<"constant1">, value = false} : i1
    %9 = arith.extsi %8 {bb = 1 : ui32, name = #handshake.name<"extsi9">} : i1 to i6
    %10 = tehb [3001] %4 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %11 = tehb [3001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %12 = mux %44#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = tehb [3001] %12 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %14:7 = fork [7] %13 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %15 = arith.extsi %14#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %16 = oehb [1] %14#1 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %17 = tehb [1] %16 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %18 = arith.extsi %17 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %19 = arith.extsi %14#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %20 = arith.extsi %14#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %21 = arith.extsi %14#4 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %22 = arith.extsi %14#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %23 = arith.extsi %14#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %24 = oehb [1] %44#3 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i1
    %25 = tehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i1
    %26 = mux %25 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %27 = oehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %28 = tehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %29:4 = fork [4] %28 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %30 = oehb [1] %44#2 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i1
    %31 = tehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %32 = mux %31 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %33 = oehb [1] %32 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %34 = tehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %35:4 = fork [4] %34 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %36 = mux %44#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %37:7 = fork [7] %36 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %38 = arith.extsi %37#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %39 = arith.extsi %37#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %40 = arith.extsi %37#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %41 = arith.extsi %37#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %42 = arith.extsi %37#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %43 = arith.extsi %37#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
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
    %62 = tehb [3001] %55#6 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i6
    %63 = arith.extsi %62 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %64 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %65 = constant %64 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %66 = arith.extsi %65 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %67 = arith.muli %43, %61 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %68 = arith.extsi %67 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %69 = oehb [1] %22 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %70 = tehb [1] %69 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %71 = arith.addi %70, %68 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %72 = arith.extsi %71 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%72] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %73 = arith.subi %dataResult, %29#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %74 = arith.muli %73, %35#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %75 = arith.shrsi %74, %52#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %76 = arith.muli %42, %60 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %77 = arith.extsi %76 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %78 = oehb [4003] %21 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %79 = arith.addi %78, %77 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %80 = tehb [3001] %79 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i13
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%81] %75 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %82 = arith.muli %41, %59 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %83 = arith.extsi %82 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %84 = oehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %85 = tehb [1] %84 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i13
    %86 = arith.addi %85, %83 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %87 = arith.extsi %86 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%87] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %88 = arith.subi %dataResult_9, %29#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %89 = arith.muli %88, %35#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %90 = arith.shrsi %89, %52#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %91 = arith.muli %40, %58 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %92 = arith.extsi %91 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %93 = oehb [4002] %19 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %94 = arith.addi %93, %92 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %96 = oehb [1] %95 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : i32
    %97 = tehb [1] %96 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%97] %90 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %98 = arith.muli %39, %57 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %99 = arith.extsi %98 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %100 = arith.addi %18, %99 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%101] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %102 = arith.subi %dataResult_13, %29#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %103 = arith.muli %102, %35#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %104 = arith.shrsi %103, %52#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %105 = arith.muli %38, %56 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %106 = arith.extsi %105 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %107 = oehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %108 = tehb [1] %107 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i13
    %109 = arith.addi %108, %106 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %110 = oehb [4002] %109 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i13
    %111 = arith.extsi %110 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%111] %104 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %112 = arith.addi %23, %66 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %113:2 = fork [2] %112 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %114 = tehb [3001] %113#0 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i7
    %115 = arith.trunci %114 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %116 = arith.cmpi ult, %113#1, %63 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %117 = tehb [3001] %116 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %118:5 = fork [5] %117 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %118#0, %115 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %119 = oehb [1] %118#2 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i1
    %120 = tehb [1] %119 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %120, %29#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %121 = oehb [1] %118#3 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i1
    %122 = tehb [1] %121 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %122, %35#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %123 = oehb [1] %37#0 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %124 = tehb [1] %123 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i6
    %trueResult_20, %falseResult_21 = cond_br %118#1, %124 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %125 = oehb [1] %45#0 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : none
    %126 = tehb [1] %125 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : none
    %trueResult_22, %falseResult_23 = cond_br %118#4, %126 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %127 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %128 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %129 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %130 = constant %129 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %131 = arith.extsi %130 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %132 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %133 = constant %132 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %134 = arith.extsi %133 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %135 = arith.addi %127, %134 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %136:2 = fork [2] %135 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %137 = arith.trunci %136#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %138 = arith.cmpi ult, %136#1, %131 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %139 = tehb [3001] %138 {bb = 3 : ui32, name = #handshake.name<"tehb22">} : i1
    %140:4 = fork [4] %139 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %141 = tehb [3001] %137 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i6
    %trueResult_24, %falseResult_25 = cond_br %140#0, %141 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %140#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %140#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %140#3, %128 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %142 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %142, %done_3, %done_1, %done : none, none, none, none
  }
}

