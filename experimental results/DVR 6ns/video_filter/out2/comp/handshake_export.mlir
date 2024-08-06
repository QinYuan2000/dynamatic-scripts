module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%49#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%49#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%49#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %10 = tehb [4001] %4 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %11 = tehb [4001] %5 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %12 = mux %45#1 [%trueResult, %9] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %13 = oehb [1] %12 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %14 = tehb [1] %13 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %15:7 = fork [7] %14 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %16 = tehb [2003] %15#0 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %17 = arith.extsi %16 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %18 = tehb [2003] %15#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %19 = arith.extsi %18 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %20 = arith.extsi %15#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %21 = tehb [2003] %15#3 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %22 = arith.extsi %21 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %23 = tehb [2003] %15#4 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i6
    %24 = arith.extsi %23 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %25 = arith.extsi %15#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %26 = arith.extsi %15#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %27 = tehb [2004] %45#3 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %28 = mux %27 [%trueResult_16, %10] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %29 = oehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %30 = tehb [1] %29 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %31:4 = fork [4] %30 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %32 = tehb [2004] %45#2 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %33 = mux %32 [%trueResult_18, %11] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %34 = oehb [1] %33 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %35 = tehb [1] %34 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i32
    %36:4 = fork [4] %35 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %37 = mux %45#0 [%trueResult_20, %3] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %38:7 = fork [7] %37 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %39 = arith.extsi %38#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %40 = arith.extsi %38#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %41 = arith.extsi %38#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %42 = arith.extsi %38#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %43 = arith.extsi %38#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %44 = arith.extsi %38#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %7#1 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %45:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %46:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %47 = constant %46#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %48 = arith.extsi %47 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %49:3 = fork [3] %48 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %50 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %51 = constant %50 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %52 = arith.extsi %51 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %53:3 = fork [3] %52 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %54 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %55 = constant %54 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %56:7 = fork [7] %55 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %57 = arith.extsi %56#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %58 = arith.extsi %56#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %59 = arith.extsi %56#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %60 = arith.extsi %56#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %61 = arith.extsi %56#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %62 = arith.extsi %56#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %63 = oehb [1] %56#6 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %64 = arith.extsi %63 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %65 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %66 = constant %65 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %67 = arith.extsi %66 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %68 = arith.muli %44, %62 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %69 = arith.extsi %68 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %70 = tehb [2003] %25 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i13
    %71 = arith.addi %70, %69 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %72 = arith.extsi %71 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%72] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %73 = arith.subi %dataResult, %31#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %74 = arith.muli %73, %36#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %75 = arith.shrsi %74, %53#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %76 = arith.muli %43, %61 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %77 = arith.extsi %76 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %78 = arith.addi %24, %77 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %80 = tehb [2005] %79 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%80] %75 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %81 = arith.muli %42, %60 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %82 = arith.extsi %81 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %83 = arith.addi %22, %82 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%84] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %85 = arith.subi %dataResult_9, %31#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %86 = arith.muli %85, %36#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %87 = arith.shrsi %86, %53#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %88 = arith.muli %41, %59 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %90 = tehb [2003] %20 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %91 = arith.addi %90, %89 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %92 = arith.extsi %91 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %93 = tehb [2005] %92 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%93] %87 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %94 = arith.muli %40, %58 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %96 = arith.addi %19, %95 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %97 = arith.extsi %96 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%97] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %98 = arith.subi %dataResult_13, %31#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %99 = arith.muli %98, %36#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %100 = arith.shrsi %99, %53#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %101 = arith.muli %39, %57 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %102 = arith.extsi %101 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %103 = arith.addi %17, %102 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %104 = tehb [2005] %103 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i13
    %105 = arith.extsi %104 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%105] %100 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %106 = arith.addi %26, %67 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %107:2 = fork [2] %106 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %108 = arith.trunci %107#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %109 = arith.cmpi ult, %107#1, %64 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %110:5 = fork [5] %109 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %110#0, %108 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %111 = tehb [2004] %110#2 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %111, %31#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %112 = tehb [2004] %110#3 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %112, %36#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %113 = oehb [1] %38#0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i6
    %114 = tehb [1] %113 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i6
    %trueResult_20, %falseResult_21 = cond_br %110#1, %114 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %115 = oehb [1] %46#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %116 = tehb [1] %115 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : none
    %trueResult_22, %falseResult_23 = cond_br %110#4, %116 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %117 = arith.extsi %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %118 = tehb [4001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %119 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %120 = constant %119 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %121 = arith.extsi %120 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %122 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %123 = constant %122 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %124 = arith.extsi %123 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %125 = arith.addi %117, %124 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %126 = tehb [4001] %125 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i7
    %127:2 = fork [2] %126 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %128 = arith.trunci %127#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %129 = arith.cmpi ult, %127#1, %121 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %130:4 = fork [4] %129 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %130#0, %128 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %130#1, %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %130#2, %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %130#3, %118 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %131 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %falseResult_31 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %131, %done_3, %done_1, %done : none, none, none, none
  }
}

