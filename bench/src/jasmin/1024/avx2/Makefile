.PHONY: libkyber1024_avx2.a clean distclean

JASMINC ?= ../../../../../jasmin/compiler/jasminc 

all: libkyber1024_avx2.a

libkyber1024_avx2.a: jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
