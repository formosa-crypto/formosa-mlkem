CC?=/usr/bin/gcc
CFLAGS = -march=native -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE

default: randombytes.a

randombytes.a: jasmin_syscall.o randombytes.o
	ar -rc $@ $^ && ranlib $@

%.o: %.c %.h
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fr *.a *.o
