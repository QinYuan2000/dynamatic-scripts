module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%60#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%60#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%60#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %24 = mux %56#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %25 = tehb [3001] %24 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %26:7 = fork [7] %25 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %27 = arith.extsi %26#0 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %28 = oehb [1] %26#1 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %29 = tehb [1] %28 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %30 = arith.extsi %29 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %31 = arith.extsi %26#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %32 = arith.extsi %26#3 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %33 = arith.extsi %26#4 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %34 = arith.extsi %26#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %35 = arith.extsi %26#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %36 = oehb [1] %56#3 {bb = 2 : ui32, name = #handshake.name<"oehb9">} : i1
    %37 = tehb [1] %36 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i1
    %38 = mux %37 [%trueResult_16, %19] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %39 = oehb [1] %38 {bb = 2 : ui32, name = #handshake.name<"oehb6">} : i32
    %40 = tehb [1] %39 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i32
    %41:4 = fork [4] %40 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %42 = oehb [1] %56#2 {bb = 2 : ui32, name = #handshake.name<"oehb10">} : i1
    %43 = tehb [1] %42 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i1
    %44 = mux %43 [%trueResult_18, %21] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %45 = oehb [1] %44 {bb = 2 : ui32, name = #handshake.name<"oehb7">} : i32
    %46 = tehb [1] %45 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i32
    %47:4 = fork [4] %46 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %48 = mux %56#0 [%trueResult_20, %22] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %49:7 = fork [7] %48 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %50 = arith.extsi %49#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %51 = arith.extsi %49#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %52 = arith.extsi %49#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %53 = arith.extsi %49#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %54 = arith.extsi %49#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %55 = arith.extsi %49#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %23 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %56:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %57:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %58 = constant %57#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %59 = arith.extsi %58 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %60:3 = fork [3] %59 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %61 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %62 = constant %61 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %63 = arith.extsi %62 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %64:3 = fork [3] %63 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %65 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %66 = constant %65 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %67:7 = fork [7] %66 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %68 = arith.extsi %67#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %69 = arith.extsi %67#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %70 = arith.extsi %67#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %71 = arith.extsi %67#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %72 = arith.extsi %67#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %73 = arith.extsi %67#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %74 = tehb [3001] %67#6 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i6
    %75 = arith.extsi %74 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %76 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %77 = constant %76 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %78 = arith.extsi %77 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %79 = arith.muli %55, %73 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %80 = arith.extsi %79 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %81 = oehb [1] %34 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i13
    %82 = tehb [1] %81 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i13
    %83 = arith.addi %82, %80 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%84] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %85 = arith.subi %dataResult, %41#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %86 = arith.muli %85, %47#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %87 = arith.shrsi %86, %64#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %88 = arith.muli %54, %72 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %90 = oehb [4003] %33 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : i13
    %91 = arith.addi %90, %89 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %92 = tehb [3001] %91 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : i13
    %93 = arith.extsi %92 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %addressResult_6, %dataResult_7 = mc_store[%93] %87 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %94 = arith.muli %53, %71 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %95 = arith.extsi %94 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %96 = oehb [1] %32 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i13
    %97 = tehb [1] %96 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i13
    %98 = arith.addi %97, %95 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %99 = arith.extsi %98 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%99] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %100 = arith.subi %dataResult_9, %41#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %101 = arith.muli %100, %47#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %102 = arith.shrsi %101, %64#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %103 = arith.muli %52, %70 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %104 = arith.extsi %103 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %105 = oehb [4002] %31 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i13
    %106 = arith.addi %105, %104 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %107 = arith.extsi %106 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %108 = oehb [1] %107 {bb = 2 : ui32, name = #handshake.name<"oehb12">} : i32
    %109 = tehb [1] %108 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%109] %102 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %110 = arith.muli %51, %69 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %111 = arith.extsi %110 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %112 = arith.addi %30, %111 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %113 = arith.extsi %112 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%113] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %114 = arith.subi %dataResult_13, %41#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %115 = arith.muli %114, %47#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %116 = arith.shrsi %115, %64#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %117 = arith.muli %50, %68 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %118 = arith.extsi %117 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %119 = oehb [1] %27 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i13
    %120 = tehb [1] %119 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i13
    %121 = arith.addi %120, %118 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %122 = oehb [4002] %121 {bb = 2 : ui32, name = #handshake.name<"oehb13">} : i13
    %123 = arith.extsi %122 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%123] %116 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %124 = arith.addi %35, %78 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %125:2 = fork [2] %124 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %126 = tehb [3001] %125#0 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i7
    %127 = arith.trunci %126 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %128 = arith.cmpi ult, %125#1, %75 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %129 = tehb [3001] %128 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i1
    %130:5 = fork [5] %129 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %130#0, %127 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %131 = oehb [1] %130#2 {bb = 2 : ui32, name = #handshake.name<"oehb14">} : i1
    %132 = tehb [1] %131 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %132, %41#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %133 = oehb [1] %130#3 {bb = 2 : ui32, name = #handshake.name<"oehb15">} : i1
    %134 = tehb [1] %133 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %134, %47#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %135 = oehb [1] %49#0 {bb = 2 : ui32, name = #handshake.name<"oehb8">} : i6
    %136 = tehb [1] %135 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i6
    %trueResult_20, %falseResult_21 = cond_br %130#1, %136 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %137 = oehb [1] %57#0 {bb = 2 : ui32, name = #handshake.name<"oehb11">} : none
    %138 = tehb [1] %137 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : none
    %trueResult_22, %falseResult_23 = cond_br %130#4, %138 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %139 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %140 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %141 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %142 = arith.extsi %141 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %143 = tehb [3001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %144 = merge %143 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %145 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %146 = constant %145 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %147 = arith.extsi %146 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %148 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %149 = constant %148 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %150 = arith.extsi %149 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %151 = arith.addi %142, %150 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %152:2 = fork [2] %151 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %153 = arith.trunci %152#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %154 = arith.cmpi ult, %152#1, %147 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %155 = tehb [3001] %154 {bb = 3 : ui32, name = #handshake.name<"tehb22">} : i1
    %156:4 = fork [4] %155 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %157 = tehb [3001] %153 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i6
    %trueResult_24, %falseResult_25 = cond_br %156#0, %157 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %156#1, %139 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %156#2, %140 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %156#3, %144 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %158 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %159 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %158 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %159, %done_3, %done_1, %done : none, none, none, none
  }
}

