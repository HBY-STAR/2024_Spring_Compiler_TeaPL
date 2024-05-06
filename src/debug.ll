define i32 @quickread( ) {
bb1:
  %r101 = call i32 @getch()
  %r102 = add i32 0, 0
  %r103 = add i32 0, 0
  br label %bb2

bb2:
  %r106 = icmp slt i32 %r101, 48
  br i1 %r106, label %bb3, label %bb5

bb5:
  %r108 = icmp sgt i32 %r101, 57
  br i1 %r108, label %bb3, label %bb4

bb3:
  %r110 = icmp eq i32 %r101, 45
  br i1 %r110, label %bb6, label %bb7

bb6:
  %r103 = add i32 1, 0
  br label %bb8

bb7:
  br label %bb8

bb8:
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

