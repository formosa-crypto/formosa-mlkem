# TODO: cleanup / improve depen. / generic

# --------------------------------------------------------------------
CC ?= clang-14
CFLAGS ?= -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE -mavx2 -march=native

BIN ?= bin
TARGETS ?= \
$(BIN)/bench_jasmin_768_ref \
$(BIN)/bench_jasmin_768_avx2 \
$(BIN)/bench_jasmin_1024_ref \
$(BIN)/bench_jasmin_1024_avx2 \
$(BIN)/bench_mlkem_native_768 \
$(BIN)/bench_mlkem_native_1024 



# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)


$(BIN)/bench_jasmin_768_ref: rnd libj_768_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/jasmin/768/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref ./bench/crypto_kem.c ./src/jasmin/768/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_768_avx2: rnd libj_768_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/jasmin/768/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 ./bench/crypto_kem.c ./src/jasmin/768/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_1024_ref: rnd libj_1024_ref | $(BIN) 
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/jasmin/1024/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref ./bench/crypto_kem.c ./src/jasmin/1024/ref/libkyber1024_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_1024_avx2: rnd libj_1024_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/jasmin/1024/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 ./bench/crypto_kem.c ./src/jasmin/1024/avx2/libkyber1024_avx2.a ./src/randombytes/librandombytes1.a

#--

$(BIN)/bench_mlkem_native_768: libmn | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/bindings/mlkem-native-768 -DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 -DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 ./bench/crypto_kem.c ./src/mlkem-native/test/build/libmlkem768.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_mlkem_native_1024: libmn | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./bench/ -I./src/bindings/mlkem-native-1024 -DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 -DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 ./bench/crypto_kem.c ./src/mlkem-native/test/build/libmlkem1024.a ./src/randombytes/librandombytes1.a

# --------------------------------------------------------------------

$(BIN): ; @mkdir -p $@

# --------------------------------------------------------------------
.PHONY: rnd

rnd:
	make -C ./src/randombytes/

libj_768_ref:
	make -C ./src/jasmin/768/ref

libj_768_avx2:
	make -C ./src/jasmin/768/avx2/

libj_1024_ref:
	make -C ./src/jasmin/1024/ref

libj_1024_avx2:
	make -C ./src/jasmin/1024/avx2/

libmn:
	make -C ./src/mlkem-native lib

# --------------------------------------------------------------------
run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.out); done


# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/jasmin/768/ref/ clean
	make -C ./src/jasmin/768/avx2/ clean
	make -C ./src/jasmin/1024/ref/ clean
	make -C ./src/jasmin/1024/avx2/ clean
	make -C ./src/mlkem-native/ clean

clean: libs-clean
	rm -fr $(BIN)

