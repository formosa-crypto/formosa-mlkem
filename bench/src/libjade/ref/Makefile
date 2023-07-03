.PHONY: libkyber768_ref.a clean distclean

libkyber768_ref.a: jkem.jpp
	jasminc -nowarning jkem.jpp -o jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o


clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
