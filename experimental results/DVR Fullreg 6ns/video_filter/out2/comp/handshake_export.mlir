module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%55#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%55#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%55#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %12 = mux %49#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = oehb [1] %12 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %14 = tehb [1] %13 {bb = 2 : ui32, name = #handshake.name<"tehb0">} : i6
    %15:7 = fork [7] %14 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %16 = tehb [2004] %15#0 {bb = 2 : ui32, name = #handshake.name<"tehb1">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %18 = tehb [2004] %15#1 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %19 = arith.extsi %18 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %20 = tehb [2004] %15#2 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %21 = arith.extsi %20 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %22 = tehb [2004] %15#3 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %23 = arith.extsi %22 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %24 = tehb [2004] %15#4 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %25 = arith.extsi %24 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %26 = tehb [2004] %15#5 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i6
    %27 = arith.extsi %26 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %28 = arith.extsi %15#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %29 = tehb [2005] %49#3 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %30 = mux %29 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %31 = oehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i32
    %32 = tehb [1] %31 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %33:4 = fork [4] %32 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %34 = tehb [2005] %49#2 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %35 = mux %34 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %36 = oehb [1] %35 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i32
    %37 = tehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %38:4 = fork [4] %37 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %39 = mux %49#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %40 = oehb [1] %39 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %41 = tehb [1] %40 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i6
    %42:7 = fork [7] %41 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %43 = arith.extsi %42#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %44 = arith.extsi %42#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %45 = arith.extsi %42#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %46 = arith.extsi %42#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %47 = arith.extsi %42#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %48 = arith.extsi %42#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %49:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %50 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : none
    %51 = tehb [1] %50 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : none
    %52:2 = fork [2] %51 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %53 = constant %52#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %54 = arith.extsi %53 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %55:3 = fork [3] %54 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %56 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %57 = constant %56 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %58 = arith.extsi %57 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %59:3 = fork [3] %58 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %60 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %61 = constant %60 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %62:7 = fork [7] %61 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %63 = arith.extsi %62#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %64 = arith.extsi %62#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %65 = arith.extsi %62#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %66 = arith.extsi %62#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %67 = arith.extsi %62#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %68 = arith.extsi %62#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %69 = arith.extsi %62#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %70 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %71 = constant %70 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %72 = arith.extsi %71 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %73 = arith.muli %48, %68 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %74 = arith.extsi %73 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %75 = arith.addi %27, %74 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %76 = arith.extsi %75 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%76] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %77 = arith.subi %dataResult, %33#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %78 = arith.muli %77, %38#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %79 = arith.shrsi %78, %59#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %80 = arith.muli %47, %67 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %82 = arith.addi %25, %81 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %83 = arith.extsi %82 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %84 = tehb [2005] %83 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%84] %79 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %85 = arith.muli %46, %66 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %86 = arith.extsi %85 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %87 = arith.addi %23, %86 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%88] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %89 = arith.subi %dataResult_9, %33#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %90 = arith.muli %89, %38#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %91 = arith.shrsi %90, %59#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %92 = arith.muli %45, %65 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %94 = arith.addi %21, %93 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %96 = tehb [2005] %95 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%96] %91 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %97 = arith.muli %44, %64 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %98 = arith.extsi %97 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %99 = arith.addi %19, %98 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %100 = arith.extsi %99 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%100] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %101 = arith.subi %dataResult_13, %33#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %102 = arith.muli %101, %38#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %103 = arith.shrsi %102, %59#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %104 = arith.muli %43, %63 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %106 = arith.addi %17, %105 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %107 = tehb [2005] %106 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i13
    %108 = arith.extsi %107 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%108] %103 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %109 = arith.addi %28, %72 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %110:2 = fork [2] %109 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %111 = arith.trunci %110#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %112 = arith.cmpi ult, %110#1, %69 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %113:5 = fork [5] %112 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %113#0, %111 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %114 = tehb [2005] %113#2 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i1
    %trueResult_16, %falseResult_17 = cond_br %114, %33#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %115 = tehb [2005] %113#3 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %trueResult_18, %falseResult_19 = cond_br %115, %38#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %trueResult_20, %falseResult_21 = cond_br %113#1, %42#0 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %113#4, %52#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %116 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %117 = oehb [1] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"oehb7">} : none
    %118 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %119 = constant %118 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %120 = arith.extsi %119 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %121 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %122 = constant %121 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %123 = arith.extsi %122 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %124 = arith.addi %116, %123 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %125 = oehb [1] %124 {bb = 3 : ui32, name = #handshake.name<"oehb8">} : i7
    %126:2 = fork [2] %125 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %127 = arith.trunci %126#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %128 = arith.cmpi ult, %126#1, %120 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %129:4 = fork [4] %128 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %129#0, %127 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %129#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %129#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %129#3, %117 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %130 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %130, %done_3, %done_1, %done : none, none, none, none
  }
}

