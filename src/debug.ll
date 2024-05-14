define i32 @main( ) {
bb47:
  %r355 = add i32 0, 0
  %r342 = call i32 @getint()
  %r343 = add i32 0, 0
  %r343 = add i32 %r342, 0
  %r344 = add i32 0, 0
  %r344 = add i32 0, 0
  br label %bb48

bb48:
  %r344 = phi i32 [ %r344, %bb47 ], [ %r344, %bb49 ]
  %r345 = icmp slt i32 %r344, %r343
  br i1 %r345, label %bb49, label %bb50

bb49:
  %r348 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r344
  %r350 = call i32 @getint()
  store i32 %r350, i32* %r348
  %r351 = add i32 %r344, 1
  %r344 = add i32 %r351, 0
  br label %bb48

bb50:
  call void @_sysy_starttime(i32 97)
  %r353 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 0
  call void @radixSort(i32 8, i32* %r353, i32 0, i32* %r343)
  %r355 = add i32 0, 0
  br label %bb51

bb51:
  %r355 = phi i32 [ %r355, %bb50 ], [ %r355, %bb52 ]
  %r356 = icmp slt i32 %r355, %r343
  br i1 %r356, label %bb52, label %bb53

bb52:
  %r359 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r355
  %r361 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r355
  %r363 = add i32 2, %r355
  %r366 = load i32, i32* %r361
  %r365 = sdiv i32 %r366, %r363
  %r367 = add i32 2, %r355
  %r369 = mul i32 %r365, %r367
  %r371 = load i32, i32* %r359
  %r370 = sub i32 %r371, %r369
  %r372 = mul i32 %r355, %r370
  %r375 = load i32, i32* @ans
  %r374 = add i32 %r375, %r372
  store i32 %r374, i32* @ans
  %r376 = add i32 %r355, 1
  %r355 = add i32 %r376, 0
  br label %bb51

bb53:
  %r379 = load i32, i32* @ans
  %r378 = icmp slt i32 %r379, 0
  br i1 %r378, label %bb54, label %bb55

bb54:
  %r381 = load i32, i32* @ans
  %r380 = sub i32 0, %r381
  store i32 %r380, i32* @ans
  br label %bb56

bb55:
  br label %bb56

bb56:
  call void @_sysy_stoptime(i32 117)
  %r382 = load i32, i32* @ans
  call void @putint(i32 %r382)
  call void @putch(i32 10)
  ret i32 0
}

