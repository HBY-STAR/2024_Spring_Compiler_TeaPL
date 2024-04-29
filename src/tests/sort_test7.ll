declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @Merge( i32* %r100, i32 %r101, i32 %r103, i32 %r105 ) {
Merge:
  %r102 = alloca i32
  %r148 = alloca i32
  store i32 %r101, i32* %r102
  %r104 = alloca i32
  store i32 %r103, i32* %r104
  %r106 = alloca i32
  store i32 %r105, i32* %r106
  %r107 = alloca i32
  %r108 = load i32, i32* %r104
  %r109 = load i32, i32* %r102
  %r110 = sub i32 %r108, %r109
  %r111 = add i32 %r110, 1
  store i32 %r111, i32* %r107
  %r112 = alloca i32
  %r113 = load i32, i32* %r106
  %r114 = load i32, i32* %r104
  %r115 = sub i32 %r113, %r114
  store i32 %r115, i32* %r112
  %r116 = alloca [ 10 x i32 ]
  %r117 = alloca [ 10 x i32 ]
  %r118 = alloca i32
  store i32 0, i32* %r118
  %r119 = alloca i32
  store i32 0, i32* %r119
  %r120 = alloca i32
  br label %bb1

bb1:
  %r121 = load i32, i32* %r118
  %r122 = load i32, i32* %r107
  %r123 = icmp slt i32 %r121, %r122
  br i1 %r123, label %bb2, label %bb3

bb2:
  %r124 = load i32, i32* %r118
  %r125 = load i32, i32* %r102
  %r126 = add i32 %r124, %r125
  store i32 %r126, i32* %r120
  %r128 = load i32, i32* %r120
  %r127 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r128
  %r129 = load i32, i32* %r127
  %r131 = load i32, i32* %r118
  %r130 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r131
  store i32 %r129, i32* %r130
  %r132 = load i32, i32* %r118
  %r133 = add i32 %r132, 1
  store i32 %r133, i32* %r118
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r134 = load i32, i32* %r119
  %r135 = load i32, i32* %r112
  %r136 = icmp slt i32 %r134, %r135
  br i1 %r136, label %bb5, label %bb6

bb5:
  %r137 = load i32, i32* %r119
  %r138 = load i32, i32* %r104
  %r139 = add i32 %r137, %r138
  %r140 = add i32 %r139, 1
  store i32 %r140, i32* %r120
  %r142 = load i32, i32* %r120
  %r141 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r142
  %r143 = load i32, i32* %r141
  %r145 = load i32, i32* %r119
  %r144 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r145
  store i32 %r143, i32* %r144
  %r146 = load i32, i32* %r119
  %r147 = add i32 %r146, 1
  store i32 %r147, i32* %r119
  br label %bb4

bb6:
  store i32 0, i32* %r118
  store i32 0, i32* %r119
  %r149 = load i32, i32* %r102
  store i32 %r149, i32* %r148
  br label %bb7

bb7:
  %r151 = load i32, i32* %r118
  %r152 = load i32, i32* %r107
  %r153 = icmp ne i32 %r151, %r152
  br i1 %r153, label %bb10, label %bb9

bb10:
  %r154 = load i32, i32* %r119
  %r155 = load i32, i32* %r112
  %r156 = icmp ne i32 %r154, %r155
  br i1 %r156, label %bb8, label %bb9

bb8:
  %r158 = load i32, i32* %r118
  %r157 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r158
  %r159 = load i32, i32* %r157
  %r161 = load i32, i32* %r119
  %r160 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r161
  %r162 = load i32, i32* %r160
  %r163 = add i32 %r162, 1
  %r164 = icmp slt i32 %r159, %r163
  br i1 %r164, label %bb11, label %bb12

bb11:
  %r166 = load i32, i32* %r118
  %r165 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r166
  %r167 = load i32, i32* %r165
  %r169 = load i32, i32* %r148
  %r168 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r169
  store i32 %r167, i32* %r168
  %r170 = load i32, i32* %r148
  %r171 = add i32 %r170, 1
  store i32 %r171, i32* %r148
  %r172 = load i32, i32* %r118
  %r173 = add i32 %r172, 1
  store i32 %r173, i32* %r118
  br label %bb13

bb12:
  %r175 = load i32, i32* %r119
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r175
  %r176 = load i32, i32* %r174
  %r178 = load i32, i32* %r148
  %r177 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r178
  store i32 %r176, i32* %r177
  %r179 = load i32, i32* %r148
  %r180 = add i32 %r179, 1
  store i32 %r180, i32* %r148
  %r181 = load i32, i32* %r119
  %r182 = add i32 %r181, 1
  store i32 %r182, i32* %r119
  br label %bb13

bb13:
  br label %bb7

bb9:
  br label %bb14

bb14:
  %r183 = load i32, i32* %r118
  %r184 = load i32, i32* %r107
  %r185 = icmp slt i32 %r183, %r184
  br i1 %r185, label %bb15, label %bb16

bb15:
  %r187 = load i32, i32* %r118
  %r186 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r187
  %r188 = load i32, i32* %r186
  %r190 = load i32, i32* %r148
  %r189 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r190
  store i32 %r188, i32* %r189
  %r191 = load i32, i32* %r148
  %r192 = add i32 %r191, 1
  store i32 %r192, i32* %r148
  %r193 = load i32, i32* %r118
  %r194 = add i32 %r193, 1
  store i32 %r194, i32* %r118
  br label %bb14

bb16:
  br label %bb17

bb17:
  %r195 = load i32, i32* %r119
  %r196 = load i32, i32* %r112
  %r197 = icmp slt i32 %r195, %r196
  br i1 %r197, label %bb18, label %bb19

bb18:
  %r199 = load i32, i32* %r119
  %r198 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r199
  %r200 = load i32, i32* %r198
  %r202 = load i32, i32* %r148
  %r201 = getelementptr [10 x i32 ], [10 x i32 ]* %r100, i32 0, i32 %r202
  store i32 %r200, i32* %r201
  %r203 = load i32, i32* %r148
  %r204 = add i32 %r203, 1
  store i32 %r204, i32* %r148
  %r205 = load i32, i32* %r119
  %r206 = add i32 %r205, 1
  store i32 %r206, i32* %r119
  br label %bb17

bb19:
  ret i32 0
}

define i32 @MergeSort( i32* %r207, i32 %r208, i32 %r210 ) {
MergeSort:
  %r209 = alloca i32
  %r220 = alloca i32
  %r215 = alloca i32
  store i32 %r208, i32* %r209
  %r211 = alloca i32
  store i32 %r210, i32* %r211
  %r212 = load i32, i32* %r209
  %r213 = load i32, i32* %r211
  %r214 = icmp slt i32 %r212, %r213
  br i1 %r214, label %bb20, label %bb21

bb20:
  %r216 = load i32, i32* %r209
  %r217 = load i32, i32* %r211
  %r218 = add i32 %r216, %r217
  %r219 = sdiv i32 %r218, 2
  store i32 %r219, i32* %r215
  %r221 = load i32, i32* %r209
  %r222 = load i32, i32* %r215
  %r223 = call i32 @MergeSort(i32* %r207, i32 %r221, i32 %r222)
  store i32 %r223, i32* %r220
  %r224 = load i32, i32* %r215
  %r225 = add i32 %r224, 1
  store i32 %r225, i32* %r220
  %r226 = load i32, i32* %r220
  %r227 = load i32, i32* %r211
  %r228 = call i32 @MergeSort(i32* %r207, i32 %r226, i32 %r227)
  store i32 %r228, i32* %r220
  %r229 = load i32, i32* %r209
  %r230 = load i32, i32* %r215
  %r231 = load i32, i32* %r211
  %r232 = call i32 @Merge(i32* %r207, i32 %r229, i32 %r230, i32 %r231)
  store i32 %r232, i32* %r220
  br label %bb22

bb21:
  br label %bb22

bb22:
  ret i32 0
}

define i32 @main( ) {
main:
  store i32 10, i32* @n
  %r233 = alloca [ 10 x i32 ]
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 0
  store i32 4, i32* %r234
  %r235 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 1
  store i32 3, i32* %r235
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 2
  store i32 9, i32* %r236
  %r237 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 3
  store i32 2, i32* %r237
  %r238 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 4
  store i32 0, i32* %r238
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 5
  store i32 1, i32* %r239
  %r240 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 6
  store i32 6, i32* %r240
  %r241 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 7
  store i32 5, i32* %r241
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 8
  store i32 7, i32* %r242
  %r243 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 9
  store i32 8, i32* %r243
  %r244 = alloca i32
  store i32 0, i32* %r244
  %r245 = alloca i32
  %r246 = load i32, i32* @n
  %r247 = sub i32 %r246, 1
  store i32 %r247, i32* %r245
  %r248 = load i32, i32* %r244
  %r249 = load i32, i32* %r245
  %r250 = call i32 @MergeSort(i32* %r233, i32 %r248, i32 %r249)
  store i32 %r250, i32* %r244
  br label %bb23

bb23:
  %r251 = load i32, i32* %r244
  %r252 = load i32, i32* @n
  %r253 = icmp slt i32 %r251, %r252
  br i1 %r253, label %bb24, label %bb25

bb24:
  %r255 = load i32, i32* %r244
  %r254 = getelementptr [10 x i32 ], [10 x i32 ]* %r233, i32 0, i32 %r255
  %r256 = load i32, i32* %r254
  store i32 %r256, i32* %r245
  %r257 = load i32, i32* %r245
  call void @putint(i32 %r257)
  store i32 10, i32* %r245
  %r258 = load i32, i32* %r245
  call void @putch(i32 %r258)
  %r259 = load i32, i32* %r244
  %r260 = add i32 %r259, 1
  store i32 %r260, i32* %r244
  br label %bb23

bb25:
  ret i32 0
}

