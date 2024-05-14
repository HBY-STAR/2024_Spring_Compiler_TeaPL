define i32 @main( ) {
bb24:
  call void @_sysy_starttime(i32 40)
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r184 = add i32 3, 0
  %r185 = call i32 @uniquePaths(i32* %r184, i32* %r184)
  %r183 = add i32 %r185, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r183
}

