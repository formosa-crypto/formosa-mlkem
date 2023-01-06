CC ?= gcc
CFLAGS ?= -Wall -O3

default: librandombytes1.a

librandombytes1.a: jasmin_syscall.o randombytes1.o
	ar -rc $@ $^ && ranlib $@

%.o: %.c %.h
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fr *.a *.o
