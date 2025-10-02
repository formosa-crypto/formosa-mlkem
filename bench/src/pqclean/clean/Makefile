# This Makefile can be used with GNU Make or BSD Make

LIB=libkyber768_clean.a
HEADERS=api.h cbd.h indcpa.h kem.h ntt.h params.h poly.h polyvec.h reduce.h symmetric.h verify.h fips202.h
OBJECTS=cbd.o indcpa.o kem.o ntt.o poly.o polyvec.o reduce.o symmetric-shake.o verify.o fips202.o

CC ?= clang-14
CFLAGS ?= -march=native -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE -I../../randombytes $(EXTRAFLAGS)
#CFLAGS=-O3 -Wall -Wextra -Wpedantic -Werror -Wmissing-prototypes -Wredundant-decls -std=c99 -I../../randombytes $(EXTRAFLAGS)

all: $(LIB)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

$(LIB): $(OBJECTS)
	$(AR) -r $@ $(OBJECTS)

clean:
	$(RM) $(OBJECTS)
	$(RM) $(LIB)
