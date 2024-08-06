module {
  handshake.func @video_filter(%arg0: i32, %arg1: i32, %arg2: memref<900xi32>, %arg3: memref<900xi32>, %arg4: memref<900xi32>, %arg5: none, ...) -> none attributes {argNames = ["offset", "scale", "pixelR", "pixelG", "pixelB", "start"], resNames = ["out0"]} {
    %memOutputs, %done = mem_controller[%arg2 : memref<900xi32>] (%61#2, %addressResult, %addressResult_6, %dataResult_7) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller0">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_0, %done_1 = mem_controller[%arg3 : memref<900xi32>] (%61#1, %addressResult_12, %addressResult_14, %dataResult_15) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller1">} : (i32, i32, i32, i32) -> (i32, none)
    %memOutputs_2, %done_3 = mem_controller[%arg4 : memref<900xi32>] (%61#0, %addressResult_8, %addressResult_10, %dataResult_11) {connectedBlocks = [2 : i32], name = #handshake.name<"mem_controller2">} : (i32, i32, i32, i32) -> (i32, none)
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
    %18 = tehb [4001] %11 {bb = 1 : ui32, name = #handshake.name<"tehb0">} : i32
    %19 = br %18 {bb = 1 : ui32, name = #handshake.name<"br7">} : i32
    %20 = tehb [4001] %12 {bb = 1 : ui32, name = #handshake.name<"tehb1">} : i32
    %21 = br %20 {bb = 1 : ui32, name = #handshake.name<"br8">} : i32
    %22 = br %10 {bb = 1 : ui32, name = #handshake.name<"br11">} : i6
    %23 = br %14#1 {bb = 1 : ui32, name = #handshake.name<"br10">} : none
    %24 = mux %57#1 [%trueResult, %17] {bb = 2 : ui32, name = #handshake.name<"mux8">} : i1, i6
    %25 = oehb [1] %24 {bb = 2 : ui32, name = #handshake.name<"oehb0">} : i6
    %26 = tehb [1] %25 {bb = 2 : ui32, name = #handshake.name<"tehb2">} : i6
    %27:7 = fork [7] %26 {bb = 2 : ui32, name = #handshake.name<"fork3">} : i6
    %28 = tehb [2003] %27#0 {bb = 2 : ui32, name = #handshake.name<"tehb3">} : i6
    %29 = arith.extsi %28 {bb = 2 : ui32, name = #handshake.name<"extsi10">} : i6 to i13
    %30 = tehb [2003] %27#1 {bb = 2 : ui32, name = #handshake.name<"tehb4">} : i6
    %31 = arith.extsi %30 {bb = 2 : ui32, name = #handshake.name<"extsi11">} : i6 to i13
    %32 = arith.extsi %27#2 {bb = 2 : ui32, name = #handshake.name<"extsi12">} : i6 to i13
    %33 = tehb [2003] %27#3 {bb = 2 : ui32, name = #handshake.name<"tehb5">} : i6
    %34 = arith.extsi %33 {bb = 2 : ui32, name = #handshake.name<"extsi13">} : i6 to i13
    %35 = tehb [2003] %27#4 {bb = 2 : ui32, name = #handshake.name<"tehb6">} : i6
    %36 = arith.extsi %35 {bb = 2 : ui32, name = #handshake.name<"extsi14">} : i6 to i13
    %37 = arith.extsi %27#5 {bb = 2 : ui32, name = #handshake.name<"extsi15">} : i6 to i13
    %38 = arith.extsi %27#6 {bb = 2 : ui32, name = #handshake.name<"extsi16">} : i6 to i7
    %39 = tehb [2004] %57#3 {bb = 2 : ui32, name = #handshake.name<"tehb12">} : i1
    %40 = mux %39 [%trueResult_16, %19] {bb = 2 : ui32, name = #handshake.name<"mux4">} : i1, i32
    %41 = oehb [1] %40 {bb = 2 : ui32, name = #handshake.name<"oehb1">} : i32
    %42 = tehb [1] %41 {bb = 2 : ui32, name = #handshake.name<"tehb9">} : i32
    %43:4 = fork [4] %42 {bb = 2 : ui32, name = #handshake.name<"fork4">} : i32
    %44 = tehb [2004] %57#2 {bb = 2 : ui32, name = #handshake.name<"tehb13">} : i1
    %45 = mux %44 [%trueResult_18, %21] {bb = 2 : ui32, name = #handshake.name<"mux5">} : i1, i32
    %46 = oehb [1] %45 {bb = 2 : ui32, name = #handshake.name<"oehb2">} : i32
    %47 = tehb [1] %46 {bb = 2 : ui32, name = #handshake.name<"tehb10">} : i32
    %48:4 = fork [4] %47 {bb = 2 : ui32, name = #handshake.name<"fork5">} : i32
    %49 = mux %57#0 [%trueResult_20, %22] {bb = 2 : ui32, name = #handshake.name<"mux9">} : i1, i6
    %50:7 = fork [7] %49 {bb = 2 : ui32, name = #handshake.name<"fork6">} : i6
    %51 = arith.extsi %50#1 {bb = 2 : ui32, name = #handshake.name<"extsi17">} : i6 to i12
    %52 = arith.extsi %50#2 {bb = 2 : ui32, name = #handshake.name<"extsi18">} : i6 to i12
    %53 = arith.extsi %50#3 {bb = 2 : ui32, name = #handshake.name<"extsi19">} : i6 to i12
    %54 = arith.extsi %50#4 {bb = 2 : ui32, name = #handshake.name<"extsi20">} : i6 to i12
    %55 = arith.extsi %50#5 {bb = 2 : ui32, name = #handshake.name<"extsi21">} : i6 to i12
    %56 = arith.extsi %50#6 {bb = 2 : ui32, name = #handshake.name<"extsi22">} : i6 to i12
    %result_4, %index_5 = control_merge %trueResult_22, %23 {bb = 2 : ui32, name = #handshake.name<"control_merge5">} : none, i1
    %57:4 = fork [4] %index_5 {bb = 2 : ui32, name = #handshake.name<"fork7">} : i1
    %58:2 = fork [2] %result_4 {bb = 2 : ui32, name = #handshake.name<"fork8">} : none
    %59 = constant %58#1 {bb = 2 : ui32, name = #handshake.name<"constant2">, value = 1 : i2} : i2
    %60 = arith.extsi %59 {bb = 2 : ui32, name = #handshake.name<"extsi2">} : i2 to i32
    %61:3 = fork [3] %60 {bb = 2 : ui32, name = #handshake.name<"fork9">} : i32
    %62 = source {bb = 2 : ui32, name = #handshake.name<"source0">}
    %63 = constant %62 {bb = 2 : ui32, name = #handshake.name<"constant3">, value = 4 : i4} : i4
    %64 = arith.extsi %63 {bb = 2 : ui32, name = #handshake.name<"extsi3">} : i4 to i32
    %65:3 = fork [3] %64 {bb = 2 : ui32, name = #handshake.name<"fork10">} : i32
    %66 = source {bb = 2 : ui32, name = #handshake.name<"source1">}
    %67 = constant %66 {bb = 2 : ui32, name = #handshake.name<"constant10">, value = 30 : i6} : i6
    %68:7 = fork [7] %67 {bb = 2 : ui32, name = #handshake.name<"fork11">} : i6
    %69 = arith.extsi %68#0 {bb = 2 : ui32, name = #handshake.name<"extsi23">} : i6 to i12
    %70 = arith.extsi %68#1 {bb = 2 : ui32, name = #handshake.name<"extsi24">} : i6 to i12
    %71 = arith.extsi %68#2 {bb = 2 : ui32, name = #handshake.name<"extsi25">} : i6 to i12
    %72 = arith.extsi %68#3 {bb = 2 : ui32, name = #handshake.name<"extsi26">} : i6 to i12
    %73 = arith.extsi %68#4 {bb = 2 : ui32, name = #handshake.name<"extsi27">} : i6 to i12
    %74 = arith.extsi %68#5 {bb = 2 : ui32, name = #handshake.name<"extsi28">} : i6 to i12
    %75 = oehb [1] %68#6 {bb = 2 : ui32, name = #handshake.name<"oehb5">} : i6
    %76 = arith.extsi %75 {bb = 2 : ui32, name = #handshake.name<"extsi29">} : i6 to i7
    %77 = source {bb = 2 : ui32, name = #handshake.name<"source2">}
    %78 = constant %77 {bb = 2 : ui32, name = #handshake.name<"constant11">, value = 1 : i2} : i2
    %79 = arith.extsi %78 {bb = 2 : ui32, name = #handshake.name<"extsi30">} : i2 to i7
    %80 = arith.muli %56, %74 {bb = 2 : ui32, name = #handshake.name<"muli9">} : i12
    %81 = arith.extsi %80 {bb = 2 : ui32, name = #handshake.name<"extsi31">} : i12 to i13
    %82 = tehb [2003] %37 {bb = 2 : ui32, name = #handshake.name<"tehb8">} : i13
    %83 = arith.addi %82, %81 {bb = 2 : ui32, name = #handshake.name<"addi8">} : i13
    %84 = arith.extsi %83 {bb = 2 : ui32, name = #handshake.name<"extsi32">} : i13 to i32
    %addressResult, %dataResult = mc_load[%84] %memOutputs {bb = 2 : ui32, deps = #handshake<deps[<"mc_store2" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load2">} : i32, i32
    %85 = arith.subi %dataResult, %43#3 {bb = 2 : ui32, name = #handshake.name<"subi0">} : i32
    %86 = arith.muli %85, %48#3 {bb = 2 : ui32, name = #handshake.name<"muli0">} : i32
    %87 = arith.shrsi %86, %65#0 {bb = 2 : ui32, name = #handshake.name<"shrsi0">} : i32
    %88 = arith.muli %55, %73 {bb = 2 : ui32, name = #handshake.name<"muli10">} : i12
    %89 = arith.extsi %88 {bb = 2 : ui32, name = #handshake.name<"extsi33">} : i12 to i13
    %90 = arith.addi %36, %89 {bb = 2 : ui32, name = #handshake.name<"addi9">} : i13
    %91 = arith.extsi %90 {bb = 2 : ui32, name = #handshake.name<"extsi34">} : i13 to i32
    %92 = tehb [2005] %91 {bb = 2 : ui32, name = #handshake.name<"tehb15">} : i32
    %addressResult_6, %dataResult_7 = mc_store[%92] %87 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store2">} : i32, i32
    %93 = arith.muli %54, %72 {bb = 2 : ui32, name = #handshake.name<"muli11">} : i12
    %94 = arith.extsi %93 {bb = 2 : ui32, name = #handshake.name<"extsi35">} : i12 to i13
    %95 = arith.addi %34, %94 {bb = 2 : ui32, name = #handshake.name<"addi10">} : i13
    %96 = arith.extsi %95 {bb = 2 : ui32, name = #handshake.name<"extsi36">} : i13 to i32
    %addressResult_8, %dataResult_9 = mc_load[%96] %memOutputs_2 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store0" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load0">} : i32, i32
    %97 = arith.subi %dataResult_9, %43#2 {bb = 2 : ui32, name = #handshake.name<"subi1">} : i32
    %98 = arith.muli %97, %48#2 {bb = 2 : ui32, name = #handshake.name<"muli1">} : i32
    %99 = arith.shrsi %98, %65#1 {bb = 2 : ui32, name = #handshake.name<"shrsi1">} : i32
    %100 = arith.muli %53, %71 {bb = 2 : ui32, name = #handshake.name<"muli12">} : i12
    %101 = arith.extsi %100 {bb = 2 : ui32, name = #handshake.name<"extsi37">} : i12 to i13
    %102 = tehb [2003] %32 {bb = 2 : ui32, name = #handshake.name<"tehb7">} : i13
    %103 = arith.addi %102, %101 {bb = 2 : ui32, name = #handshake.name<"addi11">} : i13
    %104 = arith.extsi %103 {bb = 2 : ui32, name = #handshake.name<"extsi38">} : i13 to i32
    %105 = tehb [2005] %104 {bb = 2 : ui32, name = #handshake.name<"tehb16">} : i32
    %addressResult_10, %dataResult_11 = mc_store[%105] %99 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store0">} : i32, i32
    %106 = arith.muli %52, %70 {bb = 2 : ui32, name = #handshake.name<"muli13">} : i12
    %107 = arith.extsi %106 {bb = 2 : ui32, name = #handshake.name<"extsi39">} : i12 to i13
    %108 = arith.addi %31, %107 {bb = 2 : ui32, name = #handshake.name<"addi12">} : i13
    %109 = arith.extsi %108 {bb = 2 : ui32, name = #handshake.name<"extsi40">} : i13 to i32
    %addressResult_12, %dataResult_13 = mc_load[%109] %memOutputs_0 {bb = 2 : ui32, deps = #handshake<deps[<"mc_store1" (3) [[0, 0], [0, 0]]>]>, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_load1">} : i32, i32
    %110 = arith.subi %dataResult_13, %43#1 {bb = 2 : ui32, name = #handshake.name<"subi2">} : i32
    %111 = arith.muli %110, %48#1 {bb = 2 : ui32, name = #handshake.name<"muli2">} : i32
    %112 = arith.shrsi %111, %65#2 {bb = 2 : ui32, name = #handshake.name<"shrsi2">} : i32
    %113 = arith.muli %51, %69 {bb = 2 : ui32, name = #handshake.name<"muli14">} : i12
    %114 = arith.extsi %113 {bb = 2 : ui32, name = #handshake.name<"extsi41">} : i12 to i13
    %115 = arith.addi %29, %114 {bb = 2 : ui32, name = #handshake.name<"addi13">} : i13
    %116 = tehb [2005] %115 {bb = 2 : ui32, name = #handshake.name<"tehb17">} : i13
    %117 = arith.extsi %116 {bb = 2 : ui32, name = #handshake.name<"extsi42">} : i13 to i32
    %addressResult_14, %dataResult_15 = mc_store[%117] %112 {bb = 2 : ui32, mem_interface = #handshake.mem_interface<MC>, name = #handshake.name<"mc_store1">} : i32, i32
    %118 = arith.addi %38, %79 {bb = 2 : ui32, name = #handshake.name<"addi14">} : i7
    %119:2 = fork [2] %118 {bb = 2 : ui32, name = #handshake.name<"fork12">} : i7
    %120 = arith.trunci %119#0 {bb = 2 : ui32, name = #handshake.name<"trunci0">} : i7 to i6
    %121 = arith.cmpi ult, %119#1, %76 {bb = 2 : ui32, name = #handshake.name<"cmpi2">} : i7
    %122:5 = fork [5] %121 {bb = 2 : ui32, name = #handshake.name<"fork13">} : i1
    %trueResult, %falseResult = cond_br %122#0, %120 {bb = 2 : ui32, name = #handshake.name<"cond_br0">} : i6
    sink %falseResult {name = #handshake.name<"sink0">} : i6
    %123 = tehb [2004] %122#2 {bb = 2 : ui32, name = #handshake.name<"tehb18">} : i1
    %trueResult_16, %falseResult_17 = cond_br %123, %43#0 {bb = 2 : ui32, name = #handshake.name<"cond_br3">} : i32
    %124 = tehb [2004] %122#3 {bb = 2 : ui32, name = #handshake.name<"tehb19">} : i1
    %trueResult_18, %falseResult_19 = cond_br %124, %48#0 {bb = 2 : ui32, name = #handshake.name<"cond_br4">} : i32
    %125 = oehb [1] %50#0 {bb = 2 : ui32, name = #handshake.name<"oehb3">} : i6
    %126 = tehb [1] %125 {bb = 2 : ui32, name = #handshake.name<"tehb11">} : i6
    %trueResult_20, %falseResult_21 = cond_br %122#1, %126 {bb = 2 : ui32, name = #handshake.name<"cond_br1">} : i6
    %127 = oehb [1] %58#0 {bb = 2 : ui32, name = #handshake.name<"oehb4">} : none
    %128 = tehb [1] %127 {bb = 2 : ui32, name = #handshake.name<"tehb14">} : none
    %trueResult_22, %falseResult_23 = cond_br %122#4, %128 {bb = 2 : ui32, name = #handshake.name<"cond_br6">} : none
    %129 = merge %falseResult_17 {bb = 3 : ui32, name = #handshake.name<"merge3">} : i32
    %130 = merge %falseResult_19 {bb = 3 : ui32, name = #handshake.name<"merge4">} : i32
    %131 = merge %falseResult_21 {bb = 3 : ui32, name = #handshake.name<"merge6">} : i6
    %132 = arith.extsi %131 {bb = 3 : ui32, name = #handshake.name<"extsi43">} : i6 to i7
    %133 = tehb [4001] %falseResult_23 {bb = 3 : ui32, name = #handshake.name<"tehb20">} : none
    %134 = merge %133 {bb = 3 : ui32, name = #handshake.name<"merge7">} : none
    %135 = source {bb = 3 : ui32, name = #handshake.name<"source3">}
    %136 = constant %135 {bb = 3 : ui32, name = #handshake.name<"constant12">, value = 30 : i6} : i6
    %137 = arith.extsi %136 {bb = 3 : ui32, name = #handshake.name<"extsi44">} : i6 to i7
    %138 = source {bb = 3 : ui32, name = #handshake.name<"source4">}
    %139 = constant %138 {bb = 3 : ui32, name = #handshake.name<"constant13">, value = 1 : i2} : i2
    %140 = arith.extsi %139 {bb = 3 : ui32, name = #handshake.name<"extsi45">} : i2 to i7
    %141 = arith.addi %132, %140 {bb = 3 : ui32, name = #handshake.name<"addi15">} : i7
    %142 = tehb [4001] %141 {bb = 3 : ui32, name = #handshake.name<"tehb21">} : i7
    %143:2 = fork [2] %142 {bb = 3 : ui32, name = #handshake.name<"fork14">} : i7
    %144 = arith.trunci %143#0 {bb = 3 : ui32, name = #handshake.name<"trunci1">} : i7 to i6
    %145 = arith.cmpi ult, %143#1, %137 {bb = 3 : ui32, name = #handshake.name<"cmpi3">} : i7
    %146:4 = fork [4] %145 {bb = 3 : ui32, name = #handshake.name<"fork15">} : i1
    %trueResult_24, %falseResult_25 = cond_br %146#0, %144 {bb = 3 : ui32, name = #handshake.name<"cond_br11">} : i6
    sink %falseResult_25 {name = #handshake.name<"sink1">} : i6
    %trueResult_26, %falseResult_27 = cond_br %146#1, %129 {bb = 3 : ui32, name = #handshake.name<"cond_br8">} : i32
    sink %falseResult_27 {name = #handshake.name<"sink2">} : i32
    %trueResult_28, %falseResult_29 = cond_br %146#2, %130 {bb = 3 : ui32, name = #handshake.name<"cond_br9">} : i32
    sink %falseResult_29 {name = #handshake.name<"sink3">} : i32
    %trueResult_30, %falseResult_31 = cond_br %146#3, %134 {bb = 3 : ui32, name = #handshake.name<"cond_br10">} : none
    %147 = merge %falseResult_31 {bb = 4 : ui32, name = #handshake.name<"merge8">} : none
    %148 = return {bb = 4 : ui32, name = #handshake.name<"return1">} %147 : none
    end {bb = 4 : ui32, name = #handshake.name<"end1">} %148, %done_3, %done_1, %done : none, none, none, none
  }
}

