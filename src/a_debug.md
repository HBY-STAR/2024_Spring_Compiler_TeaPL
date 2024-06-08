gdb compiler
run tests/public/BFS.tea tests/public/BFS.ll < tests/public/BFS.in
run tests/public/big_int_mul.tea tests/public/big_int_mul.ll
run tests/public/dijkstra.tea tests/public/dijkstra.ll < tests/public/dijkstra.in

// a.tea run
./compiler tests/my/a.tea
aarch64-linux-gnu-gcc -g -c tests/my/a.S -o output/a.o
aarch64-linux-gnu-gcc -g output/a.o sylib/sylib.o -o output/a
qemu-aarch64 -L /usr/aarch64-linux-gnu ./output/a > output/a.out

// a.tea debug
qemu-aarch64 -L /usr/aarch64-linux-gnu -g 1234 ./output/a > output/a.out
gdb-multiarch ./output/a
target remote localhost:1234
break /home/hby/compiler_project/src/tests/my/a.S:2100
continue
x/10i $pc
x/8x $sp + 56
info registers x9
x/8x 0x550181a700

(gdb) x/8x $x9
0x550181a868:   0x00000006      0x00000000      0x00000000      0x00000000
0x550181a878:   0x00000003      0x00000000      0x00000006      0x00000000
x/8x 0x550181a868

ls /usr/aarch64-linux-gnu/lib/ld-linux-aarch64.so.1
export QEUM_LD_PREFIX=/usr/aarch64-linux-gnu
printenv QEUM_LD_PREFIX

start qemu
qemu-aarch64 -L /usr/aarch64-linux-gnu -g 1234 ./output/BFS < tests/public/BFS.in > output/BFS.out
qemu-aarch64 -L /usr/aarch64-linux-gnu ./output/BFS < tests/public/BFS.in > output/BFS.out



another terminal
gdb-multiarch ./output/BFS
target remote localhost:1234
run /output/BFS < tests/public/BFS.in > output/BFS.out



0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2



(gdb) x/8xw $sp
0x5501819870:   0x00000008      0x00000000      0x00000009      0x00000000
0x5501819880:   0x01819930      0x00000055      0x018973fc      0x00000055
(gdb) x/8xw $sp+8
0x5501819878:   0x00000009      0x00000000      0x01819930      0x00000055
0x5501819888:   0x018973fc      0x00000055      0x01864ca0      0x00000055


watch *(int *)0x550181a700

0x550181a700:   0x00000006      0x00000000      0x0181a900      0x00000055
0x550181a710:   0x0181a8e8      0x00000055      0x0181a8d0      0x00000055
(gdb) x/8x $x9+8
0x550181a708:   0x0181a900      0x00000055      0x0181a8e8      0x00000055
0x550181a718:   0x0181a8d0      0x00000055      0x0181a8b8      0x00000055
(gdb) x/8x $x9-8
0x550181a6f8:   0x00000003      0x00000000      0x00000006      0x00000000
0x550181a708:   0x0181a900      0x00000055      0x0181a8e8      0x00000055
(gdb) x/8x $x9-16
0x550181a6f0:   0x00000000      0x00000000      0x00000003      0x00000000
0x550181a700:   0x00000006      0x00000000      0x0181a900      0x00000055
(gdb) 


(gdb) x/8x $x9
0x550181a700:   0x00000006      0x00000000      0x0181a900      0x00000055
0x550181a710:   0x0181a8e8      0x00000055      0x0181a8d0      0x00000055