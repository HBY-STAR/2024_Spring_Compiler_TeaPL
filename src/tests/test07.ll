declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 2)
  %r109 = alloca i32
  %r100 = alloca i32
  store i32 0, i32* %r100
  %r101 = alloca i32
  %r103 = icmp slt i32 1, 9
  br label %bb1

bb1:
  %r104 = load i32, i32* %r100
  %r105 = icmp sgt i32 %r104, 0
  %r106 = zext i1 %r105 to i32
  store i32 %r106, i32* %r101
  br label %bb2

bb2:
  %r107 = load i32, i32* %r100
  %r108 = icmp slt i32 %r107, 1000000
  br i1 %r108, label %bb3, label %bb4

bb3:
  store i32 0, i32* %r109
  %r110 = load i32, i32* %r100
  %r111 = add i32 %r110, 1
  store i32 %r111, i32* %r100
  br label %bb2

bb4:
  %r112 = load i32, i32* %r101
  call void @putint(i32 %r112)
  call void @_sysy_stoptime(i32 10)
  ret i32 0
}

