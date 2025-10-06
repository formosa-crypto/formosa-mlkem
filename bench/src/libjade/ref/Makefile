.PHONY: libkyber768_ref.a clean distclean

JASMINC ?= ../../../../jasmin/compiler/jasminc 


libkyber768_ref.a:
	$(JASMINC) -nowarning -lea jkem.jpp -o jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o


clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
