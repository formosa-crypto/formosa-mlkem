# --------------------------------------------------------------------
CC ?= gcc
CFLAGS ?= -Wall -Wno-unused-function -O3
BIN ?= bin
TARGETS ?= $(BIN)/bench_pqclean_clean $(BIN)/bench_pqclean_avx2

# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

bin/bench_pqclean_clean: libs | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./common/crypto_kem.c ./src/pqclean/clean/libkyber768_clean.a ./src/randombytes/librandombytes1.a

bin/bench_pqclean_avx2: libs | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./common/crypto_kem.c ./src/pqclean/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN): ; @mkdir -p $@

# --------------------------------------------------------------------
.PHONY: libs
libs:
	make -C ./src/randombytes/
	make -C ./src/pqclean/clean/
	make -C ./src/pqclean/avx2/

# --------------------------------------------------------------------
run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.out); done

# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/pqclean/clean/ clean
	make -C ./src/pqclean/avx2/ clean

clean: libs-clean
	rm -fr $(BIN)

