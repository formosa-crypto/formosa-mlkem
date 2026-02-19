.PHONY: libkyber768_ref.a clean distclean

JASMINC ?= ../../../../../jasmin/compiler/jasminc 
CC ?= clang-14
CFLAGS ?= -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE


all: libkyber768_ref.a

libkyber768_ref.a: jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
