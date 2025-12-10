.PHONY: libkyber768_avx2.a clean distclean

JASMINC ?= ../../../../../jasmin/compiler/jasminc 

all: libkyber768_avx2.a

CC ?= clang-14
CFLAGS ?= -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE -mavx2 -march=native

libkyber768_avx2.a: jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
