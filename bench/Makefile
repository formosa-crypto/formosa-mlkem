# TODO: cleanup / improve depen.

# --------------------------------------------------------------------
CC ?= gcc
CFLAGS ?= -Wall -Wno-unused-function -O3
BIN ?= bin
TARGETS ?= \
$(BIN)/bench_pqclean_clean \
$(BIN)/bench_pqclean_avx2 \
$(BIN)/bench_jasmin_ref \
$(BIN)/bench_jasmin_avx2

# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

$(BIN)/bench_pqclean_clean: rnd libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./common/crypto_kem.c ./src/pqclean/clean/libkyber768_clean.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_pqclean_avx2: rnd libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./common/crypto_kem.c ./src/pqclean/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_ref: rnd libj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./common/crypto_kem.c ./src/jasmin/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_avx2: rnd libj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./common/crypto_kem.c ./src/jasmin/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

# --------------------------------------------------------------------

$(BIN): ; @mkdir -p $@

# --------------------------------------------------------------------
.PHONY: rnd

rnd:
	make -C ./src/randombytes/

libpq_clean:
	make -C ./src/pqclean/clean/

libpq_avx2:
	make -C ./src/pqclean/avx2/

libj_ref:
	make -C ./src/jasmin/ref/

libj_avx2:
	make -C ./src/jasmin/avx2/

# --------------------------------------------------------------------
run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.out); done

# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/pqclean/clean/ clean
	make -C ./src/pqclean/avx2/ clean
	make -C ./src/jasmin/ref/ clean
	make -C ./src/jasmin/avx2/ clean

clean: libs-clean
	rm -fr $(BIN)

