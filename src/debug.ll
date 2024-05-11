define i32 @eval( ) {
bb54:
  %r230 = alloca [ 256 x i32 ]
  %r284 = add i32 0, 0
  %r282 = add i32 0, 0
  %r280 = add i32 0, 0
  %r266 = add i32 0, 0
  %r264 = add i32 0, 0
  %r262 = add i32 0, 0
  %r254 = add i32 0, 0
  %r249 = add i32 0, 0
  %r231 = alloca [ 256 x i32 ]
  %r232 = add i32 0, 0
  %r232 = add i32 0, 0
  br label %bb55

bb55:
  %r232 = phi i32 [ %r232, %bb54 ], [ %r232, %bb56 ]
  %r234 = icmp slt i32 %r232, 256
  br i1 %r234, label %bb56, label %bb57

bb56:
  %r235 = getelementptr [256 x i32 ], [256 x i32 ]* %r230, i32 0, i32 %r232
  store i32 0, i32* %r235
  %r237 = getelementptr [256 x i32 ], [256 x i32 ]* %r231, i32 0, i32 %r232
  store i32 0, i32* %r237
  %r240 = add i32 %r232, 1
  %r232 = add i32 %r240, 0
  br label %bb55

bb57:
  %r241 = load i32, i32* @cur_token
  %r242 = load i32, i32* @TOKEN_NUM
  %r243 = icmp ne i32 %r241, %r242
  br i1 %r243, label %bb58, label %bb59

bb58:
  %r244 = call i32 @panic()
  ret i32 %r244
bb59:
  br label %bb60

bb60:
  %r245 = load i32, i32* @num
  call void @stack_push(i32* %r230, i32 %r245)
  call void @next_token()
  br label %bb61

bb61:
  %r246 = load i32, i32* @cur_token
  %r247 = load i32, i32* @TOKEN_OTHER
  %r248 = icmp eq i32 %r246, %r247
  br i1 %r248, label %bb62, label %bb63

bb62:
  %r250 = load i32, i32* @other
  %r249 = add i32 %r250, 0
  %r252 = call i32 @get_op_prec(i32* %r249)
  %r253 = icmp eq i32 %r252, 0
  br i1 %r253, label %bb64, label %bb65

bb64:
  br label %bb63

bb65:
  br label %bb66

bb66:
  call void @next_token()
  br label %bb67

bb67:
  %r255 = call i32 @stack_size(i32* %r231)
  %r256 = icmp ne i32 %r255, 0
  br i1 %r256, label %bb70, label %bb69

bb70:
  %r257 = call i32 @stack_peek(i32* %r231)
  %r258 = call i32 @get_op_prec(i32 %r257)
  %r260 = call i32 @get_op_prec(i32* %r249)
  %r261 = icmp sge i32 %r258, %r260
  br i1 %r261, label %bb68, label %bb69

bb68:
  %r263 = call i32 @stack_pop(i32* %r231)
  %r262 = add i32 %r263, 0
  %r265 = call i32 @stack_pop(i32* %r230)
  %r264 = add i32 %r265, 0
  %r267 = call i32 @stack_pop(i32* %r230)
  %r266 = add i32 %r267, 0
  %r271 = call i32 @eval_op(i32* %r262, i32* %r266, i32* %r264)
  call void @stack_push(i32* %r230, i32 %r271)
  br label %bb67

bb69:
  call void @stack_push(i32* %r231, i32* %r249)
  %r273 = load i32, i32* @cur_token
  %r274 = load i32, i32* @TOKEN_NUM
  %r275 = icmp ne i32 %r273, %r274
  br i1 %r275, label %bb71, label %bb72

bb71:
  %r276 = call i32 @panic()
  ret i32 %r276
bb72:
  br label %bb73

bb73:
  %r277 = load i32, i32* @num
  call void @stack_push(i32* %r230, i32 %r277)
  call void @next_token()
  br label %bb61

bb63:
  call void @next_token()
  br label %bb74

bb74:
  %r278 = call i32 @stack_size(i32* %r231)
  %r279 = icmp ne i32 %r278, 0
  br i1 %r279, label %bb75, label %bb76

bb75:
  %r281 = call i32 @stack_pop(i32* %r231)
  %r280 = add i32 %r281, 0
  %r283 = call i32 @stack_pop(i32* %r230)
  %r282 = add i32 %r283, 0
  %r285 = call i32 @stack_pop(i32* %r230)
  %r284 = add i32 %r285, 0
  %r289 = call i32 @eval_op(i32* %r280, i32* %r284, i32* %r282)
  call void @stack_push(i32* %r230, i32 %r289)
  br label %bb74

bb76:
  %r290 = call i32 @stack_peek(i32* %r230)
  ret i32 %r290
}

