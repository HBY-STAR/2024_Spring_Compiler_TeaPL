declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r100 = alloca i32
  %r124 = alloca i32
  %r123 = alloca i32
  %r115 = alloca i32
  %r114 = alloca i32
  %r113 = alloca i32
  %r112 = alloca i32
  %r111 = alloca i32
  %r101 = alloca i32
  %r102 = alloca [ 10 x i32 ]
  store i32 0, i32* %r101
  store i32 0, i32* %r100
  br label %bb1

bb1:
  %r103 = load i32, i32* %r100
  %r104 = icmp slt i32 %r103, 10
  br i1 %r104, label %bb2, label %bb3

bb2:
  %r105 = load i32, i32* %r100
  %r106 = add i32 %r105, 1
  %r108 = load i32, i32* %r100
  %r107 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r108
  store i32 %r106, i32* %r107
  %r109 = load i32, i32* %r100
  %r110 = add i32 %r109, 1
  store i32 %r110, i32* %r100
  br label %bb1

bb3:
  store i32 10, i32* %r115
  %r116 = call i32 @getint()
  store i32 %r116, i32* %r111
  %r117 = load i32, i32* %r115
  %r118 = sub i32 %r117, 1
  store i32 %r118, i32* %r112
  store i32 0, i32* %r113
  %r119 = load i32, i32* %r112
  %r120 = load i32, i32* %r113
  %r121 = add i32 %r119, %r120
  %r122 = sdiv i32 %r121, 2
  store i32 %r122, i32* %r114
  store i32 0, i32* %r123
  store i32 0, i32* %r100
  store i32 0, i32* %r124
  br label %bb4

bb4:
  %r126 = load i32, i32* %r100
  %r127 = icmp slt i32 %r126, 10
  br i1 %r127, label %bb7, label %bb6

bb7:
  %r128 = load i32, i32* %r123
  %r129 = icmp eq i32 %r128, 0
  br i1 %r129, label %bb5, label %bb6

bb5:
  %r131 = load i32, i32* %r100
  %r130 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r131
  %r132 = load i32, i32* %r130
  %r133 = load i32, i32* %r111
  %r134 = icmp eq i32 %r132, %r133
  br i1 %r134, label %bb8, label %bb9

bb8:
  store i32 1, i32* %r123
  %r135 = load i32, i32* %r100
  store i32 %r135, i32* %r124
  br label %bb10

bb9:
  br label %bb10

bb10:
  %r136 = load i32, i32* %r100
  %r137 = add i32 %r136, 1
  store i32 %r137, i32* %r100
  br label %bb4

bb6:
  %r138 = load i32, i32* %r123
  %r139 = icmp eq i32 %r138, 1
  br i1 %r139, label %bb11, label %bb12

bb11:
  %r140 = load i32, i32* %r124
  call void @putint(i32 %r140)
  br label %bb13

bb12:
  store i32 0, i32* %r111
  %r141 = load i32, i32* %r111
  call void @putint(i32 %r141)
  br label %bb13

bb13:
  store i32 10, i32* %r111
  %r142 = load i32, i32* %r111
  call void @putch(i32 %r142)
  ret i32 0
}

