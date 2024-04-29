; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%array2D = type { [5 x i32] }

@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @before_main, ptr null }]
@llvm.global_dtors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @after_main, ptr null }]
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_sysy_us = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_s = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_m = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_h = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_idx = dso_local global i32 0, align 4
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [35 x i8] c"Timer@%04d-%04d: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_l1 = dso_local global [1024 x i32] zeroinitializer, align 16
@_sysy_l2 = dso_local global [1024 x i32] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [25 x i8] c"TOTAL: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_start = dso_local global %struct.timeval zeroinitializer, align 8
@_sysy_end = dso_local global %struct.timeval zeroinitializer, align 8

define i32 @relu_reg(i32 %r100) {
relu_reg:
  %r101 = alloca i32, align 4
  store i32 %r100, ptr %r101, align 4
  %r102 = load i32, ptr %r101, align 4
  %r103 = icmp sgt i32 %r102, 127
  br i1 %r103, label %bb1, label %bb2

bb1:                                              ; preds = %relu_reg
  ret i32 127

bb2:                                              ; preds = %relu_reg
  br label %bb3

bb3:                                              ; preds = %bb2
  %r104 = load i32, ptr %r101, align 4
  %r105 = icmp slt i32 %r104, 0
  br i1 %r105, label %bb4, label %bb5

bb4:                                              ; preds = %bb3
  ret i32 0

bb5:                                              ; preds = %bb3
  br label %bb6

bb6:                                              ; preds = %bb5
  %r106 = load i32, ptr %r101, align 4
  ret i32 %r106
}

define i32 @model(ptr %r107) {
model:
  %r108 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r109 = getelementptr i32, ptr %r108, i32 0
  %r110 = getelementptr i32, ptr %r109, i32 0
  %r111 = load i32, ptr %r110, align 4
  %r112 = mul i32 %r111, 85
  %r113 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r114 = getelementptr i32, ptr %r113, i32 0
  %r115 = getelementptr i32, ptr %r114, i32 1
  %r116 = load i32, ptr %r115, align 4
  %r117 = mul i32 %r116, 23
  %r118 = add i32 %r112, %r117
  %r119 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r120 = getelementptr i32, ptr %r119, i32 0
  %r121 = getelementptr i32, ptr %r120, i32 2
  %r122 = load i32, ptr %r121, align 4
  %r124 = mul i32 %r122, -82
  %r125 = add i32 %r118, %r124
  %r126 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r127 = getelementptr i32, ptr %r126, i32 0
  %r128 = getelementptr i32, ptr %r127, i32 3
  %r129 = load i32, ptr %r128, align 4
  %r131 = mul i32 %r129, -103
  %r132 = add i32 %r125, %r131
  %r133 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r134 = getelementptr i32, ptr %r133, i32 0
  %r135 = getelementptr i32, ptr %r134, i32 4
  %r136 = load i32, ptr %r135, align 4
  %r138 = mul i32 %r136, -123
  %r139 = add i32 %r132, %r138
  %r140 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r141 = getelementptr i32, ptr %r140, i32 0
  %r142 = getelementptr i32, ptr %r141, i32 0
  %r143 = load i32, ptr %r142, align 4
  %r144 = mul i32 %r143, 64
  %r145 = add i32 %r139, %r144
  %r146 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r147 = getelementptr i32, ptr %r146, i32 0
  %r148 = getelementptr i32, ptr %r147, i32 1
  %r149 = load i32, ptr %r148, align 4
  %r151 = mul i32 %r149, -120
  %r152 = add i32 %r145, %r151
  %r153 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r154 = getelementptr i32, ptr %r153, i32 0
  %r155 = getelementptr i32, ptr %r154, i32 2
  %r156 = load i32, ptr %r155, align 4
  %r157 = mul i32 %r156, 50
  %r158 = add i32 %r152, %r157
  %r159 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r160 = getelementptr i32, ptr %r159, i32 0
  %r161 = getelementptr i32, ptr %r160, i32 3
  %r162 = load i32, ptr %r161, align 4
  %r164 = mul i32 %r162, -59
  %r165 = add i32 %r158, %r164
  %r166 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r167 = getelementptr i32, ptr %r166, i32 0
  %r168 = getelementptr i32, ptr %r167, i32 4
  %r169 = load i32, ptr %r168, align 4
  %r170 = mul i32 %r169, 47
  %r171 = add i32 %r165, %r170
  %r172 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r173 = getelementptr i32, ptr %r172, i32 0
  %r174 = getelementptr i32, ptr %r173, i32 0
  %r175 = load i32, ptr %r174, align 4
  %r177 = mul i32 %r175, -111
  %r178 = add i32 %r171, %r177
  %r179 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r180 = getelementptr i32, ptr %r179, i32 0
  %r181 = getelementptr i32, ptr %r180, i32 1
  %r182 = load i32, ptr %r181, align 4
  %r184 = mul i32 %r182, -67
  %r185 = add i32 %r178, %r184
  %r186 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r187 = getelementptr i32, ptr %r186, i32 0
  %r188 = getelementptr i32, ptr %r187, i32 2
  %r189 = load i32, ptr %r188, align 4
  %r191 = mul i32 %r189, -106
  %r192 = add i32 %r185, %r191
  %r193 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r194 = getelementptr i32, ptr %r193, i32 0
  %r195 = getelementptr i32, ptr %r194, i32 3
  %r196 = load i32, ptr %r195, align 4
  %r198 = mul i32 %r196, -75
  %r199 = add i32 %r192, %r198
  %r200 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r201 = getelementptr i32, ptr %r200, i32 0
  %r202 = getelementptr i32, ptr %r201, i32 4
  %r203 = load i32, ptr %r202, align 4
  %r205 = mul i32 %r203, -102
  %r206 = add i32 %r199, %r205
  %r207 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r208 = getelementptr i32, ptr %r207, i32 0
  %r209 = getelementptr i32, ptr %r208, i32 0
  %r210 = load i32, ptr %r209, align 4
  %r211 = mul i32 %r210, 34
  %r212 = add i32 %r206, %r211
  %r213 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r214 = getelementptr i32, ptr %r213, i32 0
  %r215 = getelementptr i32, ptr %r214, i32 1
  %r216 = load i32, ptr %r215, align 4
  %r218 = mul i32 %r216, -39
  %r219 = add i32 %r212, %r218
  %r220 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r221 = getelementptr i32, ptr %r220, i32 0
  %r222 = getelementptr i32, ptr %r221, i32 2
  %r223 = load i32, ptr %r222, align 4
  %r224 = mul i32 %r223, 65
  %r225 = add i32 %r219, %r224
  %r226 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r227 = getelementptr i32, ptr %r226, i32 0
  %r228 = getelementptr i32, ptr %r227, i32 3
  %r229 = load i32, ptr %r228, align 4
  %r230 = mul i32 %r229, 47
  %r231 = add i32 %r225, %r230
  %r232 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r233 = getelementptr i32, ptr %r232, i32 0
  %r234 = getelementptr i32, ptr %r233, i32 4
  %r235 = load i32, ptr %r234, align 4
  %r236 = mul i32 %r235, 113
  %r237 = add i32 %r231, %r236
  %r238 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r239 = getelementptr i32, ptr %r238, i32 0
  %r240 = getelementptr i32, ptr %r239, i32 0
  %r241 = load i32, ptr %r240, align 4
  %r242 = mul i32 %r241, 110
  %r243 = add i32 %r237, %r242
  %r244 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r245 = getelementptr i32, ptr %r244, i32 0
  %r246 = getelementptr i32, ptr %r245, i32 1
  %r247 = load i32, ptr %r246, align 4
  %r248 = mul i32 %r247, 47
  %r249 = add i32 %r243, %r248
  %r250 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r251 = getelementptr i32, ptr %r250, i32 0
  %r252 = getelementptr i32, ptr %r251, i32 2
  %r253 = load i32, ptr %r252, align 4
  %r255 = mul i32 %r253, -4
  %r256 = add i32 %r249, %r255
  %r257 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r258 = getelementptr i32, ptr %r257, i32 0
  %r259 = getelementptr i32, ptr %r258, i32 3
  %r260 = load i32, ptr %r259, align 4
  %r261 = mul i32 %r260, 80
  %r262 = add i32 %r256, %r261
  %r263 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r264 = getelementptr i32, ptr %r263, i32 0
  %r265 = getelementptr i32, ptr %r264, i32 4
  %r266 = load i32, ptr %r265, align 4
  %r267 = mul i32 %r266, 46
  %r268 = add i32 %r262, %r267
  %r269 = call i32 @relu_reg(i32 %r268)
  %r270 = mul i32 %r269, 39
  %r271 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r272 = getelementptr i32, ptr %r271, i32 0
  %r273 = getelementptr i32, ptr %r272, i32 0
  %r274 = load i32, ptr %r273, align 4
  %r276 = mul i32 %r274, -106
  %r277 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r278 = getelementptr i32, ptr %r277, i32 0
  %r279 = getelementptr i32, ptr %r278, i32 1
  %r280 = load i32, ptr %r279, align 4
  %r281 = mul i32 %r280, 126
  %r282 = add i32 %r276, %r281
  %r283 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r284 = getelementptr i32, ptr %r283, i32 0
  %r285 = getelementptr i32, ptr %r284, i32 2
  %r286 = load i32, ptr %r285, align 4
  %r288 = mul i32 %r286, -18
  %r289 = add i32 %r282, %r288
  %r290 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r291 = getelementptr i32, ptr %r290, i32 0
  %r292 = getelementptr i32, ptr %r291, i32 3
  %r293 = load i32, ptr %r292, align 4
  %r295 = mul i32 %r293, -31
  %r296 = add i32 %r289, %r295
  %r297 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r298 = getelementptr i32, ptr %r297, i32 0
  %r299 = getelementptr i32, ptr %r298, i32 4
  %r300 = load i32, ptr %r299, align 4
  %r302 = mul i32 %r300, -8
  %r303 = add i32 %r296, %r302
  %r304 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r305 = getelementptr i32, ptr %r304, i32 0
  %r306 = getelementptr i32, ptr %r305, i32 0
  %r307 = load i32, ptr %r306, align 4
  %r308 = mul i32 %r307, 47
  %r309 = add i32 %r303, %r308
  %r310 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r311 = getelementptr i32, ptr %r310, i32 0
  %r312 = getelementptr i32, ptr %r311, i32 1
  %r313 = load i32, ptr %r312, align 4
  %r315 = mul i32 %r313, -4
  %r316 = add i32 %r309, %r315
  %r317 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r318 = getelementptr i32, ptr %r317, i32 0
  %r319 = getelementptr i32, ptr %r318, i32 2
  %r320 = load i32, ptr %r319, align 4
  %r321 = mul i32 %r320, 67
  %r322 = add i32 %r316, %r321
  %r323 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r324 = getelementptr i32, ptr %r323, i32 0
  %r325 = getelementptr i32, ptr %r324, i32 3
  %r326 = load i32, ptr %r325, align 4
  %r328 = mul i32 %r326, -94
  %r329 = add i32 %r322, %r328
  %r330 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r331 = getelementptr i32, ptr %r330, i32 0
  %r332 = getelementptr i32, ptr %r331, i32 4
  %r333 = load i32, ptr %r332, align 4
  %r335 = mul i32 %r333, -121
  %r336 = add i32 %r329, %r335
  %r337 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r338 = getelementptr i32, ptr %r337, i32 0
  %r339 = getelementptr i32, ptr %r338, i32 0
  %r340 = load i32, ptr %r339, align 4
  %r341 = mul i32 %r340, 7
  %r342 = add i32 %r336, %r341
  %r343 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r344 = getelementptr i32, ptr %r343, i32 0
  %r345 = getelementptr i32, ptr %r344, i32 1
  %r346 = load i32, ptr %r345, align 4
  %r348 = mul i32 %r346, -21
  %r349 = add i32 %r342, %r348
  %r350 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r351 = getelementptr i32, ptr %r350, i32 0
  %r352 = getelementptr i32, ptr %r351, i32 2
  %r353 = load i32, ptr %r352, align 4
  %r355 = mul i32 %r353, -60
  %r356 = add i32 %r349, %r355
  %r357 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r358 = getelementptr i32, ptr %r357, i32 0
  %r359 = getelementptr i32, ptr %r358, i32 3
  %r360 = load i32, ptr %r359, align 4
  %r362 = mul i32 %r360, -43
  %r363 = add i32 %r356, %r362
  %r364 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r365 = getelementptr i32, ptr %r364, i32 0
  %r366 = getelementptr i32, ptr %r365, i32 4
  %r367 = load i32, ptr %r366, align 4
  %r368 = mul i32 %r367, 105
  %r369 = add i32 %r363, %r368
  %r370 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r371 = getelementptr i32, ptr %r370, i32 0
  %r372 = getelementptr i32, ptr %r371, i32 0
  %r373 = load i32, ptr %r372, align 4
  %r375 = mul i32 %r373, -42
  %r376 = add i32 %r369, %r375
  %r377 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r378 = getelementptr i32, ptr %r377, i32 0
  %r379 = getelementptr i32, ptr %r378, i32 1
  %r380 = load i32, ptr %r379, align 4
  %r381 = mul i32 %r380, 87
  %r382 = add i32 %r376, %r381
  %r383 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r384 = getelementptr i32, ptr %r383, i32 0
  %r385 = getelementptr i32, ptr %r384, i32 2
  %r386 = load i32, ptr %r385, align 4
  %r387 = mul i32 %r386, 29
  %r388 = add i32 %r382, %r387
  %r389 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r390 = getelementptr i32, ptr %r389, i32 0
  %r391 = getelementptr i32, ptr %r390, i32 3
  %r392 = load i32, ptr %r391, align 4
  %r394 = mul i32 %r392, -106
  %r395 = add i32 %r388, %r394
  %r396 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r397 = getelementptr i32, ptr %r396, i32 0
  %r398 = getelementptr i32, ptr %r397, i32 4
  %r399 = load i32, ptr %r398, align 4
  %r401 = mul i32 %r399, -31
  %r402 = add i32 %r395, %r401
  %r403 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r404 = getelementptr i32, ptr %r403, i32 0
  %r405 = getelementptr i32, ptr %r404, i32 0
  %r406 = load i32, ptr %r405, align 4
  %r408 = mul i32 %r406, -110
  %r409 = add i32 %r402, %r408
  %r410 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r411 = getelementptr i32, ptr %r410, i32 0
  %r412 = getelementptr i32, ptr %r411, i32 1
  %r413 = load i32, ptr %r412, align 4
  %r415 = mul i32 %r413, -100
  %r416 = add i32 %r409, %r415
  %r417 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r418 = getelementptr i32, ptr %r417, i32 0
  %r419 = getelementptr i32, ptr %r418, i32 2
  %r420 = load i32, ptr %r419, align 4
  %r422 = mul i32 %r420, -22
  %r423 = add i32 %r416, %r422
  %r424 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r425 = getelementptr i32, ptr %r424, i32 0
  %r426 = getelementptr i32, ptr %r425, i32 3
  %r427 = load i32, ptr %r426, align 4
  %r429 = mul i32 %r427, -75
  %r430 = add i32 %r423, %r429
  %r431 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r432 = getelementptr i32, ptr %r431, i32 0
  %r433 = getelementptr i32, ptr %r432, i32 4
  %r434 = load i32, ptr %r433, align 4
  %r436 = mul i32 %r434, -125
  %r437 = add i32 %r430, %r436
  %r438 = call i32 @relu_reg(i32 %r437)
  %r439 = mul i32 %r438, 77
  %r440 = add i32 %r270, %r439
  %r441 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r442 = getelementptr i32, ptr %r441, i32 0
  %r443 = getelementptr i32, ptr %r442, i32 0
  %r444 = load i32, ptr %r443, align 4
  %r445 = mul i32 %r444, 26
  %r446 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r447 = getelementptr i32, ptr %r446, i32 0
  %r448 = getelementptr i32, ptr %r447, i32 1
  %r449 = load i32, ptr %r448, align 4
  %r450 = mul i32 %r449, 76
  %r451 = add i32 %r445, %r450
  %r452 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r453 = getelementptr i32, ptr %r452, i32 0
  %r454 = getelementptr i32, ptr %r453, i32 2
  %r455 = load i32, ptr %r454, align 4
  %r457 = mul i32 %r455, -70
  %r458 = add i32 %r451, %r457
  %r459 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r460 = getelementptr i32, ptr %r459, i32 0
  %r461 = getelementptr i32, ptr %r460, i32 3
  %r462 = load i32, ptr %r461, align 4
  %r463 = mul i32 %r462, 29
  %r464 = add i32 %r458, %r463
  %r465 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r466 = getelementptr i32, ptr %r465, i32 0
  %r467 = getelementptr i32, ptr %r466, i32 4
  %r468 = load i32, ptr %r467, align 4
  %r470 = mul i32 %r468, -95
  %r471 = add i32 %r464, %r470
  %r472 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r473 = getelementptr i32, ptr %r472, i32 0
  %r474 = getelementptr i32, ptr %r473, i32 0
  %r475 = load i32, ptr %r474, align 4
  %r476 = mul i32 %r475, 96
  %r477 = add i32 %r471, %r476
  %r478 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r479 = getelementptr i32, ptr %r478, i32 0
  %r480 = getelementptr i32, ptr %r479, i32 1
  %r481 = load i32, ptr %r480, align 4
  %r482 = mul i32 %r481, 52
  %r483 = add i32 %r477, %r482
  %r484 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r485 = getelementptr i32, ptr %r484, i32 0
  %r486 = getelementptr i32, ptr %r485, i32 2
  %r487 = load i32, ptr %r486, align 4
  %r489 = mul i32 %r487, -68
  %r490 = add i32 %r483, %r489
  %r491 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r492 = getelementptr i32, ptr %r491, i32 0
  %r493 = getelementptr i32, ptr %r492, i32 3
  %r494 = load i32, ptr %r493, align 4
  %r496 = mul i32 %r494, -5
  %r497 = add i32 %r490, %r496
  %r498 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r499 = getelementptr i32, ptr %r498, i32 0
  %r500 = getelementptr i32, ptr %r499, i32 4
  %r501 = load i32, ptr %r500, align 4
  %r502 = mul i32 %r501, 34
  %r503 = add i32 %r497, %r502
  %r504 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r505 = getelementptr i32, ptr %r504, i32 0
  %r506 = getelementptr i32, ptr %r505, i32 0
  %r507 = load i32, ptr %r506, align 4
  %r509 = mul i32 %r507, -34
  %r510 = add i32 %r503, %r509
  %r511 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r512 = getelementptr i32, ptr %r511, i32 0
  %r513 = getelementptr i32, ptr %r512, i32 1
  %r514 = load i32, ptr %r513, align 4
  %r515 = mul i32 %r514, 102
  %r516 = add i32 %r510, %r515
  %r517 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r518 = getelementptr i32, ptr %r517, i32 0
  %r519 = getelementptr i32, ptr %r518, i32 2
  %r520 = load i32, ptr %r519, align 4
  %r521 = mul i32 %r520, 6
  %r522 = add i32 %r516, %r521
  %r523 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r524 = getelementptr i32, ptr %r523, i32 0
  %r525 = getelementptr i32, ptr %r524, i32 3
  %r526 = load i32, ptr %r525, align 4
  %r528 = mul i32 %r526, -38
  %r529 = add i32 %r522, %r528
  %r530 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r531 = getelementptr i32, ptr %r530, i32 0
  %r532 = getelementptr i32, ptr %r531, i32 4
  %r533 = load i32, ptr %r532, align 4
  %r534 = mul i32 %r533, 27
  %r535 = add i32 %r529, %r534
  %r536 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r537 = getelementptr i32, ptr %r536, i32 0
  %r538 = getelementptr i32, ptr %r537, i32 0
  %r539 = load i32, ptr %r538, align 4
  %r540 = mul i32 %r539, 110
  %r541 = add i32 %r535, %r540
  %r542 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r543 = getelementptr i32, ptr %r542, i32 0
  %r544 = getelementptr i32, ptr %r543, i32 1
  %r545 = load i32, ptr %r544, align 4
  %r546 = mul i32 %r545, 116
  %r547 = add i32 %r541, %r546
  %r548 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r549 = getelementptr i32, ptr %r548, i32 0
  %r550 = getelementptr i32, ptr %r549, i32 2
  %r551 = load i32, ptr %r550, align 4
  %r552 = mul i32 %r551, 39
  %r553 = add i32 %r547, %r552
  %r554 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r555 = getelementptr i32, ptr %r554, i32 0
  %r556 = getelementptr i32, ptr %r555, i32 3
  %r557 = load i32, ptr %r556, align 4
  %r559 = mul i32 %r557, -63
  %r560 = add i32 %r553, %r559
  %r561 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r562 = getelementptr i32, ptr %r561, i32 0
  %r563 = getelementptr i32, ptr %r562, i32 4
  %r564 = load i32, ptr %r563, align 4
  %r566 = mul i32 %r564, -99
  %r567 = add i32 %r560, %r566
  %r568 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r569 = getelementptr i32, ptr %r568, i32 0
  %r570 = getelementptr i32, ptr %r569, i32 0
  %r571 = load i32, ptr %r570, align 4
  %r572 = mul i32 %r571, 65
  %r573 = add i32 %r567, %r572
  %r574 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r575 = getelementptr i32, ptr %r574, i32 0
  %r576 = getelementptr i32, ptr %r575, i32 1
  %r577 = load i32, ptr %r576, align 4
  %r578 = mul i32 %r577, 120
  %r579 = add i32 %r573, %r578
  %r580 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r581 = getelementptr i32, ptr %r580, i32 0
  %r582 = getelementptr i32, ptr %r581, i32 2
  %r583 = load i32, ptr %r582, align 4
  %r585 = mul i32 %r583, -39
  %r586 = add i32 %r579, %r585
  %r587 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r588 = getelementptr i32, ptr %r587, i32 0
  %r589 = getelementptr i32, ptr %r588, i32 3
  %r590 = load i32, ptr %r589, align 4
  %r592 = mul i32 %r590, -6
  %r593 = add i32 %r586, %r592
  %r594 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r595 = getelementptr i32, ptr %r594, i32 0
  %r596 = getelementptr i32, ptr %r595, i32 4
  %r597 = load i32, ptr %r596, align 4
  %r598 = mul i32 %r597, 94
  %r599 = add i32 %r593, %r598
  %r600 = call i32 @relu_reg(i32 %r599)
  %r601 = mul i32 %r600, 127
  %r602 = add i32 %r440, %r601
  %r603 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r604 = getelementptr i32, ptr %r603, i32 0
  %r605 = getelementptr i32, ptr %r604, i32 0
  %r606 = load i32, ptr %r605, align 4
  %r608 = mul i32 %r606, -23
  %r609 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r610 = getelementptr i32, ptr %r609, i32 0
  %r611 = getelementptr i32, ptr %r610, i32 1
  %r612 = load i32, ptr %r611, align 4
  %r614 = mul i32 %r612, -63
  %r615 = add i32 %r608, %r614
  %r616 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r617 = getelementptr i32, ptr %r616, i32 0
  %r618 = getelementptr i32, ptr %r617, i32 2
  %r619 = load i32, ptr %r618, align 4
  %r620 = mul i32 %r619, 49
  %r621 = add i32 %r615, %r620
  %r622 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r623 = getelementptr i32, ptr %r622, i32 0
  %r624 = getelementptr i32, ptr %r623, i32 3
  %r625 = load i32, ptr %r624, align 4
  %r626 = mul i32 %r625, 50
  %r627 = add i32 %r621, %r626
  %r628 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r629 = getelementptr i32, ptr %r628, i32 0
  %r630 = getelementptr i32, ptr %r629, i32 4
  %r631 = load i32, ptr %r630, align 4
  %r632 = mul i32 %r631, 72
  %r633 = add i32 %r627, %r632
  %r634 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r635 = getelementptr i32, ptr %r634, i32 0
  %r636 = getelementptr i32, ptr %r635, i32 0
  %r637 = load i32, ptr %r636, align 4
  %r638 = mul i32 %r637, 85
  %r639 = add i32 %r633, %r638
  %r640 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r641 = getelementptr i32, ptr %r640, i32 0
  %r642 = getelementptr i32, ptr %r641, i32 1
  %r643 = load i32, ptr %r642, align 4
  %r645 = mul i32 %r643, -30
  %r646 = add i32 %r639, %r645
  %r647 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r648 = getelementptr i32, ptr %r647, i32 0
  %r649 = getelementptr i32, ptr %r648, i32 2
  %r650 = load i32, ptr %r649, align 4
  %r651 = mul i32 %r650, 12
  %r652 = add i32 %r646, %r651
  %r653 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r654 = getelementptr i32, ptr %r653, i32 0
  %r655 = getelementptr i32, ptr %r654, i32 3
  %r656 = load i32, ptr %r655, align 4
  %r657 = mul i32 %r656, 125
  %r658 = add i32 %r652, %r657
  %r659 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r660 = getelementptr i32, ptr %r659, i32 0
  %r661 = getelementptr i32, ptr %r660, i32 4
  %r662 = load i32, ptr %r661, align 4
  %r664 = mul i32 %r662, -117
  %r665 = add i32 %r658, %r664
  %r666 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r667 = getelementptr i32, ptr %r666, i32 0
  %r668 = getelementptr i32, ptr %r667, i32 0
  %r669 = load i32, ptr %r668, align 4
  %r671 = mul i32 %r669, -65
  %r672 = add i32 %r665, %r671
  %r673 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r674 = getelementptr i32, ptr %r673, i32 0
  %r675 = getelementptr i32, ptr %r674, i32 1
  %r676 = load i32, ptr %r675, align 4
  %r678 = mul i32 %r676, -67
  %r679 = add i32 %r672, %r678
  %r680 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r681 = getelementptr i32, ptr %r680, i32 0
  %r682 = getelementptr i32, ptr %r681, i32 2
  %r683 = load i32, ptr %r682, align 4
  %r684 = mul i32 %r683, 125
  %r685 = add i32 %r679, %r684
  %r686 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r687 = getelementptr i32, ptr %r686, i32 0
  %r688 = getelementptr i32, ptr %r687, i32 3
  %r689 = load i32, ptr %r688, align 4
  %r690 = mul i32 %r689, 110
  %r691 = add i32 %r685, %r690
  %r692 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r693 = getelementptr i32, ptr %r692, i32 0
  %r694 = getelementptr i32, ptr %r693, i32 4
  %r695 = load i32, ptr %r694, align 4
  %r697 = mul i32 %r695, -31
  %r698 = add i32 %r691, %r697
  %r699 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r700 = getelementptr i32, ptr %r699, i32 0
  %r701 = getelementptr i32, ptr %r700, i32 0
  %r702 = load i32, ptr %r701, align 4
  %r704 = mul i32 %r702, -123
  %r705 = add i32 %r698, %r704
  %r706 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r707 = getelementptr i32, ptr %r706, i32 0
  %r708 = getelementptr i32, ptr %r707, i32 1
  %r709 = load i32, ptr %r708, align 4
  %r710 = mul i32 %r709, 83
  %r711 = add i32 %r705, %r710
  %r712 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r713 = getelementptr i32, ptr %r712, i32 0
  %r714 = getelementptr i32, ptr %r713, i32 2
  %r715 = load i32, ptr %r714, align 4
  %r716 = mul i32 %r715, 122
  %r717 = add i32 %r711, %r716
  %r718 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r719 = getelementptr i32, ptr %r718, i32 0
  %r720 = getelementptr i32, ptr %r719, i32 3
  %r721 = load i32, ptr %r720, align 4
  %r722 = mul i32 %r721, 11
  %r723 = add i32 %r717, %r722
  %r724 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r725 = getelementptr i32, ptr %r724, i32 0
  %r726 = getelementptr i32, ptr %r725, i32 4
  %r727 = load i32, ptr %r726, align 4
  %r729 = mul i32 %r727, -23
  %r730 = add i32 %r723, %r729
  %r731 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r732 = getelementptr i32, ptr %r731, i32 0
  %r733 = getelementptr i32, ptr %r732, i32 0
  %r734 = load i32, ptr %r733, align 4
  %r736 = mul i32 %r734, -47
  %r737 = add i32 %r730, %r736
  %r738 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r739 = getelementptr i32, ptr %r738, i32 0
  %r740 = getelementptr i32, ptr %r739, i32 1
  %r741 = load i32, ptr %r740, align 4
  %r743 = mul i32 %r741, -32
  %r744 = add i32 %r737, %r743
  %r745 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r746 = getelementptr i32, ptr %r745, i32 0
  %r747 = getelementptr i32, ptr %r746, i32 2
  %r748 = load i32, ptr %r747, align 4
  %r750 = mul i32 %r748, -117
  %r751 = add i32 %r744, %r750
  %r752 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r753 = getelementptr i32, ptr %r752, i32 0
  %r754 = getelementptr i32, ptr %r753, i32 3
  %r755 = load i32, ptr %r754, align 4
  %r756 = mul i32 %r755, 95
  %r757 = add i32 %r751, %r756
  %r758 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r759 = getelementptr i32, ptr %r758, i32 0
  %r760 = getelementptr i32, ptr %r759, i32 4
  %r761 = load i32, ptr %r760, align 4
  %r762 = mul i32 %r761, 118
  %r763 = add i32 %r757, %r762
  %r764 = call i32 @relu_reg(i32 %r763)
  %r766 = mul i32 %r764, -106
  %r767 = add i32 %r602, %r766
  %r768 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r769 = getelementptr i32, ptr %r768, i32 0
  %r770 = getelementptr i32, ptr %r769, i32 0
  %r771 = load i32, ptr %r770, align 4
  %r772 = mul i32 %r771, 8
  %r773 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r774 = getelementptr i32, ptr %r773, i32 0
  %r775 = getelementptr i32, ptr %r774, i32 1
  %r776 = load i32, ptr %r775, align 4
  %r777 = mul i32 %r776, 82
  %r778 = add i32 %r772, %r777
  %r779 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r780 = getelementptr i32, ptr %r779, i32 0
  %r781 = getelementptr i32, ptr %r780, i32 2
  %r782 = load i32, ptr %r781, align 4
  %r784 = mul i32 %r782, -104
  %r785 = add i32 %r778, %r784
  %r786 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r787 = getelementptr i32, ptr %r786, i32 0
  %r788 = getelementptr i32, ptr %r787, i32 3
  %r789 = load i32, ptr %r788, align 4
  %r790 = mul i32 %r789, 101
  %r791 = add i32 %r785, %r790
  %r792 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r793 = getelementptr i32, ptr %r792, i32 0
  %r794 = getelementptr i32, ptr %r793, i32 4
  %r795 = load i32, ptr %r794, align 4
  %r797 = mul i32 %r795, -116
  %r798 = add i32 %r791, %r797
  %r799 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r800 = getelementptr i32, ptr %r799, i32 0
  %r801 = getelementptr i32, ptr %r800, i32 0
  %r802 = load i32, ptr %r801, align 4
  %r804 = mul i32 %r802, -63
  %r805 = add i32 %r798, %r804
  %r806 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r807 = getelementptr i32, ptr %r806, i32 0
  %r808 = getelementptr i32, ptr %r807, i32 1
  %r809 = load i32, ptr %r808, align 4
  %r811 = mul i32 %r809, -16
  %r812 = add i32 %r805, %r811
  %r813 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r814 = getelementptr i32, ptr %r813, i32 0
  %r815 = getelementptr i32, ptr %r814, i32 2
  %r816 = load i32, ptr %r815, align 4
  %r818 = mul i32 %r816, -70
  %r819 = add i32 %r812, %r818
  %r820 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r821 = getelementptr i32, ptr %r820, i32 0
  %r822 = getelementptr i32, ptr %r821, i32 3
  %r823 = load i32, ptr %r822, align 4
  %r824 = mul i32 %r823, 125
  %r825 = add i32 %r819, %r824
  %r826 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r827 = getelementptr i32, ptr %r826, i32 0
  %r828 = getelementptr i32, ptr %r827, i32 4
  %r829 = load i32, ptr %r828, align 4
  %r830 = mul i32 %r829, 75
  %r831 = add i32 %r825, %r830
  %r832 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r833 = getelementptr i32, ptr %r832, i32 0
  %r834 = getelementptr i32, ptr %r833, i32 0
  %r835 = load i32, ptr %r834, align 4
  %r836 = mul i32 %r835, 66
  %r837 = add i32 %r831, %r836
  %r838 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r839 = getelementptr i32, ptr %r838, i32 0
  %r840 = getelementptr i32, ptr %r839, i32 1
  %r841 = load i32, ptr %r840, align 4
  %r843 = mul i32 %r841, -96
  %r844 = add i32 %r837, %r843
  %r845 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r846 = getelementptr i32, ptr %r845, i32 0
  %r847 = getelementptr i32, ptr %r846, i32 2
  %r848 = load i32, ptr %r847, align 4
  %r850 = mul i32 %r848, -101
  %r851 = add i32 %r844, %r850
  %r852 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r853 = getelementptr i32, ptr %r852, i32 0
  %r854 = getelementptr i32, ptr %r853, i32 3
  %r855 = load i32, ptr %r854, align 4
  %r857 = mul i32 %r855, -114
  %r858 = add i32 %r851, %r857
  %r859 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r860 = getelementptr i32, ptr %r859, i32 0
  %r861 = getelementptr i32, ptr %r860, i32 4
  %r862 = load i32, ptr %r861, align 4
  %r863 = mul i32 %r862, 59
  %r864 = add i32 %r858, %r863
  %r865 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r866 = getelementptr i32, ptr %r865, i32 0
  %r867 = getelementptr i32, ptr %r866, i32 0
  %r868 = load i32, ptr %r867, align 4
  %r869 = mul i32 %r868, 12
  %r870 = add i32 %r864, %r869
  %r871 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r872 = getelementptr i32, ptr %r871, i32 0
  %r873 = getelementptr i32, ptr %r872, i32 1
  %r874 = load i32, ptr %r873, align 4
  %r875 = mul i32 %r874, 5
  %r876 = add i32 %r870, %r875
  %r877 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r878 = getelementptr i32, ptr %r877, i32 0
  %r879 = getelementptr i32, ptr %r878, i32 2
  %r880 = load i32, ptr %r879, align 4
  %r882 = mul i32 %r880, -95
  %r883 = add i32 %r876, %r882
  %r884 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r885 = getelementptr i32, ptr %r884, i32 0
  %r886 = getelementptr i32, ptr %r885, i32 3
  %r887 = load i32, ptr %r886, align 4
  %r888 = mul i32 %r887, 116
  %r889 = add i32 %r883, %r888
  %r890 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r891 = getelementptr i32, ptr %r890, i32 0
  %r892 = getelementptr i32, ptr %r891, i32 4
  %r893 = load i32, ptr %r892, align 4
  %r895 = mul i32 %r893, -93
  %r896 = add i32 %r889, %r895
  %r897 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r898 = getelementptr i32, ptr %r897, i32 0
  %r899 = getelementptr i32, ptr %r898, i32 0
  %r900 = load i32, ptr %r899, align 4
  %r901 = mul i32 %r900, 15
  %r902 = add i32 %r896, %r901
  %r903 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r904 = getelementptr i32, ptr %r903, i32 0
  %r905 = getelementptr i32, ptr %r904, i32 1
  %r906 = load i32, ptr %r905, align 4
  %r907 = mul i32 %r906, 79
  %r908 = add i32 %r902, %r907
  %r909 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r910 = getelementptr i32, ptr %r909, i32 0
  %r911 = getelementptr i32, ptr %r910, i32 2
  %r912 = load i32, ptr %r911, align 4
  %r913 = mul i32 %r912, 3
  %r914 = add i32 %r908, %r913
  %r915 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r916 = getelementptr i32, ptr %r915, i32 0
  %r917 = getelementptr i32, ptr %r916, i32 3
  %r918 = load i32, ptr %r917, align 4
  %r919 = mul i32 %r918, 49
  %r920 = add i32 %r914, %r919
  %r921 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r922 = getelementptr i32, ptr %r921, i32 0
  %r923 = getelementptr i32, ptr %r922, i32 4
  %r924 = load i32, ptr %r923, align 4
  %r926 = mul i32 %r924, -124
  %r927 = add i32 %r920, %r926
  %r928 = call i32 @relu_reg(i32 %r927)
  %r930 = mul i32 %r928, -3
  %r931 = add i32 %r767, %r930
  %r932 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r933 = getelementptr i32, ptr %r932, i32 0
  %r934 = getelementptr i32, ptr %r933, i32 0
  %r935 = load i32, ptr %r934, align 4
  %r936 = mul i32 %r935, 81
  %r937 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r938 = getelementptr i32, ptr %r937, i32 0
  %r939 = getelementptr i32, ptr %r938, i32 1
  %r940 = load i32, ptr %r939, align 4
  %r941 = mul i32 %r940, 68
  %r942 = add i32 %r936, %r941
  %r943 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r944 = getelementptr i32, ptr %r943, i32 0
  %r945 = getelementptr i32, ptr %r944, i32 2
  %r946 = load i32, ptr %r945, align 4
  %r948 = mul i32 %r946, -102
  %r949 = add i32 %r942, %r948
  %r950 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r951 = getelementptr i32, ptr %r950, i32 0
  %r952 = getelementptr i32, ptr %r951, i32 3
  %r953 = load i32, ptr %r952, align 4
  %r955 = mul i32 %r953, -74
  %r956 = add i32 %r949, %r955
  %r957 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r958 = getelementptr i32, ptr %r957, i32 0
  %r959 = getelementptr i32, ptr %r958, i32 4
  %r960 = load i32, ptr %r959, align 4
  %r961 = mul i32 %r960, 121
  %r962 = add i32 %r956, %r961
  %r963 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r964 = getelementptr i32, ptr %r963, i32 0
  %r965 = getelementptr i32, ptr %r964, i32 0
  %r966 = load i32, ptr %r965, align 4
  %r968 = mul i32 %r966, -15
  %r969 = add i32 %r962, %r968
  %r970 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r971 = getelementptr i32, ptr %r970, i32 0
  %r972 = getelementptr i32, ptr %r971, i32 1
  %r973 = load i32, ptr %r972, align 4
  %r974 = mul i32 %r973, 55
  %r975 = add i32 %r969, %r974
  %r976 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r977 = getelementptr i32, ptr %r976, i32 0
  %r978 = getelementptr i32, ptr %r977, i32 2
  %r979 = load i32, ptr %r978, align 4
  %r980 = mul i32 %r979, 101
  %r981 = add i32 %r975, %r980
  %r982 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r983 = getelementptr i32, ptr %r982, i32 0
  %r984 = getelementptr i32, ptr %r983, i32 3
  %r985 = load i32, ptr %r984, align 4
  %r987 = mul i32 %r985, -13
  %r988 = add i32 %r981, %r987
  %r989 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r990 = getelementptr i32, ptr %r989, i32 0
  %r991 = getelementptr i32, ptr %r990, i32 4
  %r992 = load i32, ptr %r991, align 4
  %r994 = mul i32 %r992, -62
  %r995 = add i32 %r988, %r994
  %r996 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r997 = getelementptr i32, ptr %r996, i32 0
  %r998 = getelementptr i32, ptr %r997, i32 0
  %r999 = load i32, ptr %r998, align 4
  %r1000 = mul i32 %r999, 64
  %r1001 = add i32 %r995, %r1000
  %r1002 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1003 = getelementptr i32, ptr %r1002, i32 0
  %r1004 = getelementptr i32, ptr %r1003, i32 1
  %r1005 = load i32, ptr %r1004, align 4
  %r1006 = mul i32 %r1005, 114
  %r1007 = add i32 %r1001, %r1006
  %r1008 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1009 = getelementptr i32, ptr %r1008, i32 0
  %r1010 = getelementptr i32, ptr %r1009, i32 2
  %r1011 = load i32, ptr %r1010, align 4
  %r1012 = mul i32 %r1011, 38
  %r1013 = add i32 %r1007, %r1012
  %r1014 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1015 = getelementptr i32, ptr %r1014, i32 0
  %r1016 = getelementptr i32, ptr %r1015, i32 3
  %r1017 = load i32, ptr %r1016, align 4
  %r1019 = mul i32 %r1017, -21
  %r1020 = add i32 %r1013, %r1019
  %r1021 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1022 = getelementptr i32, ptr %r1021, i32 0
  %r1023 = getelementptr i32, ptr %r1022, i32 4
  %r1024 = load i32, ptr %r1023, align 4
  %r1025 = mul i32 %r1024, 112
  %r1026 = add i32 %r1020, %r1025
  %r1027 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1028 = getelementptr i32, ptr %r1027, i32 0
  %r1029 = getelementptr i32, ptr %r1028, i32 0
  %r1030 = load i32, ptr %r1029, align 4
  %r1031 = mul i32 %r1030, 114
  %r1032 = add i32 %r1026, %r1031
  %r1033 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1034 = getelementptr i32, ptr %r1033, i32 0
  %r1035 = getelementptr i32, ptr %r1034, i32 1
  %r1036 = load i32, ptr %r1035, align 4
  %r1037 = mul i32 %r1036, 112
  %r1038 = add i32 %r1032, %r1037
  %r1039 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1040 = getelementptr i32, ptr %r1039, i32 0
  %r1041 = getelementptr i32, ptr %r1040, i32 2
  %r1042 = load i32, ptr %r1041, align 4
  %r1044 = mul i32 %r1042, -10
  %r1045 = add i32 %r1038, %r1044
  %r1046 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1047 = getelementptr i32, ptr %r1046, i32 0
  %r1048 = getelementptr i32, ptr %r1047, i32 3
  %r1049 = load i32, ptr %r1048, align 4
  %r1051 = mul i32 %r1049, -16
  %r1052 = add i32 %r1045, %r1051
  %r1053 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1054 = getelementptr i32, ptr %r1053, i32 0
  %r1055 = getelementptr i32, ptr %r1054, i32 4
  %r1056 = load i32, ptr %r1055, align 4
  %r1058 = mul i32 %r1056, -50
  %r1059 = add i32 %r1052, %r1058
  %r1060 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1061 = getelementptr i32, ptr %r1060, i32 0
  %r1062 = getelementptr i32, ptr %r1061, i32 0
  %r1063 = load i32, ptr %r1062, align 4
  %r1065 = mul i32 %r1063, -112
  %r1066 = add i32 %r1059, %r1065
  %r1067 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1068 = getelementptr i32, ptr %r1067, i32 0
  %r1069 = getelementptr i32, ptr %r1068, i32 1
  %r1070 = load i32, ptr %r1069, align 4
  %r1072 = mul i32 %r1070, -116
  %r1073 = add i32 %r1066, %r1072
  %r1074 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1075 = getelementptr i32, ptr %r1074, i32 0
  %r1076 = getelementptr i32, ptr %r1075, i32 2
  %r1077 = load i32, ptr %r1076, align 4
  %r1079 = mul i32 %r1077, -54
  %r1080 = add i32 %r1073, %r1079
  %r1081 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1082 = getelementptr i32, ptr %r1081, i32 0
  %r1083 = getelementptr i32, ptr %r1082, i32 3
  %r1084 = load i32, ptr %r1083, align 4
  %r1085 = mul i32 %r1084, 82
  %r1086 = add i32 %r1080, %r1085
  %r1087 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1088 = getelementptr i32, ptr %r1087, i32 0
  %r1089 = getelementptr i32, ptr %r1088, i32 4
  %r1090 = load i32, ptr %r1089, align 4
  %r1092 = mul i32 %r1090, -72
  %r1093 = add i32 %r1086, %r1092
  %r1094 = call i32 @relu_reg(i32 %r1093)
  %r1095 = mul i32 %r1094, 32
  %r1096 = add i32 %r931, %r1095
  %r1097 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1098 = getelementptr i32, ptr %r1097, i32 0
  %r1099 = getelementptr i32, ptr %r1098, i32 0
  %r1100 = load i32, ptr %r1099, align 4
  %r1101 = mul i32 %r1100, 15
  %r1102 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1103 = getelementptr i32, ptr %r1102, i32 0
  %r1104 = getelementptr i32, ptr %r1103, i32 1
  %r1105 = load i32, ptr %r1104, align 4
  %r1107 = mul i32 %r1105, -77
  %r1108 = add i32 %r1101, %r1107
  %r1109 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1110 = getelementptr i32, ptr %r1109, i32 0
  %r1111 = getelementptr i32, ptr %r1110, i32 2
  %r1112 = load i32, ptr %r1111, align 4
  %r1113 = mul i32 %r1112, 66
  %r1114 = add i32 %r1108, %r1113
  %r1115 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1116 = getelementptr i32, ptr %r1115, i32 0
  %r1117 = getelementptr i32, ptr %r1116, i32 3
  %r1118 = load i32, ptr %r1117, align 4
  %r1120 = mul i32 %r1118, -90
  %r1121 = add i32 %r1114, %r1120
  %r1122 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1123 = getelementptr i32, ptr %r1122, i32 0
  %r1124 = getelementptr i32, ptr %r1123, i32 4
  %r1125 = load i32, ptr %r1124, align 4
  %r1127 = mul i32 %r1125, -6
  %r1128 = add i32 %r1121, %r1127
  %r1129 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1130 = getelementptr i32, ptr %r1129, i32 0
  %r1131 = getelementptr i32, ptr %r1130, i32 0
  %r1132 = load i32, ptr %r1131, align 4
  %r1134 = mul i32 %r1132, -30
  %r1135 = add i32 %r1128, %r1134
  %r1136 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1137 = getelementptr i32, ptr %r1136, i32 0
  %r1138 = getelementptr i32, ptr %r1137, i32 1
  %r1139 = load i32, ptr %r1138, align 4
  %r1141 = mul i32 %r1139, -8
  %r1142 = add i32 %r1135, %r1141
  %r1143 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1144 = getelementptr i32, ptr %r1143, i32 0
  %r1145 = getelementptr i32, ptr %r1144, i32 2
  %r1146 = load i32, ptr %r1145, align 4
  %r1147 = mul i32 %r1146, 81
  %r1148 = add i32 %r1142, %r1147
  %r1149 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1150 = getelementptr i32, ptr %r1149, i32 0
  %r1151 = getelementptr i32, ptr %r1150, i32 3
  %r1152 = load i32, ptr %r1151, align 4
  %r1153 = mul i32 %r1152, 2
  %r1154 = add i32 %r1148, %r1153
  %r1155 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1156 = getelementptr i32, ptr %r1155, i32 0
  %r1157 = getelementptr i32, ptr %r1156, i32 4
  %r1158 = load i32, ptr %r1157, align 4
  %r1160 = mul i32 %r1158, -110
  %r1161 = add i32 %r1154, %r1160
  %r1162 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1163 = getelementptr i32, ptr %r1162, i32 0
  %r1164 = getelementptr i32, ptr %r1163, i32 0
  %r1165 = load i32, ptr %r1164, align 4
  %r1167 = mul i32 %r1165, -95
  %r1168 = add i32 %r1161, %r1167
  %r1169 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1170 = getelementptr i32, ptr %r1169, i32 0
  %r1171 = getelementptr i32, ptr %r1170, i32 1
  %r1172 = load i32, ptr %r1171, align 4
  %r1173 = mul i32 %r1172, 59
  %r1174 = add i32 %r1168, %r1173
  %r1175 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1176 = getelementptr i32, ptr %r1175, i32 0
  %r1177 = getelementptr i32, ptr %r1176, i32 2
  %r1178 = load i32, ptr %r1177, align 4
  %r1179 = mul i32 %r1178, 52
  %r1180 = add i32 %r1174, %r1179
  %r1181 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1182 = getelementptr i32, ptr %r1181, i32 0
  %r1183 = getelementptr i32, ptr %r1182, i32 3
  %r1184 = load i32, ptr %r1183, align 4
  %r1185 = mul i32 %r1184, 15
  %r1186 = add i32 %r1180, %r1185
  %r1187 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1188 = getelementptr i32, ptr %r1187, i32 0
  %r1189 = getelementptr i32, ptr %r1188, i32 4
  %r1190 = load i32, ptr %r1189, align 4
  %r1191 = mul i32 %r1190, 55
  %r1192 = add i32 %r1186, %r1191
  %r1193 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1194 = getelementptr i32, ptr %r1193, i32 0
  %r1195 = getelementptr i32, ptr %r1194, i32 0
  %r1196 = load i32, ptr %r1195, align 4
  %r1198 = mul i32 %r1196, -33
  %r1199 = add i32 %r1192, %r1198
  %r1200 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1201 = getelementptr i32, ptr %r1200, i32 0
  %r1202 = getelementptr i32, ptr %r1201, i32 1
  %r1203 = load i32, ptr %r1202, align 4
  %r1204 = mul i32 %r1203, 14
  %r1205 = add i32 %r1199, %r1204
  %r1206 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1207 = getelementptr i32, ptr %r1206, i32 0
  %r1208 = getelementptr i32, ptr %r1207, i32 2
  %r1209 = load i32, ptr %r1208, align 4
  %r1210 = mul i32 %r1209, 58
  %r1211 = add i32 %r1205, %r1210
  %r1212 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1213 = getelementptr i32, ptr %r1212, i32 0
  %r1214 = getelementptr i32, ptr %r1213, i32 3
  %r1215 = load i32, ptr %r1214, align 4
  %r1216 = mul i32 %r1215, 67
  %r1217 = add i32 %r1211, %r1216
  %r1218 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1219 = getelementptr i32, ptr %r1218, i32 0
  %r1220 = getelementptr i32, ptr %r1219, i32 4
  %r1221 = load i32, ptr %r1220, align 4
  %r1222 = mul i32 %r1221, 86
  %r1223 = add i32 %r1217, %r1222
  %r1224 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1225 = getelementptr i32, ptr %r1224, i32 0
  %r1226 = getelementptr i32, ptr %r1225, i32 0
  %r1227 = load i32, ptr %r1226, align 4
  %r1229 = mul i32 %r1227, -79
  %r1230 = add i32 %r1223, %r1229
  %r1231 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1232 = getelementptr i32, ptr %r1231, i32 0
  %r1233 = getelementptr i32, ptr %r1232, i32 1
  %r1234 = load i32, ptr %r1233, align 4
  %r1235 = mul i32 %r1234, 48
  %r1236 = add i32 %r1230, %r1235
  %r1237 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1238 = getelementptr i32, ptr %r1237, i32 0
  %r1239 = getelementptr i32, ptr %r1238, i32 2
  %r1240 = load i32, ptr %r1239, align 4
  %r1242 = mul i32 %r1240, -13
  %r1243 = add i32 %r1236, %r1242
  %r1244 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1245 = getelementptr i32, ptr %r1244, i32 0
  %r1246 = getelementptr i32, ptr %r1245, i32 3
  %r1247 = load i32, ptr %r1246, align 4
  %r1249 = mul i32 %r1247, -15
  %r1250 = add i32 %r1243, %r1249
  %r1251 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1252 = getelementptr i32, ptr %r1251, i32 0
  %r1253 = getelementptr i32, ptr %r1252, i32 4
  %r1254 = load i32, ptr %r1253, align 4
  %r1255 = mul i32 %r1254, 66
  %r1256 = add i32 %r1250, %r1255
  %r1257 = call i32 @relu_reg(i32 %r1256)
  %r1259 = mul i32 %r1257, -95
  %r1260 = add i32 %r1096, %r1259
  %r1261 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1262 = getelementptr i32, ptr %r1261, i32 0
  %r1263 = getelementptr i32, ptr %r1262, i32 0
  %r1264 = load i32, ptr %r1263, align 4
  %r1265 = mul i32 %r1264, 33
  %r1266 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1267 = getelementptr i32, ptr %r1266, i32 0
  %r1268 = getelementptr i32, ptr %r1267, i32 1
  %r1269 = load i32, ptr %r1268, align 4
  %r1270 = mul i32 %r1269, 82
  %r1271 = add i32 %r1265, %r1270
  %r1272 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1273 = getelementptr i32, ptr %r1272, i32 0
  %r1274 = getelementptr i32, ptr %r1273, i32 2
  %r1275 = load i32, ptr %r1274, align 4
  %r1276 = mul i32 %r1275, 67
  %r1277 = add i32 %r1271, %r1276
  %r1278 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1279 = getelementptr i32, ptr %r1278, i32 0
  %r1280 = getelementptr i32, ptr %r1279, i32 3
  %r1281 = load i32, ptr %r1280, align 4
  %r1282 = mul i32 %r1281, 30
  %r1283 = add i32 %r1277, %r1282
  %r1284 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1285 = getelementptr i32, ptr %r1284, i32 0
  %r1286 = getelementptr i32, ptr %r1285, i32 4
  %r1287 = load i32, ptr %r1286, align 4
  %r1289 = mul i32 %r1287, -2
  %r1290 = add i32 %r1283, %r1289
  %r1291 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1292 = getelementptr i32, ptr %r1291, i32 0
  %r1293 = getelementptr i32, ptr %r1292, i32 0
  %r1294 = load i32, ptr %r1293, align 4
  %r1295 = mul i32 %r1294, 65
  %r1296 = add i32 %r1290, %r1295
  %r1297 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1298 = getelementptr i32, ptr %r1297, i32 0
  %r1299 = getelementptr i32, ptr %r1298, i32 1
  %r1300 = load i32, ptr %r1299, align 4
  %r1301 = mul i32 %r1300, 120
  %r1302 = add i32 %r1296, %r1301
  %r1303 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1304 = getelementptr i32, ptr %r1303, i32 0
  %r1305 = getelementptr i32, ptr %r1304, i32 2
  %r1306 = load i32, ptr %r1305, align 4
  %r1308 = mul i32 %r1306, -13
  %r1309 = add i32 %r1302, %r1308
  %r1310 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1311 = getelementptr i32, ptr %r1310, i32 0
  %r1312 = getelementptr i32, ptr %r1311, i32 3
  %r1313 = load i32, ptr %r1312, align 4
  %r1314 = mul i32 %r1313, 18
  %r1315 = add i32 %r1309, %r1314
  %r1316 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1317 = getelementptr i32, ptr %r1316, i32 0
  %r1318 = getelementptr i32, ptr %r1317, i32 4
  %r1319 = load i32, ptr %r1318, align 4
  %r1320 = mul i32 %r1319, 5
  %r1321 = add i32 %r1315, %r1320
  %r1322 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1323 = getelementptr i32, ptr %r1322, i32 0
  %r1324 = getelementptr i32, ptr %r1323, i32 0
  %r1325 = load i32, ptr %r1324, align 4
  %r1326 = mul i32 %r1325, 104
  %r1327 = add i32 %r1321, %r1326
  %r1328 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1329 = getelementptr i32, ptr %r1328, i32 0
  %r1330 = getelementptr i32, ptr %r1329, i32 1
  %r1331 = load i32, ptr %r1330, align 4
  %r1333 = mul i32 %r1331, -119
  %r1334 = add i32 %r1327, %r1333
  %r1335 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1336 = getelementptr i32, ptr %r1335, i32 0
  %r1337 = getelementptr i32, ptr %r1336, i32 2
  %r1338 = load i32, ptr %r1337, align 4
  %r1340 = mul i32 %r1338, -7
  %r1341 = add i32 %r1334, %r1340
  %r1342 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1343 = getelementptr i32, ptr %r1342, i32 0
  %r1344 = getelementptr i32, ptr %r1343, i32 3
  %r1345 = load i32, ptr %r1344, align 4
  %r1346 = mul i32 %r1345, 71
  %r1347 = add i32 %r1341, %r1346
  %r1348 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1349 = getelementptr i32, ptr %r1348, i32 0
  %r1350 = getelementptr i32, ptr %r1349, i32 4
  %r1351 = load i32, ptr %r1350, align 4
  %r1352 = mul i32 %r1351, 107
  %r1353 = add i32 %r1347, %r1352
  %r1354 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1355 = getelementptr i32, ptr %r1354, i32 0
  %r1356 = getelementptr i32, ptr %r1355, i32 0
  %r1357 = load i32, ptr %r1356, align 4
  %r1358 = mul i32 %r1357, 24
  %r1359 = add i32 %r1353, %r1358
  %r1360 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1361 = getelementptr i32, ptr %r1360, i32 0
  %r1362 = getelementptr i32, ptr %r1361, i32 1
  %r1363 = load i32, ptr %r1362, align 4
  %r1364 = mul i32 %r1363, 82
  %r1365 = add i32 %r1359, %r1364
  %r1366 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1367 = getelementptr i32, ptr %r1366, i32 0
  %r1368 = getelementptr i32, ptr %r1367, i32 2
  %r1369 = load i32, ptr %r1368, align 4
  %r1371 = mul i32 %r1369, -96
  %r1372 = add i32 %r1365, %r1371
  %r1373 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1374 = getelementptr i32, ptr %r1373, i32 0
  %r1375 = getelementptr i32, ptr %r1374, i32 3
  %r1376 = load i32, ptr %r1375, align 4
  %r1378 = mul i32 %r1376, -104
  %r1379 = add i32 %r1372, %r1378
  %r1380 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1381 = getelementptr i32, ptr %r1380, i32 0
  %r1382 = getelementptr i32, ptr %r1381, i32 4
  %r1383 = load i32, ptr %r1382, align 4
  %r1385 = mul i32 %r1383, -121
  %r1386 = add i32 %r1379, %r1385
  %r1387 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1388 = getelementptr i32, ptr %r1387, i32 0
  %r1389 = getelementptr i32, ptr %r1388, i32 0
  %r1390 = load i32, ptr %r1389, align 4
  %r1391 = mul i32 %r1390, 65
  %r1392 = add i32 %r1386, %r1391
  %r1393 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1394 = getelementptr i32, ptr %r1393, i32 0
  %r1395 = getelementptr i32, ptr %r1394, i32 1
  %r1396 = load i32, ptr %r1395, align 4
  %r1397 = mul i32 %r1396, 97
  %r1398 = add i32 %r1392, %r1397
  %r1399 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1400 = getelementptr i32, ptr %r1399, i32 0
  %r1401 = getelementptr i32, ptr %r1400, i32 2
  %r1402 = load i32, ptr %r1401, align 4
  %r1403 = mul i32 %r1402, 83
  %r1404 = add i32 %r1398, %r1403
  %r1405 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1406 = getelementptr i32, ptr %r1405, i32 0
  %r1407 = getelementptr i32, ptr %r1406, i32 3
  %r1408 = load i32, ptr %r1407, align 4
  %r1409 = mul i32 %r1408, 46
  %r1410 = add i32 %r1404, %r1409
  %r1411 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1412 = getelementptr i32, ptr %r1411, i32 0
  %r1413 = getelementptr i32, ptr %r1412, i32 4
  %r1414 = load i32, ptr %r1413, align 4
  %r1416 = mul i32 %r1414, -84
  %r1417 = add i32 %r1410, %r1416
  %r1418 = call i32 @relu_reg(i32 %r1417)
  %r1420 = mul i32 %r1418, -50
  %r1421 = add i32 %r1260, %r1420
  %r1422 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1423 = getelementptr i32, ptr %r1422, i32 0
  %r1424 = getelementptr i32, ptr %r1423, i32 0
  %r1425 = load i32, ptr %r1424, align 4
  %r1427 = mul i32 %r1425, -29
  %r1428 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1429 = getelementptr i32, ptr %r1428, i32 0
  %r1430 = getelementptr i32, ptr %r1429, i32 1
  %r1431 = load i32, ptr %r1430, align 4
  %r1432 = mul i32 %r1431, 7
  %r1433 = add i32 %r1427, %r1432
  %r1434 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1435 = getelementptr i32, ptr %r1434, i32 0
  %r1436 = getelementptr i32, ptr %r1435, i32 2
  %r1437 = load i32, ptr %r1436, align 4
  %r1439 = mul i32 %r1437, -70
  %r1440 = add i32 %r1433, %r1439
  %r1441 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1442 = getelementptr i32, ptr %r1441, i32 0
  %r1443 = getelementptr i32, ptr %r1442, i32 3
  %r1444 = load i32, ptr %r1443, align 4
  %r1445 = mul i32 %r1444, 38
  %r1446 = add i32 %r1440, %r1445
  %r1447 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1448 = getelementptr i32, ptr %r1447, i32 0
  %r1449 = getelementptr i32, ptr %r1448, i32 4
  %r1450 = load i32, ptr %r1449, align 4
  %r1452 = mul i32 %r1450, -90
  %r1453 = add i32 %r1446, %r1452
  %r1454 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1455 = getelementptr i32, ptr %r1454, i32 0
  %r1456 = getelementptr i32, ptr %r1455, i32 0
  %r1457 = load i32, ptr %r1456, align 4
  %r1459 = mul i32 %r1457, -15
  %r1460 = add i32 %r1453, %r1459
  %r1461 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1462 = getelementptr i32, ptr %r1461, i32 0
  %r1463 = getelementptr i32, ptr %r1462, i32 1
  %r1464 = load i32, ptr %r1463, align 4
  %r1466 = mul i32 %r1464, -32
  %r1467 = add i32 %r1460, %r1466
  %r1468 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1469 = getelementptr i32, ptr %r1468, i32 0
  %r1470 = getelementptr i32, ptr %r1469, i32 2
  %r1471 = load i32, ptr %r1470, align 4
  %r1472 = mul i32 %r1471, 37
  %r1473 = add i32 %r1467, %r1472
  %r1474 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1475 = getelementptr i32, ptr %r1474, i32 0
  %r1476 = getelementptr i32, ptr %r1475, i32 3
  %r1477 = load i32, ptr %r1476, align 4
  %r1478 = mul i32 %r1477, 36
  %r1479 = add i32 %r1473, %r1478
  %r1480 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1481 = getelementptr i32, ptr %r1480, i32 0
  %r1482 = getelementptr i32, ptr %r1481, i32 4
  %r1483 = load i32, ptr %r1482, align 4
  %r1485 = mul i32 %r1483, -62
  %r1486 = add i32 %r1479, %r1485
  %r1487 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1488 = getelementptr i32, ptr %r1487, i32 0
  %r1489 = getelementptr i32, ptr %r1488, i32 0
  %r1490 = load i32, ptr %r1489, align 4
  %r1492 = mul i32 %r1490, -125
  %r1493 = add i32 %r1486, %r1492
  %r1494 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1495 = getelementptr i32, ptr %r1494, i32 0
  %r1496 = getelementptr i32, ptr %r1495, i32 1
  %r1497 = load i32, ptr %r1496, align 4
  %r1499 = mul i32 %r1497, -46
  %r1500 = add i32 %r1493, %r1499
  %r1501 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1502 = getelementptr i32, ptr %r1501, i32 0
  %r1503 = getelementptr i32, ptr %r1502, i32 2
  %r1504 = load i32, ptr %r1503, align 4
  %r1506 = mul i32 %r1504, -70
  %r1507 = add i32 %r1500, %r1506
  %r1508 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1509 = getelementptr i32, ptr %r1508, i32 0
  %r1510 = getelementptr i32, ptr %r1509, i32 3
  %r1511 = load i32, ptr %r1510, align 4
  %r1512 = mul i32 %r1511, 37
  %r1513 = add i32 %r1507, %r1512
  %r1514 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1515 = getelementptr i32, ptr %r1514, i32 0
  %r1516 = getelementptr i32, ptr %r1515, i32 4
  %r1517 = load i32, ptr %r1516, align 4
  %r1519 = mul i32 %r1517, -73
  %r1520 = add i32 %r1513, %r1519
  %r1521 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1522 = getelementptr i32, ptr %r1521, i32 0
  %r1523 = getelementptr i32, ptr %r1522, i32 0
  %r1524 = load i32, ptr %r1523, align 4
  %r1526 = mul i32 %r1524, -34
  %r1527 = add i32 %r1520, %r1526
  %r1528 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1529 = getelementptr i32, ptr %r1528, i32 0
  %r1530 = getelementptr i32, ptr %r1529, i32 1
  %r1531 = load i32, ptr %r1530, align 4
  %r1533 = mul i32 %r1531, -87
  %r1534 = add i32 %r1527, %r1533
  %r1535 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1536 = getelementptr i32, ptr %r1535, i32 0
  %r1537 = getelementptr i32, ptr %r1536, i32 2
  %r1538 = load i32, ptr %r1537, align 4
  %r1540 = mul i32 %r1538, -75
  %r1541 = add i32 %r1534, %r1540
  %r1542 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1543 = getelementptr i32, ptr %r1542, i32 0
  %r1544 = getelementptr i32, ptr %r1543, i32 3
  %r1545 = load i32, ptr %r1544, align 4
  %r1546 = mul i32 %r1545, 71
  %r1547 = add i32 %r1541, %r1546
  %r1548 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1549 = getelementptr i32, ptr %r1548, i32 0
  %r1550 = getelementptr i32, ptr %r1549, i32 4
  %r1551 = load i32, ptr %r1550, align 4
  %r1553 = mul i32 %r1551, -77
  %r1554 = add i32 %r1547, %r1553
  %r1555 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1556 = getelementptr i32, ptr %r1555, i32 0
  %r1557 = getelementptr i32, ptr %r1556, i32 0
  %r1558 = load i32, ptr %r1557, align 4
  %r1559 = mul i32 %r1558, 53
  %r1560 = add i32 %r1554, %r1559
  %r1561 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1562 = getelementptr i32, ptr %r1561, i32 0
  %r1563 = getelementptr i32, ptr %r1562, i32 1
  %r1564 = load i32, ptr %r1563, align 4
  %r1565 = mul i32 %r1564, 37
  %r1566 = add i32 %r1560, %r1565
  %r1567 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1568 = getelementptr i32, ptr %r1567, i32 0
  %r1569 = getelementptr i32, ptr %r1568, i32 2
  %r1570 = load i32, ptr %r1569, align 4
  %r1572 = mul i32 %r1570, -103
  %r1573 = add i32 %r1566, %r1572
  %r1574 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1575 = getelementptr i32, ptr %r1574, i32 0
  %r1576 = getelementptr i32, ptr %r1575, i32 3
  %r1577 = load i32, ptr %r1576, align 4
  %r1579 = mul i32 %r1577, -13
  %r1580 = add i32 %r1573, %r1579
  %r1581 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1582 = getelementptr i32, ptr %r1581, i32 0
  %r1583 = getelementptr i32, ptr %r1582, i32 4
  %r1584 = load i32, ptr %r1583, align 4
  %r1586 = mul i32 %r1584, -114
  %r1587 = add i32 %r1580, %r1586
  %r1588 = call i32 @relu_reg(i32 %r1587)
  %r1590 = mul i32 %r1588, -23
  %r1591 = add i32 %r1421, %r1590
  %r1592 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1593 = getelementptr i32, ptr %r1592, i32 0
  %r1594 = getelementptr i32, ptr %r1593, i32 0
  %r1595 = load i32, ptr %r1594, align 4
  %r1596 = mul i32 %r1595, 67
  %r1597 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1598 = getelementptr i32, ptr %r1597, i32 0
  %r1599 = getelementptr i32, ptr %r1598, i32 1
  %r1600 = load i32, ptr %r1599, align 4
  %r1601 = mul i32 %r1600, 42
  %r1602 = add i32 %r1596, %r1601
  %r1603 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1604 = getelementptr i32, ptr %r1603, i32 0
  %r1605 = getelementptr i32, ptr %r1604, i32 2
  %r1606 = load i32, ptr %r1605, align 4
  %r1607 = mul i32 %r1606, 41
  %r1608 = add i32 %r1602, %r1607
  %r1609 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1610 = getelementptr i32, ptr %r1609, i32 0
  %r1611 = getelementptr i32, ptr %r1610, i32 3
  %r1612 = load i32, ptr %r1611, align 4
  %r1614 = mul i32 %r1612, -123
  %r1615 = add i32 %r1608, %r1614
  %r1616 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 0
  %r1617 = getelementptr i32, ptr %r1616, i32 0
  %r1618 = getelementptr i32, ptr %r1617, i32 4
  %r1619 = load i32, ptr %r1618, align 4
  %r1621 = mul i32 %r1619, -92
  %r1622 = add i32 %r1615, %r1621
  %r1623 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1624 = getelementptr i32, ptr %r1623, i32 0
  %r1625 = getelementptr i32, ptr %r1624, i32 0
  %r1626 = load i32, ptr %r1625, align 4
  %r1627 = mul i32 %r1626, 10
  %r1628 = add i32 %r1622, %r1627
  %r1629 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1630 = getelementptr i32, ptr %r1629, i32 0
  %r1631 = getelementptr i32, ptr %r1630, i32 1
  %r1632 = load i32, ptr %r1631, align 4
  %r1634 = mul i32 %r1632, -77
  %r1635 = add i32 %r1628, %r1634
  %r1636 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1637 = getelementptr i32, ptr %r1636, i32 0
  %r1638 = getelementptr i32, ptr %r1637, i32 2
  %r1639 = load i32, ptr %r1638, align 4
  %r1640 = mul i32 %r1639, 75
  %r1641 = add i32 %r1635, %r1640
  %r1642 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1643 = getelementptr i32, ptr %r1642, i32 0
  %r1644 = getelementptr i32, ptr %r1643, i32 3
  %r1645 = load i32, ptr %r1644, align 4
  %r1646 = mul i32 %r1645, 96
  %r1647 = add i32 %r1641, %r1646
  %r1648 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 1
  %r1649 = getelementptr i32, ptr %r1648, i32 0
  %r1650 = getelementptr i32, ptr %r1649, i32 4
  %r1651 = load i32, ptr %r1650, align 4
  %r1653 = mul i32 %r1651, -51
  %r1654 = add i32 %r1647, %r1653
  %r1655 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1656 = getelementptr i32, ptr %r1655, i32 0
  %r1657 = getelementptr i32, ptr %r1656, i32 0
  %r1658 = load i32, ptr %r1657, align 4
  %r1659 = mul i32 %r1658, 109
  %r1660 = add i32 %r1654, %r1659
  %r1661 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1662 = getelementptr i32, ptr %r1661, i32 0
  %r1663 = getelementptr i32, ptr %r1662, i32 1
  %r1664 = load i32, ptr %r1663, align 4
  %r1666 = mul i32 %r1664, -74
  %r1667 = add i32 %r1660, %r1666
  %r1668 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1669 = getelementptr i32, ptr %r1668, i32 0
  %r1670 = getelementptr i32, ptr %r1669, i32 2
  %r1671 = load i32, ptr %r1670, align 4
  %r1673 = mul i32 %r1671, -7
  %r1674 = add i32 %r1667, %r1673
  %r1675 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1676 = getelementptr i32, ptr %r1675, i32 0
  %r1677 = getelementptr i32, ptr %r1676, i32 3
  %r1678 = load i32, ptr %r1677, align 4
  %r1680 = mul i32 %r1678, -122
  %r1681 = add i32 %r1674, %r1680
  %r1682 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 2
  %r1683 = getelementptr i32, ptr %r1682, i32 0
  %r1684 = getelementptr i32, ptr %r1683, i32 4
  %r1685 = load i32, ptr %r1684, align 4
  %r1686 = mul i32 %r1685, 67
  %r1687 = add i32 %r1681, %r1686
  %r1688 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1689 = getelementptr i32, ptr %r1688, i32 0
  %r1690 = getelementptr i32, ptr %r1689, i32 0
  %r1691 = load i32, ptr %r1690, align 4
  %r1692 = mul i32 %r1691, 47
  %r1693 = add i32 %r1687, %r1692
  %r1694 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1695 = getelementptr i32, ptr %r1694, i32 0
  %r1696 = getelementptr i32, ptr %r1695, i32 1
  %r1697 = load i32, ptr %r1696, align 4
  %r1698 = mul i32 %r1697, 22
  %r1699 = add i32 %r1693, %r1698
  %r1700 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1701 = getelementptr i32, ptr %r1700, i32 0
  %r1702 = getelementptr i32, ptr %r1701, i32 2
  %r1703 = load i32, ptr %r1702, align 4
  %r1705 = mul i32 %r1703, -68
  %r1706 = add i32 %r1699, %r1705
  %r1707 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1708 = getelementptr i32, ptr %r1707, i32 0
  %r1709 = getelementptr i32, ptr %r1708, i32 3
  %r1710 = load i32, ptr %r1709, align 4
  %r1711 = mul i32 %r1710, 38
  %r1712 = add i32 %r1706, %r1711
  %r1713 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 3
  %r1714 = getelementptr i32, ptr %r1713, i32 0
  %r1715 = getelementptr i32, ptr %r1714, i32 4
  %r1716 = load i32, ptr %r1715, align 4
  %r1717 = mul i32 %r1716, 29
  %r1718 = add i32 %r1712, %r1717
  %r1719 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1720 = getelementptr i32, ptr %r1719, i32 0
  %r1721 = getelementptr i32, ptr %r1720, i32 0
  %r1722 = load i32, ptr %r1721, align 4
  %r1723 = mul i32 %r1722, 115
  %r1724 = add i32 %r1718, %r1723
  %r1725 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1726 = getelementptr i32, ptr %r1725, i32 0
  %r1727 = getelementptr i32, ptr %r1726, i32 1
  %r1728 = load i32, ptr %r1727, align 4
  %r1730 = mul i32 %r1728, -121
  %r1731 = add i32 %r1724, %r1730
  %r1732 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1733 = getelementptr i32, ptr %r1732, i32 0
  %r1734 = getelementptr i32, ptr %r1733, i32 2
  %r1735 = load i32, ptr %r1734, align 4
  %r1736 = mul i32 %r1735, 36
  %r1737 = add i32 %r1731, %r1736
  %r1738 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1739 = getelementptr i32, ptr %r1738, i32 0
  %r1740 = getelementptr i32, ptr %r1739, i32 3
  %r1741 = load i32, ptr %r1740, align 4
  %r1743 = mul i32 %r1741, -49
  %r1744 = add i32 %r1737, %r1743
  %r1745 = getelementptr [5 x %array2D], ptr %r107, i32 0, i32 4
  %r1746 = getelementptr i32, ptr %r1745, i32 0
  %r1747 = getelementptr i32, ptr %r1746, i32 4
  %r1748 = load i32, ptr %r1747, align 4
  %r1749 = mul i32 %r1748, 85
  %r1750 = add i32 %r1744, %r1749
  %r1751 = call i32 @relu_reg(i32 %r1750)
  %r1752 = mul i32 %r1751, 46
  %r1753 = add i32 %r1591, %r1752
  %r1754 = icmp sgt i32 %r1753, 0
  br i1 %r1754, label %bb7, label %bb8

bb7:                                              ; preds = %model
  ret i32 1

bb8:                                              ; preds = %model
  br label %bb9

bb9:                                              ; preds = %bb8
  ret i32 0
}

define i32 @main() {
main:
  %r1755 = alloca i32, align 4
  %r1763 = alloca i32, align 4
  %r1760 = alloca i32, align 4
  %r1756 = call i32 @getint()
  store i32 %r1756, ptr %r1755, align 4
  %r1757 = alloca [5 x %array2D], align 8
  br label %bb10

bb10:                                             ; preds = %bb21, %main
  %r1758 = load i32, ptr %r1755, align 4
  %r1759 = icmp sgt i32 %r1758, 0
  br i1 %r1759, label %bb11, label %bb12

bb11:                                             ; preds = %bb10
  store i32 0, ptr %r1760, align 4
  br label %bb13

bb13:                                             ; preds = %bb18, %bb11
  %r1761 = load i32, ptr %r1760, align 4
  %r1762 = icmp slt i32 %r1761, 5
  br i1 %r1762, label %bb14, label %bb15

bb14:                                             ; preds = %bb13
  store i32 0, ptr %r1763, align 4
  br label %bb16

bb16:                                             ; preds = %bb17, %bb14
  %r1764 = load i32, ptr %r1763, align 4
  %r1765 = icmp slt i32 %r1764, 5
  br i1 %r1765, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  %r1766 = call i32 @getint()
  %r1768 = load i32, ptr %r1760, align 4
  %r1767 = getelementptr [5 x %array2D], ptr %r1757, i32 0, i32 %r1768
  %r1769 = getelementptr i32, ptr %r1767, i32 0
  %r1771 = load i32, ptr %r1763, align 4
  %r1770 = getelementptr i32, ptr %r1769, i32 %r1771
  store i32 %r1766, ptr %r1770, align 4
  %r1772 = load i32, ptr %r1763, align 4
  %r1773 = add i32 %r1772, 1
  store i32 %r1773, ptr %r1763, align 4
  br label %bb16

bb18:                                             ; preds = %bb16
  %r1774 = load i32, ptr %r1760, align 4
  %r1775 = add i32 %r1774, 1
  store i32 %r1775, ptr %r1760, align 4
  br label %bb13

bb15:                                             ; preds = %bb13
  %r1776 = call i32 @model(ptr %r1757)
  %r1777 = icmp ne i32 %r1776, 0
  br i1 %r1777, label %bb19, label %bb20

bb19:                                             ; preds = %bb15
  call void @putch(i32 99)
  call void @putch(i32 97)
  call void @putch(i32 116)
  call void @putch(i32 10)
  br label %bb21

bb20:                                             ; preds = %bb15
  call void @putch(i32 100)
  call void @putch(i32 111)
  call void @putch(i32 103)
  call void @putch(i32 10)
  br label %bb21

bb21:                                             ; preds = %bb20, %bb19
  %r1778 = load i32, ptr %r1755, align 4
  %r1779 = sub i32 %r1778, 1
  store i32 %r1779, ptr %r1755, align 4
  br label %bb10

bb12:                                             ; preds = %bb10
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @before_main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 1024
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %7
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %10
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %13
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %5
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %2, !llvm.loop !6

21:                                               ; preds = %2
  store i32 1, ptr @_sysy_idx, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @after_main() #0 {
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  br label %2

2:                                                ; preds = %63, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %66

6:                                                ; preds = %2
  %7 = load ptr, ptr @stderr, align 8
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.5, i32 noundef %11, i32 noundef %15, i32 noundef %19, i32 noundef %23, i32 noundef %27, i32 noundef %31)
  %33 = load i32, ptr %1, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = load i32, ptr @_sysy_us, align 16
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr @_sysy_us, align 16
  %39 = load i32, ptr %1, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr @_sysy_s, align 16
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr @_sysy_s, align 16
  %45 = load i32, ptr @_sysy_us, align 16
  %46 = srem i32 %45, 1000000
  store i32 %46, ptr @_sysy_us, align 16
  %47 = load i32, ptr %1, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr @_sysy_m, align 16
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr @_sysy_m, align 16
  %53 = load i32, ptr @_sysy_s, align 16
  %54 = srem i32 %53, 60
  store i32 %54, ptr @_sysy_s, align 16
  %55 = load i32, ptr %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr @_sysy_h, align 16
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr @_sysy_h, align 16
  %61 = load i32, ptr @_sysy_m, align 16
  %62 = srem i32 %61, 60
  store i32 %62, ptr @_sysy_m, align 16
  br label %63

63:                                               ; preds = %6
  %64 = load i32, ptr %1, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %1, align 4
  br label %2, !llvm.loop !8

66:                                               ; preds = %2
  %67 = load ptr, ptr @stderr, align 8
  %68 = load i32, ptr @_sysy_h, align 16
  %69 = load i32, ptr @_sysy_m, align 16
  %70 = load i32, ptr @_sysy_s, align 16
  %71 = load i32, ptr @_sysy_us, align 16
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %67, ptr noundef @.str.6, i32 noundef %68, i32 noundef %69, i32 noundef %70, i32 noundef %71)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %1)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %3 = load i8, ptr %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3)
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %6, !llvm.loop !9

19:                                               ; preds = %6
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %8, !llvm.loop !10

22:                                               ; preds = %8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_starttime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr @_sysy_idx, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %5
  store i32 %3, ptr %6, align 4
  %7 = call i32 @gettimeofday(ptr noundef @_sysy_start, ptr noundef null) #3
  ret void
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_sysy_stoptime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 @gettimeofday(ptr noundef @_sysy_end, ptr noundef null) #3
  %4 = load i32, ptr %2, align 4
  %5 = load i32, ptr @_sysy_idx, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %6
  store i32 %4, ptr %7, align 4
  %8 = load i64, ptr @_sysy_end, align 8
  %9 = load i64, ptr @_sysy_start, align 8
  %10 = sub nsw i64 %8, %9
  %11 = mul nsw i64 1000000, %10
  %12 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_end, i32 0, i32 1), align 8
  %13 = add nsw i64 %11, %12
  %14 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @_sysy_start, i32 0, i32 1), align 8
  %15 = sub nsw i64 %13, %14
  %16 = load i32, ptr @_sysy_idx, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = add nsw i64 %20, %15
  %22 = trunc i64 %21 to i32
  store i32 %22, ptr %18, align 4
  %23 = load i32, ptr @_sysy_idx, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sdiv i32 %26, 1000000
  %28 = load i32, ptr @_sysy_idx, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %31, %27
  store i32 %32, ptr %30, align 4
  %33 = load i32, ptr @_sysy_idx, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = srem i32 %36, 1000000
  store i32 %37, ptr %35, align 4
  %38 = load i32, ptr @_sysy_idx, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = sdiv i32 %41, 60
  %43 = load i32, ptr @_sysy_idx, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, %42
  store i32 %47, ptr %45, align 4
  %48 = load i32, ptr @_sysy_idx, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = srem i32 %51, 60
  store i32 %52, ptr %50, align 4
  %53 = load i32, ptr @_sysy_idx, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = sdiv i32 %56, 60
  %58 = load i32, ptr @_sysy_idx, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = add nsw i32 %61, %57
  store i32 %62, ptr %60, align 4
  %63 = load i32, ptr @_sysy_idx, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = srem i32 %66, 60
  store i32 %67, ptr %65, align 4
  %68 = load i32, ptr @_sysy_idx, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr @_sysy_idx, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
