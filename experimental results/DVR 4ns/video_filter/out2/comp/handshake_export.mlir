module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%50#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%50#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%50#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %10 = oehb [1] %4 {bb = 1 : ui32, name = #handshake.name<"oehb0">} : i32
    %11 = oehb [1] %5 {bb = 1 : ui32, name = #handshake.name<"oehb1">} : i32
    %12 = mux %46#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = oehb [1] %12 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %14:7 = fork [7] %13 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %15 = tehb [2007] %14#0 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %16 = arith.extsi %15 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %17 = arith.extsi %14#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %18 = arith.extsi %14#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %19 = tehb [2005] %14#3 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %20 = arith.extsi %19 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %21 = tehb [2007] %14#4 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %23 = tehb [2005] %14#5 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %25 = arith.extsi %14#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %26 = tehb [2005] %46#3 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i1
    %27 = mux %26 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %28 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %29 = tehb [4001] %28 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i32
    %30:4 = fork [4] %29 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %31 = tehb [2005] %46#2 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i1
    %32 = mux %31 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %33 = oehb [1] %32 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %34 = tehb [4001] %33 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %35:4 = fork [4] %34 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %36 = mux %46#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %37 = oehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %38 = tehb [4001] %37 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i6
    %39:7 = fork [7] %38 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %40 = arith.extsi %39#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %41 = arith.extsi %39#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %42 = arith.extsi %39#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %43 = arith.extsi %39#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %44 = arith.extsi %39#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %45 = arith.extsi %39#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %46:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %47:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %48 = constant %47#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %49 = arith.extsi %48 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %50:3 = fork [3] %49 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %51 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %52 = constant %51 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %53 = arith.extsi %52 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %54:3 = fork [3] %53 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %55 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %56 = constant %55 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %57:7 = fork [7] %56 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %58 = arith.extsi %57#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %59 = arith.extsi %57#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %60 = arith.extsi %57#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %61 = arith.extsi %57#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %62 = arith.extsi %57#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %63 = arith.extsi %57#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %64 = arith.extsi %57#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %65 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %66 = constant %65 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %67 = arith.extsi %66 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %68 = arith.muli %45, %63 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %69 = arith.extsi %68 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %70 = arith.addi %24, %69 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %71 = arith.extsi %70 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%71] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %72 = arith.subi %dataResult, %30#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %73 = arith.muli %72, %35#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %74 = arith.shrsi %73, %54#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %75 = arith.muli %44, %62 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %76 = arith.extsi %75 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %77 = arith.addi %22, %76 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %78 = oehb [1] %77 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i13
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%79] %74 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %80 = arith.muli %43, %61 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %82 = arith.addi %20, %81 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %83 = arith.extsi %82 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%83] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %84 = arith.subi %dataResult_9, %30#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %85 = arith.muli %84, %35#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %86 = arith.shrsi %85, %54#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %87 = arith.muli %42, %60 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %89 = tehb [2007] %18 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i13
    %90 = arith.addi %89, %88 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %91 = arith.extsi %90 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %92 = oehb [1] %91 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%92] %86 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %93 = arith.muli %41, %59 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %94 = arith.extsi %93 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %95 = tehb [2005] %17 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i13
    %96 = arith.addi %95, %94 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %97 = arith.extsi %96 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%97] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %98 = arith.subi %dataResult_13, %30#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %99 = arith.muli %98, %35#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %100 = arith.shrsi %99, %54#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %101 = arith.muli %40, %58 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %102 = arith.extsi %101 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %103 = arith.addi %16, %102 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %104 = oehb [1] %103 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i13
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%105] %100 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %106 = arith.addi %25, %67 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %107 = tehb [4001] %106 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i7
    %108:2 = fork [2] %107 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %109 = arith.trunci %108#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %110 = arith.cmpi ult, %108#1, %64 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %111:5 = fork [5] %110 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %111#0, %109 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %112 = tehb [2005] %111#2 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %trueResult_16, %falseResult_17 = cond_br %112, %30#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %113 = tehb [2005] %111#3 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i1
    %trueResult_18, %falseResult_19 = cond_br %113, %35#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %111#1, %39#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %114 = oehb [1] %47#0 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %115 = tehb [4001] %114 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : none
    %trueResult_22, %falseResult_23 = cond_br %111#4, %115 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %116 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %117 = oehb [1] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"oehb10">} : none
    %118 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %119 = constant %118 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %120 = arith.extsi %119 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %121 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %122 = constant %121 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %123 = arith.extsi %122 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %124 = arith.addi %116, %123 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %125 = oehb [1] %124 {bb = 3 : ui32, name = #handshake.name<"oehb11">} : i7
    %126:2 = fork [2] %125 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %127 = arith.trunci %126#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %128 = arith.cmpi ult, %126#1, %120 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %129 = oehb [1] %128 {bb = 3 : ui32, name = #handshake.name<"oehb13">} : i1
    %130:4 = fork [4] %129 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %131 = oehb [1] %127 {bb = 3 : ui32, name = #handshake.name<"oehb12">} : i6
    %trueResult_24, %falseResult_25 = cond_br %130#0, %131 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %130#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %130#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %130#3, %117 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %132 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %132, %done_3, %done_1, %done : none, none, none, none
  }
}

