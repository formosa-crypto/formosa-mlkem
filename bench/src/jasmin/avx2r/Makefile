.PHONY: libkyber768_avx2r.a clean

libkyber768_avx2r.a:
	jasminc -nowarning -lea jkem.jazz -o jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o


clean:
	rm -f *.o *.a *.s
