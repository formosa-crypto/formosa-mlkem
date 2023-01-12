.PHONY: libkyber768_avx2.a clean distclean

libkyber768_avx2.a:
	jasminc -nowarning -lea jkem.jpp -o jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o


clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
