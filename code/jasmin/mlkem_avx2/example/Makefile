include ../../../Makefile.conf

CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer

default: run-example

RANDOMBYTES := $(PROJECT_DIR)/ext/randombytes/jasmin_syscall.o
$(RANDOMBYTES): $(PROJECT_DIR)/ext/randombytes/jasmin_syscall.c $(PROJECT_DIR)/ext/randombytes/jasmin_syscall.h
	$(MAKE) -C $(@D)

.PHONY: ../jkem.s
../jkem.s:
	$(MAKE) -C $(@D) $(@F)

jkem.s: ../jkem.s
	cp $< $@


example: example.c jkem.s api.h $(RANDOMBYTES)
	$(CC) $(CFLAGS) -o $@ example.c jkem.s $(RANDOMBYTES)

run-example: example
	./example



.PHONY: clean distclean
clean:
	rm -f example jkem.s

distclean: clean
	rm -f ../jkem.s
	$(MAKE) -C $(dir $(RANDOMBYTES)) clean

