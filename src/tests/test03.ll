declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@b = global [ 10 x i32 ] zeroinitializer
define void @foo( i32* %r100 ) {
foo:
  %r101 = alloca i32
  store i32 0, i32* %r101
  br label %bb1

bb1:
  %r102 = load i32, i32* %r101
  %r103 = icmp slt i32 %r102, 10
  br i1 %r103, label %bb2, label %bb3

bb2:
  %r104 = call i32 @getint()
  %r106 = load i32, i32* %r101
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r106
  store i32 %r104, i32* %r105
  %r107 = load i32, i32* %r101
  %r108 = add i32 %r107, 1
  store i32 %r108, i32* %r101
  br label %bb1

bb3:
  ret void
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 13)
  %r109 = alloca i32
  store i32 0, i32* %r109
  %r110 = alloca i32
  store i32 0, i32* %r110
  call void @foo(i32* @b)
  br label %bb4

bb4:
  %r111 = load i32, i32* %r109
  %r112 = icmp slt i32 %r111, 10
  br i1 %r112, label %bb5, label %bb6

bb5:
  %r113 = load i32, i32* %r110
  %r115 = load i32, i32* %r109
  %r114 = getelementptr [10 x i32 ], [10 x i32 ]* @b, i32 0, i32 %r115
  %r116 = load i32, i32* %r114
  %r117 = add i32 %r113, %r116
  store i32 %r117, i32* %r110
  %r118 = load i32, i32* %r109
  %r119 = add i32 %r118, 1
  store i32 %r119, i32* %r109
  br label %bb4

bb6:
  call void @putarray(i32 10, i32* @b)
  %r120 = load i32, i32* %r110
  call void @putint(i32 %r120)
  call void @_sysy_stoptime(i32 24)
  ret i32 0
}

