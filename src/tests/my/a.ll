declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@M = global i32 0
@L = global i32 0
@N = global i32 0
define i32 @mul( i32* %r100, i32* %r101, i32* %r102, i32* %r103, i32* %r104, i32* %r105, i32* %r106, i32* %r107, i32* %r108 ) {
bb1:
  %r521 = add i32 0, 0
  %r522 = add i32 0, 0
  %r110 = getelementptr i32, i32* %r106, i32 0
  %r111 = getelementptr i32, i32* %r100, i32 0
  %r112 = getelementptr i32, i32* %r103, i32 0
  %r523 = load i32, i32* %r111
  %r524 = load i32, i32* %r112
  %r525 = mul i32 %r523, %r524
  %r116 = getelementptr i32, i32* %r100, i32 1
  %r117 = getelementptr i32, i32* %r104, i32 0
  %r526 = load i32, i32* %r116
  %r527 = load i32, i32* %r117
  %r528 = mul i32 %r526, %r527
  %r529 = add i32 %r525, %r528
  %r122 = getelementptr i32, i32* %r100, i32 2
  %r123 = getelementptr i32, i32* %r105, i32 0
  %r530 = load i32, i32* %r122
  %r531 = load i32, i32* %r123
  %r532 = mul i32 %r530, %r531
  %r533 = add i32 %r529, %r532
  store i32 %r533, i32* %r110
  %r128 = getelementptr i32, i32* %r106, i32 1
  %r129 = getelementptr i32, i32* %r100, i32 0
  %r130 = getelementptr i32, i32* %r103, i32 1
  %r534 = load i32, i32* %r129
  %r535 = load i32, i32* %r130
  %r536 = mul i32 %r534, %r535
  %r134 = getelementptr i32, i32* %r100, i32 1
  %r135 = getelementptr i32, i32* %r104, i32 1
  %r537 = load i32, i32* %r134
  %r538 = load i32, i32* %r135
  %r539 = mul i32 %r537, %r538
  %r540 = add i32 %r536, %r539
  %r140 = getelementptr i32, i32* %r100, i32 2
  %r141 = getelementptr i32, i32* %r105, i32 1
  %r541 = load i32, i32* %r140
  %r542 = load i32, i32* %r141
  %r543 = mul i32 %r541, %r542
  %r544 = add i32 %r540, %r543
  store i32 %r544, i32* %r128
  %r146 = getelementptr i32, i32* %r106, i32 2
  %r147 = getelementptr i32, i32* %r100, i32 0
  %r148 = getelementptr i32, i32* %r103, i32 2
  %r545 = load i32, i32* %r147
  %r546 = load i32, i32* %r148
  %r547 = mul i32 %r545, %r546
  %r152 = getelementptr i32, i32* %r100, i32 1
  %r153 = getelementptr i32, i32* %r104, i32 2
  %r548 = load i32, i32* %r152
  %r549 = load i32, i32* %r153
  %r550 = mul i32 %r548, %r549
  %r551 = add i32 %r547, %r550
  %r158 = getelementptr i32, i32* %r100, i32 2
  %r159 = getelementptr i32, i32* %r105, i32 2
  %r552 = load i32, i32* %r158
  %r553 = load i32, i32* %r159
  %r554 = mul i32 %r552, %r553
  %r555 = add i32 %r551, %r554
  store i32 %r555, i32* %r146
  %r164 = getelementptr i32, i32* %r108, i32 0
  %r165 = getelementptr i32, i32* %r101, i32 0
  %r166 = getelementptr i32, i32* %r103, i32 0
  %r556 = load i32, i32* %r165
  %r557 = load i32, i32* %r166
  %r558 = mul i32 %r556, %r557
  %r170 = getelementptr i32, i32* %r101, i32 1
  %r171 = getelementptr i32, i32* %r104, i32 0
  %r559 = load i32, i32* %r170
  %r560 = load i32, i32* %r171
  %r561 = mul i32 %r559, %r560
  %r562 = add i32 %r558, %r561
  %r176 = getelementptr i32, i32* %r101, i32 2
  %r177 = getelementptr i32, i32* %r105, i32 0
  %r563 = load i32, i32* %r176
  %r564 = load i32, i32* %r177
  %r565 = mul i32 %r563, %r564
  %r566 = add i32 %r562, %r565
  store i32 %r566, i32* %r164
  %r182 = getelementptr i32, i32* %r108, i32 1
  %r183 = getelementptr i32, i32* %r101, i32 0
  %r184 = getelementptr i32, i32* %r103, i32 1
  %r567 = load i32, i32* %r183
  %r568 = load i32, i32* %r184
  %r569 = mul i32 %r567, %r568
  %r188 = getelementptr i32, i32* %r101, i32 1
  %r189 = getelementptr i32, i32* %r104, i32 1
  %r570 = load i32, i32* %r188
  %r571 = load i32, i32* %r189
  %r572 = mul i32 %r570, %r571
  %r573 = add i32 %r569, %r572
  %r194 = getelementptr i32, i32* %r101, i32 2
  %r195 = getelementptr i32, i32* %r105, i32 1
  %r574 = load i32, i32* %r194
  %r575 = load i32, i32* %r195
  %r576 = mul i32 %r574, %r575
  %r577 = add i32 %r573, %r576
  store i32 %r577, i32* %r182
  %r200 = getelementptr i32, i32* %r108, i32 2
  %r201 = getelementptr i32, i32* %r101, i32 0
  %r202 = getelementptr i32, i32* %r103, i32 2
  %r578 = load i32, i32* %r201
  %r579 = load i32, i32* %r202
  %r580 = mul i32 %r578, %r579
  %r206 = getelementptr i32, i32* %r101, i32 1
  %r207 = getelementptr i32, i32* %r104, i32 2
  %r581 = load i32, i32* %r206
  %r582 = load i32, i32* %r207
  %r583 = mul i32 %r581, %r582
  %r584 = add i32 %r580, %r583
  %r212 = getelementptr i32, i32* %r101, i32 2
  %r213 = getelementptr i32, i32* %r105, i32 2
  %r585 = load i32, i32* %r212
  %r586 = load i32, i32* %r213
  %r587 = mul i32 %r585, %r586
  %r588 = add i32 %r584, %r587
  store i32 %r588, i32* %r200
  %r218 = getelementptr i32, i32* %r107, i32 0
  %r219 = getelementptr i32, i32* %r102, i32 0
  %r220 = getelementptr i32, i32* %r103, i32 0
  %r589 = load i32, i32* %r219
  %r590 = load i32, i32* %r220
  %r591 = mul i32 %r589, %r590
  %r224 = getelementptr i32, i32* %r102, i32 1
  %r225 = getelementptr i32, i32* %r104, i32 0
  %r592 = load i32, i32* %r224
  %r593 = load i32, i32* %r225
  %r594 = mul i32 %r592, %r593
  %r595 = add i32 %r591, %r594
  %r230 = getelementptr i32, i32* %r102, i32 2
  %r231 = getelementptr i32, i32* %r105, i32 0
  %r596 = load i32, i32* %r230
  %r597 = load i32, i32* %r231
  %r598 = mul i32 %r596, %r597
  %r599 = add i32 %r595, %r598
  store i32 %r599, i32* %r218
  %r236 = getelementptr i32, i32* %r107, i32 1
  %r237 = getelementptr i32, i32* %r102, i32 0
  %r238 = getelementptr i32, i32* %r103, i32 1
  %r600 = load i32, i32* %r237
  %r601 = load i32, i32* %r238
  %r602 = mul i32 %r600, %r601
  %r242 = getelementptr i32, i32* %r102, i32 1
  %r243 = getelementptr i32, i32* %r104, i32 1
  %r603 = load i32, i32* %r242
  %r604 = load i32, i32* %r243
  %r605 = mul i32 %r603, %r604
  %r606 = add i32 %r602, %r605
  %r248 = getelementptr i32, i32* %r102, i32 2
  %r249 = getelementptr i32, i32* %r105, i32 1
  %r607 = load i32, i32* %r248
  %r608 = load i32, i32* %r249
  %r609 = mul i32 %r607, %r608
  %r610 = add i32 %r606, %r609
  store i32 %r610, i32* %r236
  %r254 = getelementptr i32, i32* %r107, i32 2
  %r255 = getelementptr i32, i32* %r102, i32 0
  %r256 = getelementptr i32, i32* %r103, i32 2
  %r611 = load i32, i32* %r255
  %r612 = load i32, i32* %r256
  %r613 = mul i32 %r611, %r612
  %r260 = getelementptr i32, i32* %r102, i32 1
  %r261 = getelementptr i32, i32* %r104, i32 2
  %r614 = load i32, i32* %r260
  %r615 = load i32, i32* %r261
  %r616 = mul i32 %r614, %r615
  %r617 = add i32 %r613, %r616
  %r266 = getelementptr i32, i32* %r102, i32 2
  %r267 = getelementptr i32, i32* %r105, i32 2
  %r618 = load i32, i32* %r266
  %r619 = load i32, i32* %r267
  %r620 = mul i32 %r618, %r619
  %r621 = add i32 %r617, %r620
  store i32 %r621, i32* %r254
  %r272 = getelementptr i32, i32* %r107, i32 0
  %r622 = load i32, i32* %r272
  call void @putint(i32 %r622)
  call void @putch(i32 32)
  %r274 = getelementptr i32, i32* %r107, i32 1
  %r623 = load i32, i32* %r274
  call void @putint(i32 %r623)
  call void @putch(i32 32)
  %r276 = getelementptr i32, i32* %r107, i32 2
  %r624 = load i32, i32* %r276
  call void @putint(i32 %r624)
  call void @putch(i32 32)
  call void @putch(i32 10)
  ret i32 0
}

define i32 @main( ) {
bb2:
  %r652 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %r278 = alloca [ 3 x i32 ]
  %r279 = alloca [ 3 x i32 ]
  %r280 = alloca [ 3 x i32 ]
  %r281 = alloca [ 3 x i32 ]
  %r282 = alloca [ 3 x i32 ]
  %r283 = alloca [ 3 x i32 ]
  %r284 = alloca [ 6 x i32 ]
  %r285 = alloca [ 3 x i32 ]
  %r286 = alloca [ 3 x i32 ]
  %r653 = add i32 0, 0
  %r654 = add i32 0, 0
  br label %bb3

bb3:
  %r655 = phi i32 [ %r654, %bb2 ], [ %r659, %bb4 ]
  %r656 = load i32, i32* @M
  %r657 = icmp slt i32 %r655, %r656
  br i1 %r657, label %bb4, label %bb5

bb4:
  %r291 = getelementptr [3 x i32 ], [3 x i32 ]* %r278, i32 0, i32 %r655
  store i32 %r655, i32* %r291
  %r294 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 %r655
  store i32 %r655, i32* %r294
  %r297 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 %r655
  store i32 %r655, i32* %r297
  %r300 = getelementptr [3 x i32 ], [3 x i32 ]* %r281, i32 0, i32 %r655
  store i32 %r655, i32* %r300
  %r303 = getelementptr [3 x i32 ], [3 x i32 ]* %r282, i32 0, i32 %r655
  store i32 %r655, i32* %r303
  %r306 = getelementptr [3 x i32 ], [3 x i32 ]* %r283, i32 0, i32 %r655
  store i32 %r655, i32* %r306
  %r658 = add i32 %r655, 1
  %r659 = add i32 %r658, 0
  br label %bb3

bb5:
  %r312 = getelementptr [3 x i32 ], [3 x i32 ]* %r278, i32 0, i32 0
  %r313 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 0
  %r314 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 0
  %r315 = getelementptr [3 x i32 ], [3 x i32 ]* %r281, i32 0, i32 0
  %r316 = getelementptr [3 x i32 ], [3 x i32 ]* %r282, i32 0, i32 0
  %r317 = getelementptr [3 x i32 ], [3 x i32 ]* %r283, i32 0, i32 0
  %r318 = getelementptr [6 x i32 ], [6 x i32 ]* %r284, i32 0, i32 0
  %r319 = getelementptr [3 x i32 ], [3 x i32 ]* %r285, i32 0, i32 0
  %r320 = getelementptr [3 x i32 ], [3 x i32 ]* %r286, i32 0, i32 0
  %r660 = call i32 @mul(i32* %r312, i32* %r313, i32* %r314, i32* %r315, i32* %r316, i32* %r317, i32* %r318, i32* %r319, i32* %r320)
  %r661 = add i32 %r660, 0
  br label %bb6

bb6:
  %r662 = phi i32 [ %r661, %bb5 ], [ %r668, %bb7 ]
  %r663 = load i32, i32* @N
  %r664 = icmp slt i32 %r662, %r663
  br i1 %r664, label %bb7, label %bb8

bb7:
  %r325 = getelementptr [6 x i32 ], [6 x i32 ]* %r284, i32 0, i32 %r662
  %r665 = load i32, i32* %r325
  %r666 = add i32 %r665, 0
  call void @putint(i32 %r666)
  %r667 = add i32 %r662, 1
  %r668 = add i32 %r667, 0
  br label %bb6

bb8:
  %r669 = add i32 10, 0
  %r670 = add i32 0, 0
  call void @putch(i32 %r669)
  br label %bb9

bb9:
  %r671 = phi i32 [ %r670, %bb8 ], [ %r677, %bb10 ]
  %r672 = load i32, i32* @N
  %r673 = icmp slt i32 %r671, %r672
  br i1 %r673, label %bb10, label %bb11

bb10:
  %r335 = getelementptr [3 x i32 ], [3 x i32 ]* %r285, i32 0, i32 %r671
  %r674 = load i32, i32* %r335
  %r675 = add i32 %r674, 0
  call void @putint(i32 %r675)
  %r676 = add i32 %r671, 1
  %r677 = add i32 %r676, 0
  br label %bb9

bb11:
  %r678 = add i32 10, 0
  %r679 = add i32 0, 0
  call void @putch(i32 %r678)
  br label %bb12

bb12:
  %r680 = phi i32 [ %r679, %bb11 ], [ %r686, %bb13 ]
  %r681 = load i32, i32* @N
  %r682 = icmp slt i32 %r680, %r681
  br i1 %r682, label %bb13, label %bb14

bb13:
  %r345 = getelementptr [3 x i32 ], [3 x i32 ]* %r286, i32 0, i32 %r680
  %r683 = load i32, i32* %r345
  %r684 = add i32 %r683, 0
  call void @putint(i32 %r684)
  %r685 = add i32 %r680, 1
  %r686 = add i32 %r685, 0
  br label %bb12

bb14:
  %r687 = add i32 10, 0
  call void @putch(i32 %r687)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

