# TODO: cleanup / improve depen. / generic

# --------------------------------------------------------------------
CC ?= clang-14
CFLAGS ?= -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE

BIN ?= bin
TARGETS ?= \
$(BIN)/bench_pqclean_clean \
$(BIN)/bench_pqclean_avx2 \
$(BIN)/bench_jasmin_768_avx2 \
$(BIN)/bench_jasmin_1024_avx2 \
$(BIN)/bench_crystals_ref \
$(BIN)/bench_crystals_avx2 \
# $(BIN)/bench_jasmin_768_ref \
# $(BIN)/bench_jasmin_1024_ref \
# $(BIN)/bench_libjade_ref \
# $(BIN)/bench_libjade_avx2

TTARGETS ?= \
$(BIN)/test_pqclean_clean \
$(BIN)/test_pqclean_avx2 \
$(BIN)/test_jasmin_768_avx2 \
$(BIN)/test_jasmin_1024_avx2 \
$(BIN)/test_crystals_ref \
$(BIN)/test_crystals_avx2 \
#$(BIN)/test_jasmin_768_ref \
#$(BIN)/test_jasmin_1024_ref \
# $(BIN)/test_libjade_ref \
# $(BIN)/test_libjade_avx2


# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

$(BIN)/bench_pqclean_clean: rnd libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./common/crypto_kem.c ./src/pqclean/clean/libkyber768_clean.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_pqclean_avx2: rnd libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./common/crypto_kem.c ./src/pqclean/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

# $(BIN)/bench_jasmin_768_ref: rnd libj_768_ref | $(BIN)# add without derand
# 	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/768/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref ./common/crypto_kem.c ./src/jasmin/768/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_768_avx2: rnd libj_768_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/768/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 ./common/crypto_kem.c ./src/jasmin/768/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

# $(BIN)/bench_jasmin_1024_ref: rnd libj_1024_ref | $(BIN) # add without derand
# 	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/1024/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref ./common/crypto_kem.c ./src/jasmin/1024/ref/libkyber1024_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_1024_avx2: rnd libj_1024_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/1024/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 ./common/crypto_kem.c ./src/jasmin/1024/avx2/libkyber1024_avx2.a ./src/randombytes/librandombytes1.a

#--
$(BIN)/bench_crystals_ref: rnd libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./common/crypto_kem.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_crystals_avx2: rnd libcry_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pq-crystals/avx2/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_AVX2 -DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 ./common/crypto_kem.c ./src/pq-crystals/avx2/libpqcrystals_kyber768_avx2.a ./src/randombytes/librandombytes1.a

#--
# $(BIN)/bench_libjade_ref: rnd liblj_ref | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/libjade/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./common/crypto_kem.c ./src/libjade/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

# $(BIN)/bench_libjade_avx2: rnd liblj_avx2 | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/libjade/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./common/crypto_kem.c ./src/libjade/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a



# --------------------------------------------------------------------
.PHONY: all $(TTARGETS)
all-tests: $(TTARGETS)

$(BIN)/test_pqclean_clean: libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pqclean/clean/libkyber768_clean.a

$(BIN)/test_pqclean_avx2: libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pqclean/avx2/libkyber768_avx2.a

# $(BIN)/test_jasmin_768_ref: libcry_ref | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/768/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/768/ref/libkyber768_ref.a

$(BIN)/test_jasmin_768_avx2: libj_768_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/768/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/768/avx2/libkyber768_avx2.a

# $(BIN)/test_jasmin_1024_ref: libj_1024_ref | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/1024/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER1024_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber1024_amd64_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/1024/ref/libkyber1024_ref.a

$(BIN)/test_jasmin_1024_avx2: libj_1024_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/1024/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER1024_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber1024_amd64_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/1024/avx2/libkyber1024_avx2.a

#--
$(BIN)/test_crystals_ref: libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.a

$(BIN)/test_crystals_avx2: libcry_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pq-crystals/avx2/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_AVX2 -DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pq-crystals/avx2/libpqcrystals_kyber768_avx2.a

# --
# $(BIN)/test_libjade_ref: liblj_ref | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/libjade/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/libjade/ref/libkyber768_ref.a

# $(BIN)/test_libjade_avx2: liblj_avx2 | $(BIN)
# 	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/libjade/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/libjade/avx2/libkyber768_avx2.a


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

# libj_768_ref:
# 	make -C ./src/jasmin/768/ref

libj_768_avx2:
	make -C ./src/jasmin/768/avx2/

# libj_1024_ref:
# 	make -C ./src/jasmin/1024/ref

libj_1024_avx2:
	make -C ./src/jasmin/1024/avx2/

# --
libcry_ref:
	make -C ./src/pq-crystals/ref/ libpqcrystals_kyber768_ref.a

libcry_avx2:
	make -C ./src/pq-crystals/avx2/ libpqcrystals_kyber768_avx2.a

# --
# liblj_ref:
# 	make -C ./src/libjade/ref/

# liblj_avx2:
# 	make -C ./src/libjade/avx2/


# --------------------------------------------------------------------
run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.out); done

run-tests: $(TTARGETS)
	for d in $(TTARGETS); do (./$$d); done

# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/pqclean/clean/ clean
	make -C ./src/pqclean/avx2/ clean
	make -C ./src/jasmin/768/avx2/ clean
	make -C ./src/jasmin/1024/avx2/ clean
	make -C ./src/pq-crystals/ref/ clean
	make -C ./src/pq-crystals/avx2/ clean
# 	make -C ./src/jasmin/768/ref/ clean
# 	make -C ./src/jasmin/1024/ref/ clean
# 	make -C ./src/libjade/ref/ clean
# 	make -C ./src/libjade/avx2/ clean

clean: libs-clean
	rm -fr $(BIN)

