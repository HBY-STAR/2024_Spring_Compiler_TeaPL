declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@INF = global i32 65535
%array2D = type { [16 x i32 ] }
@e = global [ 16 x %array2D ] zeroinitializer
@book = global [ 16 x i32 ] zeroinitializer
@dis = global [ 16 x i32 ] zeroinitializer
@n = global i32 0
@m = global i32 0
@v1 = global i32 0
@v2 = global i32 0
@w = global i32 0
define void @Dijkstra( ) {
Dijkstra:
  %r100 = alloca i32
  %r145 = alloca i32
  %r123 = alloca i32
  %r122 = alloca i32
  %r120 = alloca i32
  store i32 1, i32* %r100
  br label %bb1

bb1:
  %r101 = load i32, i32* %r100
  %r102 = load i32, i32* @n
  %r103 = icmp sle i32 %r101, %r102
  br i1 %r103, label %bb2, label %bb3

bb2:
  %r104 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r105 = getelementptr i32, i32* %r104, i32 0
  %r107 = load i32, i32* %r100
  %r106 = getelementptr i32, i32* %r105, i32 %r107
  %r108 = load i32, i32* %r106
  %r110 = load i32, i32* %r100
  %r109 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r110
  store i32 %r108, i32* %r109
  %r112 = load i32, i32* %r100
  %r111 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r112
  store i32 0, i32* %r111
  %r113 = load i32, i32* %r100
  %r114 = add i32 %r113, 1
  store i32 %r114, i32* %r100
  br label %bb1

bb3:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  store i32 1, i32* %r100
  br label %bb4

bb4:
  %r116 = load i32, i32* %r100
  %r117 = load i32, i32* @n
  %r118 = sub i32 %r117, 1
  %r119 = icmp sle i32 %r116, %r118
  br i1 %r119, label %bb5, label %bb6

bb5:
  %r121 = load i32, i32* @INF
  store i32 %r121, i32* %r120
  store i32 0, i32* %r122
  store i32 1, i32* %r123
  br label %bb7

bb7:
  %r124 = load i32, i32* %r123
  %r125 = load i32, i32* @n
  %r126 = icmp sle i32 %r124, %r125
  br i1 %r126, label %bb8, label %bb9

bb8:
  %r128 = load i32, i32* %r120
  %r130 = load i32, i32* %r123
  %r129 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r130
  %r131 = load i32, i32* %r129
  %r132 = icmp sgt i32 %r128, %r131
  br i1 %r132, label %bb13, label %bb11

bb13:
  %r134 = load i32, i32* %r123
  %r133 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r134
  %r135 = load i32, i32* %r133
  %r136 = icmp eq i32 %r135, 0
  br i1 %r136, label %bb10, label %bb11

bb10:
  %r138 = load i32, i32* %r123
  %r137 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r138
  %r139 = load i32, i32* %r137
  store i32 %r139, i32* %r120
  %r140 = load i32, i32* %r123
  store i32 %r140, i32* %r122
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r141 = load i32, i32* %r123
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* %r123
  br label %bb7

bb9:
  %r144 = load i32, i32* %r122
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r144
  store i32 1, i32* %r143
  store i32 1, i32* %r145
  br label %bb14

bb14:
  %r146 = load i32, i32* %r145
  %r147 = load i32, i32* @n
  %r148 = icmp sle i32 %r146, %r147
  br i1 %r148, label %bb15, label %bb16

bb15:
  %r150 = load i32, i32* %r122
  %r149 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r150
  %r151 = getelementptr i32, i32* %r149, i32 0
  %r153 = load i32, i32* %r145
  %r152 = getelementptr i32, i32* %r151, i32 %r153
  %r154 = load i32, i32* %r152
  %r155 = load i32, i32* @INF
  %r156 = icmp slt i32 %r154, %r155
  br i1 %r156, label %bb17, label %bb18

bb17:
  %r158 = load i32, i32* %r145
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r158
  %r159 = load i32, i32* %r157
  %r161 = load i32, i32* %r122
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r161
  %r162 = load i32, i32* %r160
  %r164 = load i32, i32* %r122
  %r163 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r164
  %r165 = getelementptr i32, i32* %r163, i32 0
  %r167 = load i32, i32* %r145
  %r166 = getelementptr i32, i32* %r165, i32 %r167
  %r168 = load i32, i32* %r166
  %r169 = add i32 %r162, %r168
  %r170 = icmp sgt i32 %r159, %r169
  br i1 %r170, label %bb20, label %bb21

bb20:
  %r172 = load i32, i32* %r122
  %r171 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r172
  %r173 = load i32, i32* %r171
  %r175 = load i32, i32* %r122
  %r174 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r175
  %r176 = getelementptr i32, i32* %r174, i32 0
  %r178 = load i32, i32* %r145
  %r177 = getelementptr i32, i32* %r176, i32 %r178
  %r179 = load i32, i32* %r177
  %r180 = add i32 %r173, %r179
  %r182 = load i32, i32* %r145
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r182
  store i32 %r180, i32* %r181
  br label %bb22

bb21:
  br label %bb22

bb22:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %r183 = load i32, i32* %r145
  %r184 = add i32 %r183, 1
  store i32 %r184, i32* %r145
  br label %bb14

bb16:
  %r185 = load i32, i32* %r100
  %r186 = add i32 %r185, 1
  store i32 %r186, i32* %r100
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  %r187 = alloca i32
  %r220 = alloca i32
  %r218 = alloca i32
  %r193 = alloca i32
  %r188 = call i32 @getint()
  store i32 %r188, i32* @n
  %r189 = call i32 @getint()
  store i32 %r189, i32* @m
  store i32 1, i32* %r187
  br label %bb23

bb23:
  %r190 = load i32, i32* %r187
  %r191 = load i32, i32* @n
  %r192 = icmp sle i32 %r190, %r191
  br i1 %r192, label %bb24, label %bb25

bb24:
  store i32 1, i32* %r193
  br label %bb26

bb26:
  %r194 = load i32, i32* %r193
  %r195 = load i32, i32* @n
  %r196 = icmp sle i32 %r194, %r195
  br i1 %r196, label %bb27, label %bb28

bb27:
  %r197 = load i32, i32* %r187
  %r198 = load i32, i32* %r193
  %r199 = icmp eq i32 %r197, %r198
  br i1 %r199, label %bb29, label %bb30

bb29:
  %r201 = load i32, i32* %r187
  %r200 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r201
  %r202 = getelementptr i32, i32* %r200, i32 0
  %r204 = load i32, i32* %r193
  %r203 = getelementptr i32, i32* %r202, i32 %r204
  store i32 0, i32* %r203
  br label %bb31

bb30:
  %r205 = load i32, i32* @INF
  %r207 = load i32, i32* %r187
  %r206 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r207
  %r208 = getelementptr i32, i32* %r206, i32 0
  %r210 = load i32, i32* %r193
  %r209 = getelementptr i32, i32* %r208, i32 %r210
  store i32 %r205, i32* %r209
  br label %bb31

bb31:
  %r211 = load i32, i32* %r193
  %r212 = add i32 %r211, 1
  store i32 %r212, i32* %r193
  br label %bb26

bb28:
  %r213 = load i32, i32* %r187
  %r214 = add i32 %r213, 1
  store i32 %r214, i32* %r187
  br label %bb23

bb25:
  store i32 1, i32* %r187
  br label %bb32

bb32:
  %r215 = load i32, i32* %r187
  %r216 = load i32, i32* @m
  %r217 = icmp sle i32 %r215, %r216
  br i1 %r217, label %bb33, label %bb34

bb33:
  %r219 = call i32 @getint()
  store i32 %r219, i32* %r218
  %r221 = call i32 @getint()
  store i32 %r221, i32* %r220
  %r222 = call i32 @getint()
  %r224 = load i32, i32* %r218
  %r223 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r224
  %r225 = getelementptr i32, i32* %r223, i32 0
  %r227 = load i32, i32* %r220
  %r226 = getelementptr i32, i32* %r225, i32 %r227
  store i32 %r222, i32* %r226
  %r228 = load i32, i32* %r187
  %r229 = add i32 %r228, 1
  store i32 %r229, i32* %r187
  br label %bb32

bb34:
  call void @Dijkstra()
  store i32 1, i32* %r187
  br label %bb35

bb35:
  %r230 = load i32, i32* %r187
  %r231 = load i32, i32* @n
  %r232 = icmp sle i32 %r230, %r231
  br i1 %r232, label %bb36, label %bb37

bb36:
  %r234 = load i32, i32* %r187
  %r233 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r234
  %r235 = load i32, i32* %r233
  call void @putint(i32 %r235)
  call void @putch(i32 32)
  %r236 = load i32, i32* %r187
  %r237 = add i32 %r236, 1
  store i32 %r237, i32* %r187
  br label %bb35

bb37:
  call void @putch(i32 10)
  ret i32 0
}

