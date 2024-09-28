.PHONY: libkyber768_avx2.a clean distclean

# pick the compiler from the submodule
JASMINC ?= ../../../../jasmin/compiler/jasminc

libkyber768_avx2.a:
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
