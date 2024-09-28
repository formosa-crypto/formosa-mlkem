.PHONY: libkyber768_avx2v.a clean distclean

JASMINC ?= ../../../../jasmin/compiler/jasminc 

libkyber768_avx2v.a:
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
