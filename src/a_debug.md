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