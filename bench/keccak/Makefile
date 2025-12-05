default: mlkem_keccak mlkem_new mlkem_old

.PHONY: mlkem_keccak mlkem_new mlkem_old clean

mlkem_keccak: bench_keccak.c ../../code/jasmin/1024/avx2/test/test_keccak_avx2.s
	gcc -g -o $@ -Wall -Wno-unused-function -Wno-unused-variable -I../common/ $?

mlkem_new: bench_keccak.c test_keccak_new.s
	gcc -g -o $@ -Wall -Wno-unused-function -Wno-unused-variable -I../common/ $?

mlkem_old: bench_keccak.c test_keccak_old.s
	gcc -g -o $@ -Wall -Wno-unused-function -Wno-unused-variable -I../common/ $?

clean:
	rm -fr mlkem_keccak mlkem_new mlkem_old
