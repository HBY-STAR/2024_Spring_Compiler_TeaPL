declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@ascii_0 = global i32 48
define i32 @my_getint( ) {
my_getint:
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  br label %bb1

bb1:
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb2, label %bb3

bb2:
  %r103 = call i32 @getch()
  %r104 = load i32, i32* @ascii_0
  %r105 = sub i32 %r103, %r104
  store i32 %r105, i32* %r101
  %r107 = load i32, i32* %r101
  %r108 = icmp slt i32 %r107, 0
  br i1 %r108, label %bb4, label %bb7

bb7:
  %r109 = load i32, i32* %r101
  %r110 = icmp sgt i32 %r109, 9
  br i1 %r110, label %bb4, label %bb5

bb4:
  br label %bb1

bb5:
  br label %bb3

bb6:
  br label %bb1

bb3:
  %r111 = load i32, i32* %r101
  store i32 %r111, i32* %r100
  br label %bb8

bb8:
  %r112 = icmp sgt i32 1, 0
  br i1 %r112, label %bb9, label %bb10

bb9:
  %r113 = call i32 @getch()
  %r114 = load i32, i32* @ascii_0
  %r115 = sub i32 %r113, %r114
  store i32 %r115, i32* %r101
  %r117 = load i32, i32* %r101
  %r118 = icmp sge i32 %r117, 0
  br i1 %r118, label %bb14, label %bb12

bb14:
  %r119 = load i32, i32* %r101
  %r120 = icmp sle i32 %r119, 9
  br i1 %r120, label %bb11, label %bb12

bb11:
  %r121 = load i32, i32* %r100
  %r122 = mul i32 %r121, 10
  %r123 = load i32, i32* %r101
  %r124 = add i32 %r122, %r123
  store i32 %r124, i32* %r100
  br label %bb13

bb12:
  br label %bb10

bb13:
  br label %bb8

bb10:
  %r125 = load i32, i32* %r100
  ret i32 %r125
}

define i32 @mod( i32 %r126, i32 %r128 ) {
mod:
  %r127 = alloca i32
  store i32 %r126, i32* %r127
  %r129 = alloca i32
  store i32 %r128, i32* %r129
  %r130 = load i32, i32* %r127
  %r131 = load i32, i32* %r127
  %r132 = load i32, i32* %r129
  %r133 = sdiv i32 %r131, %r132
  %r134 = load i32, i32* %r129
  %r135 = mul i32 %r133, %r134
  %r136 = sub i32 %r130, %r135
  ret i32 %r136
}

define void @my_putint( i32 %r137 ) {
my_putint:
  %r138 = alloca i32
  store i32 %r137, i32* %r138
  %r139 = alloca [ 16 x i32 ]
  %r140 = alloca i32
  store i32 0, i32* %r140
  br label %bb15

bb15:
  %r141 = load i32, i32* %r138
  %r142 = icmp sgt i32 %r141, 0
  br i1 %r142, label %bb16, label %bb17

bb16:
  %r143 = load i32, i32* %r138
  %r144 = call i32 @mod(i32 %r143, i32 10)
  %r145 = load i32, i32* @ascii_0
  %r146 = add i32 %r144, %r145
  %r148 = load i32, i32* %r140
  %r147 = getelementptr [16 x i32 ], [16 x i32 ]* %r139, i32 0, i32 %r148
  store i32 %r146, i32* %r147
  %r149 = load i32, i32* %r138
  %r150 = sdiv i32 %r149, 10
  store i32 %r150, i32* %r138
  %r151 = load i32, i32* %r140
  %r152 = add i32 %r151, 1
  store i32 %r152, i32* %r140
  br label %bb15

bb17:
  br label %bb18

bb18:
  %r153 = load i32, i32* %r140
  %r154 = icmp sgt i32 %r153, 0
  br i1 %r154, label %bb19, label %bb20

bb19:
  %r155 = load i32, i32* %r140
  %r156 = sub i32 %r155, 1
  store i32 %r156, i32* %r140
  %r158 = load i32, i32* %r140
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r139, i32 0, i32 %r158
  %r159 = load i32, i32* %r157
  call void @putch(i32 %r159)
  br label %bb18

bb20:
  ret void
}

define i32 @main( ) {
main:
  %r160 = alloca i32
  %r164 = alloca i32
  %r161 = call i32 @my_getint()
  store i32 %r161, i32* %r160
  br label %bb21

bb21:
  %r162 = load i32, i32* %r160
  %r163 = icmp sgt i32 %r162, 0
  br i1 %r163, label %bb22, label %bb23

bb22:
  %r165 = call i32 @my_getint()
  store i32 %r165, i32* %r164
  %r166 = load i32, i32* %r164
  call void @my_putint(i32 %r166)
  call void @putch(i32 10)
  %r167 = load i32, i32* %r160
  %r168 = sub i32 %r167, 1
  store i32 %r168, i32* %r160
  br label %bb21

bb23:
  ret i32 0
}

