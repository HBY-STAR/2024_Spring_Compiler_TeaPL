define i32 @quickread( ) {
bb1:
  %r100 = add i32 0, 0
  %r112 = add i32 0, 0
  %r104 = add i32 0, 0
  %r101 = call i32 @getch()
  %r102 = add i32 0, 0
  %r102 = add i32 0, 0
  %r103 = add i32 0, 0
  %r103 = add i32 0, 0
  br label %bb2

bb2:
  %r101 = phi i32 [ %r101, %bb1 ], [ %r101, %bb8 ]
  %r106 = icmp slt i32 %r101, 48
  br i1 %r106, label %bb3, label %bb5

bb5:
  %r108 = icmp sgt i32 %r101, 57
  br i1 %r108, label %bb3, label %bb4

bb3:
  %r101 = phi i32 [ %r101, %bb2 ], [ %r101, %bb5 ]
  %r110 = icmp eq i32 %r101, 45
  br i1 %r110, label %bb6, label %bb7

bb6:
  %r103 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r101 = phi i32 [ %r101, %bb6 ], [ %r101, %bb7 ]
  %r111 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r114 = icmp sge i32 %r111, 48
  br i1 %r114, label %bb12, label %bb11

bb12:
  %r116 = icmp sle i32 %r111, 57
  br i1 %r116, label %bb10, label %bb11

bb10:
  %r118 = mul i32 0, 10
  %r120 = add i32 %r118, %r111
  %r121 = sub i32 %r120, 48
  %r122 = call i32 @getch()
  br label %bb9

bb11:
  %r124 = icmp ne i32 1, 0
  br i1 %r124, label %bb13, label %bb14

bb13:
  %r125 = sub i32 0, %r121
  ret i32 %r125
bb14:
  ret i32 %r121
bb15:
  ret void
}

define i32 @quickread( ) {
bb1:
  %r275 = add i32 0, 0
  %r276 = add i32 0, 0
  %r277 = add i32 0, 0
  %r306 = call i32 @getch()
  %r280 = add i32 0, 0
  %r280 = add i32 0, 0
  %r299 = add i32 0, 0
  %r299 = add i32 0, 0
  br label %bb2

bb2:
  %r300 = phi i32 [ %r278, %bb1 ], [ %r300, %bb8 ]
  %r303 = icmp slt i32 %r306, 48
  br i1 %r303, label %bb3, label %bb5

bb5:
  %r308 = icmp sgt i32 %r306, 57
  br i1 %r308, label %bb3, label %bb4

bb3:
  %r295 = phi i32 [ %r295, %bb2 ], [ %r295, %bb5 ]
  %r298 = icmp eq i32 %r306, 45
  br i1 %r298, label %bb6, label %bb7

bb6:
  %r299 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r304 = phi i32 [ %r295, %bb6 ], [ %r295, %bb7 ]
  %r305 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r284 = icmp sge i32 %r305, 48
  br i1 %r284, label %bb12, label %bb11

bb12:
  %r287 = icmp sle i32 %r305, 57
  br i1 %r287, label %bb10, label %bb11

bb10:
  %r289 = mul i32 0, 10
  %r292 = add i32 %r289, %r305
  %r312 = sub i32 %r292, 48
  %r294 = call i32 @getch()
  br label %bb9

bb11:
  %r310 = icmp ne i32 1, 0
  br i1 %r310, label %bb13, label %bb14

bb13:
  %r314 = sub i32 0, %r312
  ret i32 %r314
bb14:
  ret i32 %r312
bb15:
  ret void
}

