define i32 @main( ) {
bb18:
  call void @_sysy_starttime(i32 40)
  %r178 = alloca i32
  %r179 = alloca i32
  store i32 3, i32* %r179
  %r180 = load i32, i32* %r179
  %r181 = load i32, i32* %r179
  %r182 = call i32 @uniquePaths(i32 %r180, i32 %r181)
  store i32 %r182, i32* %r178
  call void @_sysy_stoptime(i32 45)
  %r183 = load i32, i32* %r178
  ret i32 %r183
}

define i32 @main( ) {
bb18:
  call void @_sysy_starttime(i32 40)
  %r178 = add i32 0, 0
  %r179 = add i32 0, 0
  %r179 = add i32 3, 0
  %r182 = call i32 @uniquePaths(i32* %r179, i32* %r179)
  %r178 = add i32 %r182, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r178
}

define i32 @main( ) {
bb18:
  call void @_sysy_starttime(i32 40)
  %r178 = add i32 0, 0
  %r179 = add i32 0, 0
  %r179 = add i32 3, 0
  %r182 = call i32 @uniquePaths(i32* %r179, i32* %r179)
  %r178 = add i32 %r182, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r178
}


bb18

178-stack-push: 288
def: 178->288

179-stack-push: 289
def: 179->289

179-stack-push: 290
def: 179->290
search: 179

179-stack-top: 290
use: 179->290
search: 179

179-stack-top: 290
use: 179->290

182-stack-push: 291
def: 182->291
search: 182

182-stack-top: 291
use: 182->291

178-stack-push: 292
def: 178->292
search: 178

178-stack-top: 292
use: 178->292
