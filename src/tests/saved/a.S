.section .data
.global    len
len:
        .quad   20
.section .text
.global getch
.global getint
.global putch
.global putint
.global putarray
.global _sysy_starttime
.global _sysy_stoptime
.global main
main:

        //153:x29,#-1040

        //151:x29,#-520

        //152:x29,#-720

        //126:x29,#-320

        //105:x29,#-160

        //bb1:

bb1:

        //  call void @_sysy_starttime(i32 97)

        sub     sp, sp, #1040
        mov     x0, #97
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     _sysy_starttime
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  %r397 = add i32 0, 0

        mov     x397, #0
        //  %r398 = add i32 0, 0

        mov     x398, #0
        //  %r399 = add i32 0, 0

        mov     x399, #0
        //  %r400 = add i32 0, 0

        mov     x400, #0
        //  %r401 = add i32 0, 0

        mov     x401, #0
        //  %r105 = alloca [ 20 x i32 ]

        //  %r106 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 0

        mov     x465, #0
        add     x466, x29, #-160
        mov     x467, #8
        mul     x468, x467, x465
        add     x106, x466, x468
        //  store i32 1, i32* %r106

        mov     x469, #1
        str     x469, [x106]
        //  %r107 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 1

        mov     x470, #1
        add     x471, x29, #-160
        mov     x472, #8
        mul     x473, x472, x470
        add     x107, x471, x473
        //  store i32 2, i32* %r107

        mov     x474, #2
        str     x474, [x107]
        //  %r108 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 2

        mov     x475, #2
        add     x476, x29, #-160
        mov     x477, #8
        mul     x478, x477, x475
        add     x108, x476, x478
        //  store i32 3, i32* %r108

        mov     x479, #3
        str     x479, [x108]
        //  %r109 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 3

        mov     x480, #3
        add     x481, x29, #-160
        mov     x482, #8
        mul     x483, x482, x480
        add     x109, x481, x483
        //  store i32 4, i32* %r109

        mov     x484, #4
        str     x484, [x109]
        //  %r110 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 4

        mov     x485, #4
        add     x486, x29, #-160
        mov     x487, #8
        mul     x488, x487, x485
        add     x110, x486, x488
        //  store i32 5, i32* %r110

        mov     x489, #5
        str     x489, [x110]
        //  %r111 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 5

        mov     x490, #5
        add     x491, x29, #-160
        mov     x492, #8
        mul     x493, x492, x490
        add     x111, x491, x493
        //  store i32 6, i32* %r111

        mov     x494, #6
        str     x494, [x111]
        //  %r112 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 6

        mov     x495, #6
        add     x496, x29, #-160
        mov     x497, #8
        mul     x498, x497, x495
        add     x112, x496, x498
        //  store i32 7, i32* %r112

        mov     x499, #7
        str     x499, [x112]
        //  %r113 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 7

        mov     x500, #7
        add     x501, x29, #-160
        mov     x502, #8
        mul     x503, x502, x500
        add     x113, x501, x503
        //  store i32 8, i32* %r113

        mov     x504, #8
        str     x504, [x113]
        //  %r114 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 8

        mov     x505, #8
        add     x506, x29, #-160
        mov     x507, #8
        mul     x508, x507, x505
        add     x114, x506, x508
        //  store i32 9, i32* %r114

        mov     x509, #9
        str     x509, [x114]
        //  %r115 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 9

        mov     x510, #9
        add     x511, x29, #-160
        mov     x512, #8
        mul     x513, x512, x510
        add     x115, x511, x513
        //  store i32 0, i32* %r115

        mov     x514, #0
        str     x514, [x115]
        //  %r116 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 10

        mov     x515, #10
        add     x516, x29, #-160
        mov     x517, #8
        mul     x518, x517, x515
        add     x116, x516, x518
        //  store i32 1, i32* %r116

        mov     x519, #1
        str     x519, [x116]
        //  %r117 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 11

        mov     x520, #11
        add     x521, x29, #-160
        mov     x522, #8
        mul     x523, x522, x520
        add     x117, x521, x523
        //  store i32 2, i32* %r117

        mov     x524, #2
        str     x524, [x117]
        //  %r118 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 12

        mov     x525, #12
        add     x526, x29, #-160
        mov     x527, #8
        mul     x528, x527, x525
        add     x118, x526, x528
        //  store i32 3, i32* %r118

        mov     x529, #3
        str     x529, [x118]
        //  %r119 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 13

        mov     x530, #13
        add     x531, x29, #-160
        mov     x532, #8
        mul     x533, x532, x530
        add     x119, x531, x533
        //  store i32 4, i32* %r119

        mov     x534, #4
        str     x534, [x119]
        //  %r120 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 14

        mov     x535, #14
        add     x536, x29, #-160
        mov     x537, #8
        mul     x538, x537, x535
        add     x120, x536, x538
        //  store i32 5, i32* %r120

        mov     x539, #5
        str     x539, [x120]
        //  %r121 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 15

        mov     x540, #15
        add     x541, x29, #-160
        mov     x542, #8
        mul     x543, x542, x540
        add     x121, x541, x543
        //  store i32 6, i32* %r121

        mov     x544, #6
        str     x544, [x121]
        //  %r122 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 16

        mov     x545, #16
        add     x546, x29, #-160
        mov     x547, #8
        mul     x548, x547, x545
        add     x122, x546, x548
        //  store i32 7, i32* %r122

        mov     x549, #7
        str     x549, [x122]
        //  %r123 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 17

        mov     x550, #17
        add     x551, x29, #-160
        mov     x552, #8
        mul     x553, x552, x550
        add     x123, x551, x553
        //  store i32 8, i32* %r123

        mov     x554, #8
        str     x554, [x123]
        //  %r124 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 18

        mov     x555, #18
        add     x556, x29, #-160
        mov     x557, #8
        mul     x558, x557, x555
        add     x124, x556, x558
        //  store i32 9, i32* %r124

        mov     x559, #9
        str     x559, [x124]
        //  %r125 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 19

        mov     x560, #19
        add     x561, x29, #-160
        mov     x562, #8
        mul     x563, x562, x560
        add     x125, x561, x563
        //  store i32 0, i32* %r125

        mov     x564, #0
        str     x564, [x125]
        //  %r126 = alloca [ 20 x i32 ]

        //  %r127 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 0

        mov     x565, #0
        add     x566, x29, #-320
        mov     x567, #8
        mul     x568, x567, x565
        add     x127, x566, x568
        //  store i32 2, i32* %r127

        mov     x569, #2
        str     x569, [x127]
        //  %r128 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 1

        mov     x570, #1
        add     x571, x29, #-320
        mov     x572, #8
        mul     x573, x572, x570
        add     x128, x571, x573
        //  store i32 3, i32* %r128

        mov     x574, #3
        str     x574, [x128]
        //  %r129 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 2

        mov     x575, #2
        add     x576, x29, #-320
        mov     x577, #8
        mul     x578, x577, x575
        add     x129, x576, x578
        //  store i32 4, i32* %r129

        mov     x579, #4
        str     x579, [x129]
        //  %r130 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 3

        mov     x580, #3
        add     x581, x29, #-320
        mov     x582, #8
        mul     x583, x582, x580
        add     x130, x581, x583
        //  store i32 2, i32* %r130

        mov     x584, #2
        str     x584, [x130]
        //  %r131 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 4

        mov     x585, #4
        add     x586, x29, #-320
        mov     x587, #8
        mul     x588, x587, x585
        add     x131, x586, x588
        //  store i32 5, i32* %r131

        mov     x589, #5
        str     x589, [x131]
        //  %r132 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 5

        mov     x590, #5
        add     x591, x29, #-320
        mov     x592, #8
        mul     x593, x592, x590
        add     x132, x591, x593
        //  store i32 7, i32* %r132

        mov     x594, #7
        str     x594, [x132]
        //  %r133 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 6

        mov     x595, #6
        add     x596, x29, #-320
        mov     x597, #8
        mul     x598, x597, x595
        add     x133, x596, x598
        //  store i32 9, i32* %r133

        mov     x599, #9
        str     x599, [x133]
        //  %r134 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 7

        mov     x600, #7
        add     x601, x29, #-320
        mov     x602, #8
        mul     x603, x602, x600
        add     x134, x601, x603
        //  store i32 9, i32* %r134

        mov     x604, #9
        str     x604, [x134]
        //  %r135 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 8

        mov     x605, #8
        add     x606, x29, #-320
        mov     x607, #8
        mul     x608, x607, x605
        add     x135, x606, x608
        //  store i32 0, i32* %r135

        mov     x609, #0
        str     x609, [x135]
        //  %r136 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 9

        mov     x610, #9
        add     x611, x29, #-320
        mov     x612, #8
        mul     x613, x612, x610
        add     x136, x611, x613
        //  store i32 1, i32* %r136

        mov     x614, #1
        str     x614, [x136]
        //  %r137 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 10

        mov     x615, #10
        add     x616, x29, #-320
        mov     x617, #8
        mul     x618, x617, x615
        add     x137, x616, x618
        //  store i32 9, i32* %r137

        mov     x619, #9
        str     x619, [x137]
        //  %r138 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 11

        mov     x620, #11
        add     x621, x29, #-320
        mov     x622, #8
        mul     x623, x622, x620
        add     x138, x621, x623
        //  store i32 8, i32* %r138

        mov     x624, #8
        str     x624, [x138]
        //  %r139 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 12

        mov     x625, #12
        add     x626, x29, #-320
        mov     x627, #8
        mul     x628, x627, x625
        add     x139, x626, x628
        //  store i32 7, i32* %r139

        mov     x629, #7
        str     x629, [x139]
        //  %r140 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 13

        mov     x630, #13
        add     x631, x29, #-320
        mov     x632, #8
        mul     x633, x632, x630
        add     x140, x631, x633
        //  store i32 6, i32* %r140

        mov     x634, #6
        str     x634, [x140]
        //  %r141 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 14

        mov     x635, #14
        add     x636, x29, #-320
        mov     x637, #8
        mul     x638, x637, x635
        add     x141, x636, x638
        //  store i32 4, i32* %r141

        mov     x639, #4
        str     x639, [x141]
        //  %r142 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 15

        mov     x640, #15
        add     x641, x29, #-320
        mov     x642, #8
        mul     x643, x642, x640
        add     x142, x641, x643
        //  store i32 3, i32* %r142

        mov     x644, #3
        str     x644, [x142]
        //  %r143 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 16

        mov     x645, #16
        add     x646, x29, #-320
        mov     x647, #8
        mul     x648, x647, x645
        add     x143, x646, x648
        //  store i32 2, i32* %r143

        mov     x649, #2
        str     x649, [x143]
        //  %r144 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 17

        mov     x650, #17
        add     x651, x29, #-320
        mov     x652, #8
        mul     x653, x652, x650
        add     x144, x651, x653
        //  store i32 1, i32* %r144

        mov     x654, #1
        str     x654, [x144]
        //  %r145 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 18

        mov     x655, #18
        add     x656, x29, #-320
        mov     x657, #8
        mul     x658, x657, x655
        add     x145, x656, x658
        //  store i32 2, i32* %r145

        mov     x659, #2
        str     x659, [x145]
        //  %r146 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 19

        mov     x660, #19
        add     x661, x29, #-320
        mov     x662, #8
        mul     x663, x662, x660
        add     x146, x661, x663
        //  store i32 2, i32* %r146

        mov     x664, #2
        str     x664, [x146]
        //  %r402 = load i32, i32* @len

        adrp     x665, len
        add     x665, x665, #:lo12:len
        ldr     x402, [x665]
        //  %r403 = add i32 0, 0

        mov     x403, #0
        //  %r404 = add i32 %r402, 0

        mov     x404, x402
        //  %r405 = load i32, i32* @len

        adrp     x666, len
        add     x666, x666, #:lo12:len
        ldr     x405, [x666]
        //  %r406 = add i32 0, 0

        mov     x406, #0
        //  %r407 = add i32 %r405, 0

        mov     x407, x405
        //  %r151 = alloca [ 25 x i32 ]

        //  %r152 = alloca [ 25 x i32 ]

        //  %r153 = alloca [ 40 x i32 ]

        //  %r154 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0

        mov     x667, #0
        add     x668, x29, #-1040
        mov     x669, #8
        mul     x670, x669, x667
        add     x154, x668, x670
        //  store i32 0, i32* %r154

        mov     x671, #0
        str     x671, [x154]
        //  %r155 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 1

        mov     x672, #1
        add     x673, x29, #-1040
        mov     x674, #8
        mul     x675, x674, x672
        add     x155, x673, x675
        //  store i32 0, i32* %r155

        mov     x676, #0
        str     x676, [x155]
        //  %r156 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 2

        mov     x677, #2
        add     x678, x29, #-1040
        mov     x679, #8
        mul     x680, x679, x677
        add     x156, x678, x680
        //  store i32 0, i32* %r156

        mov     x681, #0
        str     x681, [x156]
        //  %r157 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 3

        mov     x682, #3
        add     x683, x29, #-1040
        mov     x684, #8
        mul     x685, x684, x682
        add     x157, x683, x685
        //  store i32 0, i32* %r157

        mov     x686, #0
        str     x686, [x157]
        //  %r158 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 4

        mov     x687, #4
        add     x688, x29, #-1040
        mov     x689, #8
        mul     x690, x689, x687
        add     x158, x688, x690
        //  store i32 0, i32* %r158

        mov     x691, #0
        str     x691, [x158]
        //  %r159 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 5

        mov     x692, #5
        add     x693, x29, #-1040
        mov     x694, #8
        mul     x695, x694, x692
        add     x159, x693, x695
        //  store i32 0, i32* %r159

        mov     x696, #0
        str     x696, [x159]
        //  %r160 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 6

        mov     x697, #6
        add     x698, x29, #-1040
        mov     x699, #8
        mul     x700, x699, x697
        add     x160, x698, x700
        //  store i32 0, i32* %r160

        mov     x701, #0
        str     x701, [x160]
        //  %r161 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 7

        mov     x702, #7
        add     x703, x29, #-1040
        mov     x704, #8
        mul     x705, x704, x702
        add     x161, x703, x705
        //  store i32 0, i32* %r161

        mov     x706, #0
        str     x706, [x161]
        //  %r162 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 8

        mov     x707, #8
        add     x708, x29, #-1040
        mov     x709, #8
        mul     x710, x709, x707
        add     x162, x708, x710
        //  store i32 0, i32* %r162

        mov     x711, #0
        str     x711, [x162]
        //  %r163 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 9

        mov     x712, #9
        add     x713, x29, #-1040
        mov     x714, #8
        mul     x715, x714, x712
        add     x163, x713, x715
        //  store i32 0, i32* %r163

        mov     x716, #0
        str     x716, [x163]
        //  %r164 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 10

        mov     x717, #10
        add     x718, x29, #-1040
        mov     x719, #8
        mul     x720, x719, x717
        add     x164, x718, x720
        //  store i32 0, i32* %r164

        mov     x721, #0
        str     x721, [x164]
        //  %r165 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 11

        mov     x722, #11
        add     x723, x29, #-1040
        mov     x724, #8
        mul     x725, x724, x722
        add     x165, x723, x725
        //  store i32 0, i32* %r165

        mov     x726, #0
        str     x726, [x165]
        //  %r166 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 12

        mov     x727, #12
        add     x728, x29, #-1040
        mov     x729, #8
        mul     x730, x729, x727
        add     x166, x728, x730
        //  store i32 0, i32* %r166

        mov     x731, #0
        str     x731, [x166]
        //  %r167 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 13

        mov     x732, #13
        add     x733, x29, #-1040
        mov     x734, #8
        mul     x735, x734, x732
        add     x167, x733, x735
        //  store i32 0, i32* %r167

        mov     x736, #0
        str     x736, [x167]
        //  %r168 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 14

        mov     x737, #14
        add     x738, x29, #-1040
        mov     x739, #8
        mul     x740, x739, x737
        add     x168, x738, x740
        //  store i32 0, i32* %r168

        mov     x741, #0
        str     x741, [x168]
        //  %r169 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 15

        mov     x742, #15
        add     x743, x29, #-1040
        mov     x744, #8
        mul     x745, x744, x742
        add     x169, x743, x745
        //  store i32 0, i32* %r169

        mov     x746, #0
        str     x746, [x169]
        //  %r170 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 16

        mov     x747, #16
        add     x748, x29, #-1040
        mov     x749, #8
        mul     x750, x749, x747
        add     x170, x748, x750
        //  store i32 0, i32* %r170

        mov     x751, #0
        str     x751, [x170]
        //  %r171 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 17

        mov     x752, #17
        add     x753, x29, #-1040
        mov     x754, #8
        mul     x755, x754, x752
        add     x171, x753, x755
        //  store i32 0, i32* %r171

        mov     x756, #0
        str     x756, [x171]
        //  %r172 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 18

        mov     x757, #18
        add     x758, x29, #-1040
        mov     x759, #8
        mul     x760, x759, x757
        add     x172, x758, x760
        //  store i32 0, i32* %r172

        mov     x761, #0
        str     x761, [x172]
        //  %r173 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 19

        mov     x762, #19
        add     x763, x29, #-1040
        mov     x764, #8
        mul     x765, x764, x762
        add     x173, x763, x765
        //  store i32 0, i32* %r173

        mov     x766, #0
        str     x766, [x173]
        //  %r174 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 20

        mov     x767, #20
        add     x768, x29, #-1040
        mov     x769, #8
        mul     x770, x769, x767
        add     x174, x768, x770
        //  store i32 0, i32* %r174

        mov     x771, #0
        str     x771, [x174]
        //  %r175 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 21

        mov     x772, #21
        add     x773, x29, #-1040
        mov     x774, #8
        mul     x775, x774, x772
        add     x175, x773, x775
        //  store i32 0, i32* %r175

        mov     x776, #0
        str     x776, [x175]
        //  %r176 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 22

        mov     x777, #22
        add     x778, x29, #-1040
        mov     x779, #8
        mul     x780, x779, x777
        add     x176, x778, x780
        //  store i32 0, i32* %r176

        mov     x781, #0
        str     x781, [x176]
        //  %r177 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 23

        mov     x782, #23
        add     x783, x29, #-1040
        mov     x784, #8
        mul     x785, x784, x782
        add     x177, x783, x785
        //  store i32 0, i32* %r177

        mov     x786, #0
        str     x786, [x177]
        //  %r178 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 24

        mov     x787, #24
        add     x788, x29, #-1040
        mov     x789, #8
        mul     x790, x789, x787
        add     x178, x788, x790
        //  store i32 0, i32* %r178

        mov     x791, #0
        str     x791, [x178]
        //  %r179 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 25

        mov     x792, #25
        add     x793, x29, #-1040
        mov     x794, #8
        mul     x795, x794, x792
        add     x179, x793, x795
        //  store i32 0, i32* %r179

        mov     x796, #0
        str     x796, [x179]
        //  %r180 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 26

        mov     x797, #26
        add     x798, x29, #-1040
        mov     x799, #8
        mul     x800, x799, x797
        add     x180, x798, x800
        //  store i32 0, i32* %r180

        mov     x801, #0
        str     x801, [x180]
        //  %r181 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 27

        mov     x802, #27
        add     x803, x29, #-1040
        mov     x804, #8
        mul     x805, x804, x802
        add     x181, x803, x805
        //  store i32 0, i32* %r181

        mov     x806, #0
        str     x806, [x181]
        //  %r182 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 28

        mov     x807, #28
        add     x808, x29, #-1040
        mov     x809, #8
        mul     x810, x809, x807
        add     x182, x808, x810
        //  store i32 0, i32* %r182

        mov     x811, #0
        str     x811, [x182]
        //  %r183 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 29

        mov     x812, #29
        add     x813, x29, #-1040
        mov     x814, #8
        mul     x815, x814, x812
        add     x183, x813, x815
        //  store i32 0, i32* %r183

        mov     x816, #0
        str     x816, [x183]
        //  %r184 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 30

        mov     x817, #30
        add     x818, x29, #-1040
        mov     x819, #8
        mul     x820, x819, x817
        add     x184, x818, x820
        //  store i32 0, i32* %r184

        mov     x821, #0
        str     x821, [x184]
        //  %r185 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 31

        mov     x822, #31
        add     x823, x29, #-1040
        mov     x824, #8
        mul     x825, x824, x822
        add     x185, x823, x825
        //  store i32 0, i32* %r185

        mov     x826, #0
        str     x826, [x185]
        //  %r186 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 32

        mov     x827, #32
        add     x828, x29, #-1040
        mov     x829, #8
        mul     x830, x829, x827
        add     x186, x828, x830
        //  store i32 0, i32* %r186

        mov     x831, #0
        str     x831, [x186]
        //  %r187 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 33

        mov     x832, #33
        add     x833, x29, #-1040
        mov     x834, #8
        mul     x835, x834, x832
        add     x187, x833, x835
        //  store i32 0, i32* %r187

        mov     x836, #0
        str     x836, [x187]
        //  %r188 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 34

        mov     x837, #34
        add     x838, x29, #-1040
        mov     x839, #8
        mul     x840, x839, x837
        add     x188, x838, x840
        //  store i32 0, i32* %r188

        mov     x841, #0
        str     x841, [x188]
        //  %r189 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 35

        mov     x842, #35
        add     x843, x29, #-1040
        mov     x844, #8
        mul     x845, x844, x842
        add     x189, x843, x845
        //  store i32 0, i32* %r189

        mov     x846, #0
        str     x846, [x189]
        //  %r190 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 36

        mov     x847, #36
        add     x848, x29, #-1040
        mov     x849, #8
        mul     x850, x849, x847
        add     x190, x848, x850
        //  store i32 0, i32* %r190

        mov     x851, #0
        str     x851, [x190]
        //  %r191 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 37

        mov     x852, #37
        add     x853, x29, #-1040
        mov     x854, #8
        mul     x855, x854, x852
        add     x191, x853, x855
        //  store i32 0, i32* %r191

        mov     x856, #0
        str     x856, [x191]
        //  %r192 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 38

        mov     x857, #38
        add     x858, x29, #-1040
        mov     x859, #8
        mul     x860, x859, x857
        add     x192, x858, x860
        //  store i32 0, i32* %r192

        mov     x861, #0
        str     x861, [x192]
        //  %r193 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 39

        mov     x862, #39
        add     x863, x29, #-1040
        mov     x864, #8
        mul     x865, x864, x862
        add     x193, x863, x865
        //  store i32 0, i32* %r193

        mov     x866, #0
        str     x866, [x193]
        //  %r408 = add i32 0, 0

        mov     x408, #0
        //  %r409 = phi i32 [ %r408, %bb1 ], [ %r464, %bb3 ]

        mov     x409, x408
        //  br label %bb2


        b     bb2
        //bb2:

bb2:

        //  %r409 = phi i32 [ %r408, %bb1 ], [ %r464, %bb3 ]

        //  %r410 = icmp slt i32 %r409, %r404

        cmp     x409, x404
        //  br i1 %r410, label %bb3, label %bb4


        b.lt     bb3
        b     bb4
        //bb3:

bb3:

        //  %r197 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r409

        add     x867, x29, #-520
        mov     x868, #8
        mul     x869, x868, x409
        add     x197, x867, x869
        //  %r199 = getelementptr [20 x i32 ], [20 x i32 ]* %r105, i32 0, i32 %r409

        add     x870, x29, #-160
        mov     x871, #8
        mul     x872, x871, x409
        add     x199, x870, x872
        //  %r462 = load i32, i32* %r199

        ldr     x462, [x199]
        //  store i32 %r462, i32* %r197

        str     x462, [x197]
        //  %r463 = add i32 %r409, 1

        mov     x873, #1
        add     x463, x409, x873
        //  %r464 = add i32 %r463, 0

        mov     x464, x463
        //  %r409 = phi i32 [ %r408, %bb1 ], [ %r464, %bb3 ]

        mov     x409, x464
        //  br label %bb2


        b     bb2
        //bb4:

bb4:

        //  %r411 = add i32 0, 0

        mov     x411, #0
        //  %r412 = phi i32 [ %r411, %bb4 ], [ %r461, %bb6 ]

        mov     x412, x411
        //  br label %bb5


        b     bb5
        //bb5:

bb5:

        //  %r412 = phi i32 [ %r411, %bb4 ], [ %r461, %bb6 ]

        //  %r413 = icmp slt i32 %r412, %r407

        cmp     x412, x407
        //  br i1 %r413, label %bb6, label %bb7


        b.lt     bb6
        b     bb7
        //bb6:

bb6:

        //  %r207 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r412

        add     x874, x29, #-720
        mov     x875, #8
        mul     x876, x875, x412
        add     x207, x874, x876
        //  %r209 = getelementptr [20 x i32 ], [20 x i32 ]* %r126, i32 0, i32 %r412

        add     x877, x29, #-320
        mov     x878, #8
        mul     x879, x878, x412
        add     x209, x877, x879
        //  %r459 = load i32, i32* %r209

        ldr     x459, [x209]
        //  store i32 %r459, i32* %r207

        str     x459, [x207]
        //  %r460 = add i32 %r412, 1

        mov     x880, #1
        add     x460, x412, x880
        //  %r461 = add i32 %r460, 0

        mov     x461, x460
        //  %r412 = phi i32 [ %r411, %bb4 ], [ %r461, %bb6 ]

        mov     x412, x461
        //  br label %bb5


        b     bb5
        //bb7:

bb7:

        //  %r414 = add i32 %r404, %r407

        add     x414, x404, x407
        //  %r415 = sub i32 %r414, 1

        mov     x881, #1
        sub     x415, x414, x881
        //  %r416 = add i32 %r415, 0

        mov     x416, x415
        //  %r417 = add i32 0, 0

        mov     x417, #0
        //  %r418 = phi i32 [ %r417, %bb7 ], [ %r458, %bb9 ]

        mov     x418, x417
        //  br label %bb8


        b     bb8
        //bb8:

bb8:

        //  %r418 = phi i32 [ %r417, %bb7 ], [ %r458, %bb9 ]

        //  %r419 = icmp sle i32 %r418, %r416

        cmp     x418, x416
        //  br i1 %r419, label %bb9, label %bb10


        b.le     bb9
        b     bb10
        //bb9:

bb9:

        //  %r221 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r418

        add     x882, x29, #-1040
        mov     x883, #8
        mul     x884, x883, x418
        add     x221, x882, x884
        //  store i32 0, i32* %r221

        mov     x885, #0
        str     x885, [x221]
        //  %r457 = add i32 %r418, 1

        mov     x886, #1
        add     x457, x418, x886
        //  %r458 = add i32 %r457, 0

        mov     x458, x457
        //  %r418 = phi i32 [ %r417, %bb7 ], [ %r458, %bb9 ]

        mov     x418, x458
        //  br label %bb8


        b     bb8
        //bb10:

bb10:

        //  %r420 = add i32 0, 0

        mov     x420, #0
        //  %r421 = sub i32 %r407, 1

        mov     x887, #1
        sub     x421, x407, x887
        //  %r422 = add i32 %r421, 0

        mov     x422, x421
        //  %r423 = phi i32 [ %r416, %bb10 ], [ %r443, %bb16 ]

        mov     x423, x416
        //  %r424 = phi i32 [ %r422, %bb10 ], [ %r445, %bb16 ]

        mov     x424, x422
        //  br label %bb11


        b     bb11
        //bb11:

bb11:

        //  %r423 = phi i32 [ %r416, %bb10 ], [ %r443, %bb16 ]

        //  %r424 = phi i32 [ %r422, %bb10 ], [ %r445, %bb16 ]

        //  %r425 = sub i32 0, 1

        mov     x888, #0
        mov     x889, #1
        sub     x425, x888, x889
        //  %r426 = icmp sgt i32 %r424, %r425

        cmp     x424, x425
        //  br i1 %r426, label %bb12, label %bb13


        b.gt     bb12
        b     bb13
        //bb12:

bb12:

        //  %r230 = getelementptr [25 x i32 ], [25 x i32 ]* %r152, i32 0, i32 %r424

        add     x890, x29, #-720
        mov     x891, #8
        mul     x892, x891, x424
        add     x230, x890, x892
        //  %r427 = load i32, i32* %r230

        ldr     x427, [x230]
        //  %r428 = add i32 %r427, 0

        mov     x428, x427
        //  %r429 = sub i32 %r404, 1

        mov     x893, #1
        sub     x429, x404, x893
        //  %r430 = add i32 %r429, 0

        mov     x430, x429
        //  %r431 = phi i32 [ %r430, %bb12 ], [ %r438, %bb15 ]

        mov     x431, x430
        //  %r432 = phi i32 [ %r423, %bb12 ], [ %r440, %bb15 ]

        mov     x432, x423
        //  br label %bb14


        b     bb14
        //bb14:

bb14:

        //  %r431 = phi i32 [ %r430, %bb12 ], [ %r438, %bb15 ]

        //  %r432 = phi i32 [ %r423, %bb12 ], [ %r440, %bb15 ]

        //  %r433 = sub i32 0, 1

        mov     x894, #0
        mov     x895, #1
        sub     x433, x894, x895
        //  %r434 = icmp sgt i32 %r431, %r433

        cmp     x431, x433
        //  br i1 %r434, label %bb15, label %bb16


        b.gt     bb15
        b     bb16
        //bb15:

bb15:

        //  %r238 = getelementptr [25 x i32 ], [25 x i32 ]* %r151, i32 0, i32 %r431

        add     x896, x29, #-520
        mov     x897, #8
        mul     x898, x897, x431
        add     x238, x896, x898
        //  %r435 = load i32, i32* %r238

        ldr     x435, [x238]
        //  %r436 = add i32 %r435, 0

        mov     x436, x435
        //  %r437 = sub i32 %r431, 1

        mov     x899, #1
        sub     x437, x431, x899
        //  %r438 = add i32 %r437, 0

        mov     x438, x437
        //  %r439 = sub i32 %r432, 1

        mov     x900, #1
        sub     x439, x432, x900
        //  %r440 = add i32 %r439, 0

        mov     x440, x439
        //  %r431 = phi i32 [ %r430, %bb12 ], [ %r438, %bb15 ]

        mov     x431, x438
        //  %r432 = phi i32 [ %r423, %bb12 ], [ %r440, %bb15 ]

        mov     x432, x440
        //  br label %bb14


        b     bb14
        //bb16:

bb16:

        //  %r441 = add i32 %r432, %r404

        add     x441, x432, x404
        //  %r442 = sub i32 %r441, 1

        mov     x901, #1
        sub     x442, x441, x901
        //  %r443 = add i32 %r442, 0

        mov     x443, x442
        //  %r444 = sub i32 %r424, 1

        mov     x902, #1
        sub     x444, x424, x902
        //  %r445 = add i32 %r444, 0

        mov     x445, x444
        //  %r423 = phi i32 [ %r416, %bb10 ], [ %r443, %bb16 ]

        mov     x423, x443
        //  %r424 = phi i32 [ %r422, %bb10 ], [ %r445, %bb16 ]

        mov     x424, x445
        //  br label %bb11


        b     bb11
        //bb13:

bb13:

        //  %r252 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0

        mov     x903, #0
        add     x904, x29, #-1040
        mov     x905, #8
        mul     x906, x905, x903
        add     x252, x904, x906
        //  %r446 = load i32, i32* %r252

        ldr     x446, [x252]
        //  %r447 = icmp ne i32 %r446, 0

        mov     x907, #0
        cmp     x446, x907
        //  br i1 %r447, label %bb17, label %bb18


        b.ne     bb17
        b     bb18
        //bb17:

bb17:

        //  %r254 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 0

        mov     x908, #0
        add     x909, x29, #-1040
        mov     x910, #8
        mul     x911, x910, x908
        add     x254, x909, x911
        //  %r448 = load i32, i32* %r254

        ldr     x448, [x254]
        //  call void @putint(i32 %r448)

        mov     x0, x448
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     putint
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  br label %bb19


        b     bb19
        //bb18:

bb18:

        //  br label %bb19


        b     bb19
        //bb19:

bb19:

        //  %r449 = add i32 1, 0

        mov     x449, #1
        //  %r450 = phi i32 [ %r449, %bb19 ], [ %r456, %bb21 ]

        mov     x450, x449
        //  br label %bb20


        b     bb20
        //bb20:

bb20:

        //  %r450 = phi i32 [ %r449, %bb19 ], [ %r456, %bb21 ]

        //  %r451 = add i32 %r404, %r407

        add     x451, x404, x407
        //  %r452 = sub i32 %r451, 1

        mov     x912, #1
        sub     x452, x451, x912
        //  %r453 = icmp sle i32 %r450, %r452

        cmp     x450, x452
        //  br i1 %r453, label %bb21, label %bb22


        b.le     bb21
        b     bb22
        //bb21:

bb21:

        //  %r262 = getelementptr [40 x i32 ], [40 x i32 ]* %r153, i32 0, i32 %r450

        add     x913, x29, #-1040
        mov     x914, #8
        mul     x915, x914, x450
        add     x262, x913, x915
        //  %r454 = load i32, i32* %r262

        ldr     x454, [x262]
        //  call void @putint(i32 %r454)

        mov     x0, x454
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     putint
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  %r455 = add i32 %r450, 1

        mov     x916, #1
        add     x455, x450, x916
        //  %r456 = add i32 %r455, 0

        mov     x456, x455
        //  %r450 = phi i32 [ %r449, %bb19 ], [ %r456, %bb21 ]

        mov     x450, x456
        //  br label %bb20


        b     bb20
        //bb22:

bb22:

        //  call void @_sysy_stoptime(i32 117)

        mov     x0, #117
        stp     x9, x10, [sp, #-16]!
        stp     x11, x12, [sp, #-16]!
        stp     x13, x14, [sp, #-16]!
        str     x15, [sp, #-8]!
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        bl     _sysy_stoptime
        ldp     x29, x30, [sp], #16
        ldr     x15, [sp], #8
        ldp     x13, x14, [sp], #16
        ldp     x11, x12, [sp], #16
        ldp     x9, x10, [sp], #16
        //  ret i32 0

        mov     x0, #0
        mov     sp, x29
        ret
