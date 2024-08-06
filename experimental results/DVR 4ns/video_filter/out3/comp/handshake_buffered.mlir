module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%65#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%65#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%65#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = tehb [3001] %11 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %19 = br %18 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %20 = tehb [3001] %12 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %21 = br %20 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %22 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %23 = br %14#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %24 = mux %59#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %25 = tehb [3001] %24 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %26:7 = fork [7] %25 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %27 = oehb [1] %26#0 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %28 = tehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %30 = arith.extsi %26#1 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %31 = arith.extsi %26#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %32 = oehb [1] %26#3 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i6
    %33 = tehb [1] %32 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %34 = arith.extsi %33 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %35 = oehb [4002] %26#4 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i6
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %37 = arith.extsi %26#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %38 = arith.extsi %26#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %39 = oehb [1] %59#3 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i1
    %40 = tehb [1] %39 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %41 = mux %40 [%trueResult_16, %19] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %42 = oehb [1] %41 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %43 = tehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %44:4 = fork [4] %43 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %45 = oehb [1] %59#2 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : i1
    %46 = tehb [1] %45 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %47 = mux %46 [%trueResult_18, %21] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %48 = oehb [1] %47 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %49 = tehb [1] %48 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %50:4 = fork [4] %49 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %51 = mux %59#0 [%trueResult_20, %22] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %52:7 = fork [7] %51 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %53 = arith.extsi %52#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %54 = arith.extsi %52#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %55 = arith.extsi %52#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %56 = arith.extsi %52#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %57 = arith.extsi %52#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %58 = arith.extsi %52#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %23 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %59:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %60 = oehb [1] %result_4 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : none
    %61 = tehb [1] %60 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : none
    %62:2 = fork [2] %61 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %63 = constant %62#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %64 = arith.extsi %63 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %65:3 = fork [3] %64 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %66 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %67 = constant %66 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %68 = arith.extsi %67 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %69:3 = fork [3] %68 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %70 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %71 = constant %70 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %72:7 = fork [7] %71 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %73 = arith.extsi %72#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %74 = arith.extsi %72#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %75 = arith.extsi %72#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %76 = arith.extsi %72#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %77 = arith.extsi %72#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %78 = arith.extsi %72#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %79 = arith.extsi %72#6 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %80 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %81 = constant %80 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %82 = arith.extsi %81 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %83 = arith.muli %58, %78 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %85 = oehb [1] %37 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %86 = tehb [1] %85 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %87 = arith.addi %86, %84 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %88 = arith.extsi %87 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%88] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %89 = arith.subi %dataResult, %44#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %90 = arith.muli %89, %50#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %91 = arith.shrsi %90, %69#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %92 = arith.muli %57, %77 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %94 = arith.addi %36, %93 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %96 = oehb [1] %95 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : i32
    %97 = tehb [1] %96 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%97] %91 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %98 = arith.muli %56, %76 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %99 = arith.extsi %98 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %100 = arith.addi %34, %99 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%101] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %102 = arith.subi %dataResult_9, %44#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %103 = arith.muli %102, %50#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %104 = arith.shrsi %103, %69#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %105 = arith.muli %55, %75 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %106 = arith.extsi %105 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %107 = oehb [1] %31 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %108 = tehb [1] %107 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %109 = arith.addi %108, %106 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %110 = oehb [4002] %109 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i13
    %111 = arith.extsi %110 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %addressResult_10, %dataResult_11 = mc_store[%111] %104 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %112 = arith.muli %54, %74 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %113 = arith.extsi %112 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %114 = oehb [1] %30 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %115 = tehb [1] %114 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i13
    %116 = arith.addi %115, %113 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %117 = arith.extsi %116 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%117] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %118 = arith.subi %dataResult_13, %44#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %119 = arith.muli %118, %50#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %120 = arith.shrsi %119, %69#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %121 = arith.muli %53, %73 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %122 = arith.extsi %121 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %123 = arith.addi %29, %122 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %124 = oehb [4002] %123 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i13
    %125 = arith.extsi %124 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%125] %120 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %126 = arith.addi %38, %82 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %127:2 = fork [2] %126 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %128 = arith.trunci %127#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %129 = tehb [3001] %79 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i7
    %130 = arith.cmpi ult, %127#1, %129 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %131 = tehb [3001] %130 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %132:5 = fork [5] %131 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %133 = tehb [3001] %128 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i6
    %trueResult, %falseResult = cond_br %132#0, %133 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %134 = oehb [1] %132#2 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i1
    %135 = tehb [1] %134 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %135, %44#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %136 = oehb [1] %132#3 {bb = 2 : ui32, name = #handshake.name<"oehb16">} : i1
    %137 = tehb [1] %136 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %137, %50#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %138 = oehb [1] %52#0 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %139 = tehb [1] %138 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i6
    %trueResult_20, %falseResult_21 = cond_br %132#1, %139 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %trueResult_22, %falseResult_23 = cond_br %132#4, %62#0 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %140 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %141 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %142 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %143 = arith.extsi %142 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %144 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %145 = merge %144 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %146 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %147 = constant %146 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %148 = arith.extsi %147 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %149 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %150 = constant %149 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %151 = arith.extsi %150 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %152 = arith.addi %143, %151 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %153:2 = fork [2] %152 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %154 = tehb [3001] %153#0 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i7
    %155 = arith.trunci %154 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %156 = arith.cmpi ult, %153#1, %148 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %157 = tehb [3001] %156 {bb = 3 : ui32, name = #handshake.name<"tehb22">} : i1
    %158:4 = fork [4] %157 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %158#0, %155 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %158#1, %140 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %158#2, %141 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %158#3, %145 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %159 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %160 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %159 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %160, %done_3, %done_1, %done : none, none, none, none
  }
}

