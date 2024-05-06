define i32 @quickread( ) {
bb1:
  %r100 = alloca i32
  %r112 = alloca i32
  %r104 = alloca i32
  %r101 = call i32 @getch()
  store i32 %r101, i32* %r100
  %r102 = alloca i32
  store i32 0, i32* %r102
  %r103 = alloca i32
  store i32 0, i32* %r103
  br label %bb2

bb2:
  %r105 = load i32, i32* %r100
  %r106 = icmp slt i32 %r105, 48
  br i1 %r106, label %bb3, label %bb5

bb5:
  %r107 = load i32, i32* %r100
  %r108 = icmp sgt i32 %r107, 57
  br i1 %r108, label %bb3, label %bb4

bb3:
  %r109 = load i32, i32* %r100
  %r110 = icmp eq i32 %r109, 45
  br i1 %r110, label %bb6, label %bb7

bb6:
  store i32 1, i32* %r103
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r111 = call i32 @getch()
  store i32 %r111, i32* %r100
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r113 = load i32, i32* %r100
  %r114 = icmp sge i32 %r113, 48
  br i1 %r114, label %bb12, label %bb11

bb12:
  %r115 = load i32, i32* %r100
  %r116 = icmp sle i32 %r115, 57
  br i1 %r116, label %bb10, label %bb11

bb10:
  %r117 = load i32, i32* %r102
  %r118 = mul i32 %r117, 10
  %r119 = load i32, i32* %r100
  %r120 = add i32 %r118, %r119
  %r121 = sub i32 %r120, 48
  store i32 %r121, i32* %r102
  %r122 = call i32 @getch()
  store i32 %r122, i32* %r100
  br label %bb9

bb11:
  %r123 = load i32, i32* %r103
  %r124 = icmp ne i32 %r123, 0
  br i1 %r124, label %bb13, label %bb14

bb13:
  %r126 = load i32, i32* %r102
  %r125 = sub i32 0, %r126
  ret i32 %r125
bb14:
  %r127 = load i32, i32* %r102
  ret i32 %r127
bb15:
  ret void
}

define i32 @quickread( ) {
bb1:
  %r100 = call i32 @getch()
  store i32 0, i32* %r102
  store i32 0, i32* %r103
  br label %bb2

bb2:
  %r106 = icmp slt i32 %r100, 48
  br i1 %r106, label %bb3, label %bb5

bb5:
  %r108 = icmp sgt i32 %r100, 57
  br i1 %r108, label %bb3, label %bb4

bb3:
  %r110 = icmp eq i32 %r100, 45
  br i1 %r110, label %bb6, label %bb7

bb6:
  store i32 1, i32* %r103
  br label %bb8

bb7:
  br label %bb8

bb8:
  %r100 = call i32 @getch()
  br label %bb2

bb4:
  br label %bb9

bb9:
  %r114 = icmp sge i32 %r100, 48
  br i1 %r114, label %bb12, label %bb11

bb12:
  %r116 = icmp sle i32 %r100, 57
  br i1 %r116, label %bb10, label %bb11

bb10:
  %r118 = mul i32 %r102, 10
  %r120 = add i32 %r118, %r100
  %r102 = sub i32 %r120, 48
  %r100 = call i32 @getch()
  br label %bb9

bb11:
  %r124 = icmp ne i32 %r103, 0
  br i1 %r124, label %bb13, label %bb14

bb13:
  %r125 = sub i32 0, %r102
  ret i32 %r125
bb14:
  ret i32 %r102
bb15:
  ret void
}

