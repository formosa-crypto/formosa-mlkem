AR ?= ar
CC ?= gcc
CFLAGS ?= -Wall -Wno-unused-function -O3

.PHONY: libkyber768_avx2.a clean

libkyber768_avx2.a:
	jasminc -lea jkem.jazz -o jkem.s
	$(CC) -c jkem.s
	$(CC) $(CFLAGS) -I../../randombytes/ -c kem.c
	$(AR) -r $@ kem.o jkem.o

clean:
	rm -f *.o *.a *.s
