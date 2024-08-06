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
    %12 = mux %42#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = oehb [1] %12 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %14 = tehb [1] %13 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %15:7 = fork [7] %14 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %16 = oehb [4003] %15#0 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %18 = arith.extsi %15#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %19 = arith.extsi %15#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %20 = arith.extsi %15#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %21 = arith.extsi %15#4 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %22 = arith.extsi %15#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %23 = arith.extsi %15#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %24 = oehb [4004] %42#3 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i1
    %25 = mux %24 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %26 = oehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %27 = tehb [1] %26 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i32
    %28:4 = fork [4] %27 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %29 = oehb [4004] %42#2 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : i1
    %30 = mux %29 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %31 = oehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i32
    %32 = tehb [1] %31 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i32
    %33:4 = fork [4] %32 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %34 = mux %42#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %35:7 = fork [7] %34 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %36 = arith.extsi %35#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %37 = arith.extsi %35#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %38 = arith.extsi %35#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %39 = arith.extsi %35#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %40 = arith.extsi %35#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %41 = arith.extsi %35#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %42:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %43 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : none
    %44 = tehb [1] %43 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : none
    %45:2 = fork [2] %44 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
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
    %62 = arith.extsi %55#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %63 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %64 = constant %63 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %65 = arith.extsi %64 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %66 = arith.muli %41, %61 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %67 = arith.extsi %66 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %68 = oehb [4003] %22 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i13
    %69 = arith.addi %68, %67 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %70 = arith.extsi %69 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%70] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %71 = arith.subi %dataResult, %28#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %72 = arith.muli %71, %33#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %73 = arith.shrsi %72, %52#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %74 = arith.muli %40, %60 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %75 = arith.extsi %74 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %76 = oehb [4003] %21 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %77 = arith.addi %76, %75 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %78 = oehb [4005] %77 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i13
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%79] %73 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %80 = arith.muli %39, %59 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %82 = oehb [4003] %20 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %83 = arith.addi %82, %81 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%84] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %85 = arith.subi %dataResult_9, %28#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %86 = arith.muli %85, %33#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %87 = arith.shrsi %86, %52#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %88 = arith.muli %38, %58 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %90 = oehb [4003] %19 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %91 = arith.addi %90, %89 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %92 = oehb [4005] %91 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i13
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%93] %87 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %94 = arith.muli %37, %57 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %96 = oehb [4003] %18 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %97 = arith.addi %96, %95 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%98] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %99 = arith.subi %dataResult_13, %28#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %100 = arith.muli %99, %33#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %101 = arith.shrsi %100, %52#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %102 = arith.muli %36, %56 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %103 = arith.extsi %102 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %104 = arith.addi %17, %103 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %106 = oehb [4005] %105 {bb = 2 : ui32, name = #handshake.name<"oehb16">} : i32
    %addressResult_14, %dataResult_15 = mc_store[%106] %101 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %107 = arith.addi %23, %65 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %108:2 = fork [2] %107 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %109 = arith.trunci %108#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %110 = oehb [1] %62 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i7
    %111 = tehb [1] %110 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i7
    %112 = arith.cmpi ult, %108#1, %111 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %113:5 = fork [5] %112 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %113#0, %109 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %114 = oehb [4004] %113#2 {bb = 2 : ui32, name = #handshake.name<"oehb17">} : i1
    %trueResult_16, %falseResult_17 = cond_br %114, %28#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %115 = oehb [4004] %113#3 {bb = 2 : ui32, name = #handshake.name<"oehb18">} : i1
    %trueResult_18, %falseResult_19 = cond_br %115, %33#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %116 = oehb [1] %35#0 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i6
    %117 = tehb [1] %116 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %trueResult_20, %falseResult_21 = cond_br %113#1, %117 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %113#4, %45#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %118 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %119 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb8">} : none
    %120 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %121 = constant %120 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %122 = arith.extsi %121 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %123 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %124 = constant %123 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %125 = arith.extsi %124 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %126 = arith.addi %118, %125 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %127 = tehb [3001] %126 {bb = 3 : ui32, name = #handshake.name<"tehb9">} : i7
    %128:2 = fork [2] %127 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %129 = arith.trunci %128#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %130 = arith.cmpi ult, %128#1, %122 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %131:4 = fork [4] %130 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %131#0, %129 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %131#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %131#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %131#3, %119 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %132 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %132, %done_3, %done_1, %done : none, none, none, none
  }
}

