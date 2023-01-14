.PHONY: libkyber768_ref.a clean distclean

libkyber768_ref.a:
	jasminc -nowarning -lea jkem.jazz -o jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o


clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
