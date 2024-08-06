module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%53#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%53#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%53#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %12 = mux %47#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = tehb [3001] %12 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %14:7 = fork [7] %13 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %15 = oehb [1] %14#0 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %16 = tehb [1] %15 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %18 = arith.extsi %14#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %19 = arith.extsi %14#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %20 = oehb [1] %14#3 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %21 = tehb [1] %20 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %23 = oehb [4002] %14#4 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %25 = arith.extsi %14#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %26 = arith.extsi %14#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %27 = oehb [1] %47#3 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i1
    %28 = tehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %29 = mux %28 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %30 = oehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %31 = tehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %32:4 = fork [4] %31 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %33 = oehb [1] %47#2 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i1
    %34 = tehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %35 = mux %34 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %36 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %37 = tehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %38:4 = fork [4] %37 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %39 = mux %47#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %40:7 = fork [7] %39 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %41 = arith.extsi %40#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %42 = arith.extsi %40#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %43 = arith.extsi %40#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %44 = arith.extsi %40#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %45 = arith.extsi %40#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %46 = arith.extsi %40#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %47:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %48 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : none
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : none
    %50:2 = fork [2] %49 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %51 = constant %50#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %52 = arith.extsi %51 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %53:3 = fork [3] %52 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %54 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %55 = constant %54 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %56 = arith.extsi %55 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %57:3 = fork [3] %56 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %58 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %59 = constant %58 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %60:7 = fork [7] %59 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %61 = arith.extsi %60#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %62 = arith.extsi %60#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %63 = arith.extsi %60#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %64 = arith.extsi %60#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %65 = arith.extsi %60#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %66 = arith.extsi %60#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %67 = arith.extsi %60#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %68 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %69 = constant %68 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %70 = arith.extsi %69 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %71 = arith.muli %46, %66 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %72 = arith.extsi %71 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %73 = oehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %74 = tehb [1] %73 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %75 = arith.addi %74, %72 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %76 = arith.extsi %75 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%76] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %77 = arith.subi %dataResult, %32#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %78 = arith.muli %77, %38#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %79 = arith.shrsi %78, %57#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %80 = arith.muli %45, %65 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %82 = arith.addi %24, %81 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %83 = arith.extsi %82 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %84 = oehb [1] %83 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : i32
    %85 = tehb [1] %84 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%85] %79 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %86 = arith.muli %44, %64 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %87 = arith.extsi %86 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %88 = arith.addi %22, %87 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%89] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %90 = arith.subi %dataResult_9, %32#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %91 = arith.muli %90, %38#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %92 = arith.shrsi %91, %57#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %93 = arith.muli %43, %63 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %94 = arith.extsi %93 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %95 = oehb [1] %19 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %96 = tehb [1] %95 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %97 = arith.addi %96, %94 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %98 = oehb [4002] %97 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i13
    %99 = arith.extsi %98 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%99] %92 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %100 = arith.muli %42, %62 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %102 = oehb [1] %18 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %103 = tehb [1] %102 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i13
    %104 = arith.addi %103, %101 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%105] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %106 = arith.subi %dataResult_13, %32#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %107 = arith.muli %106, %38#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %108 = arith.shrsi %107, %57#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %109 = arith.muli %41, %61 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %110 = arith.extsi %109 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %111 = arith.addi %17, %110 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %112 = oehb [4002] %111 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i13
    %113 = arith.extsi %112 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%113] %108 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %114 = arith.addi %26, %70 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %115:2 = fork [2] %114 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %116 = arith.trunci %115#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %117 = tehb [3001] %67 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i7
    %118 = arith.cmpi ult, %115#1, %117 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %119 = tehb [3001] %118 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %120:5 = fork [5] %119 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %121 = tehb [3001] %116 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i6
    %trueResult, %falseResult = cond_br %120#0, %121 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %122 = oehb [1] %120#2 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i1
    %123 = tehb [1] %122 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %123, %32#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %124 = oehb [1] %120#3 {bb = 2 : ui32, name = #handshake.name<"oehb16">} : i1
    %125 = tehb [1] %124 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %125, %38#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %126 = oehb [1] %40#0 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %127 = tehb [1] %126 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i6
    %trueResult_20, %falseResult_21 = cond_br %120#1, %127 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %120#4, %50#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %128 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %129 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %130 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %131 = constant %130 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %132 = arith.extsi %131 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %133 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %134 = constant %133 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %135 = arith.extsi %134 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %136 = arith.addi %128, %135 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %137:2 = fork [2] %136 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %138 = tehb [3001] %137#0 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i7
    %139 = arith.trunci %138 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %140 = arith.cmpi ult, %137#1, %132 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %141 = tehb [3001] %140 {bb = 3 : ui32, name = #handshake.name<"tehb22">} : i1
    %142:4 = fork [4] %141 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %142#0, %139 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %142#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %142#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %142#3, %129 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %143 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %143, %done_3, %done_1, %done : none, none, none, none
  }
}

