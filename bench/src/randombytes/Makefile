CC ?= clang-14
CFLAGS ?= -march=native -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE

default: librandombytes1.a

librandombytes1.a: jasmin_syscall.o randombytes1.o
	ar -rc $@ $^ && ranlib $@

%.o: %.c %.h
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fr *.a *.o
