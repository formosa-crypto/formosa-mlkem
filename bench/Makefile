CFLAGS ?= -Wall -O3 -fomit-frame-pointer -fno-lto -march=native

ALL := \
 bin/formosa-mlkem-768-avx2 \
 bin/formosa-mlkem-1024-avx2 \
 bin/formosa-mlkem-768-ref \
 bin/formosa-mlkem-1024-ref

ALL_EXTENDED := $(ALL) \
 bin/pqcp-mlkem-768-avx2 \
 bin/pqcp-mlkem-1024-avx2 \
 bin/mlkem-native-768-avx2 \
 bin/mlkem-native-1024-avx2

default: run

compile: $(ALL)
compile-extended: $(ALL_EXTENDED)

run: compile
	@./bin/formosa-mlkem-768-avx2 "" "fmlkem768 avx2" 1
	@./bin/formosa-mlkem-1024-avx2 "" "fmlkem1024 avx2" 0
	@./bin/formosa-mlkem-768-ref "" "fmlkem768 ref" 0
	@./bin/formosa-mlkem-1024-ref "" "fmlkem1024 ref" 0

run-extended: compile-extended
	@./bin/formosa-mlkem-768-avx2 "" "fmlkem768 avx2" 1
	@./bin/formosa-mlkem-1024-avx2 "" "fmlkem1024 avx2" 0
	@./bin/formosa-mlkem-768-ref "" "fmlkem768 ref" 0
	@./bin/formosa-mlkem-1024-ref "" "fmlkem1024 ref" 0
	@./bin/pqcp-mlkem-768-avx2 "" "pqcpmlkem768 avx2" 0
	@./bin/pqcp-mlkem-1024-avx2 "" "pqcpmlkem1024 avx2" 0
	@./bin/mlkem-native-768-avx2 "" "nat.mlkem768 avx2" 0
	@./bin/mlkem-native-1024-avx2 "" "nat.mlkem1024 avx2" 0

#-- formosa-mlkem (this repository ----------------------------------
#-- avx2
bin/formosa-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
    ../code/jasmin/768/avx2/jkem.s \
    randombytes/librandombytes1.a

bin/formosa-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
    ../code/jasmin/1024/avx2/jkem.s \
    randombytes/librandombytes1.a

#--ref
bin/formosa-mlkem-768-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/768/ref/include/ \
    ../code/jasmin/768/ref/jkem.s \
    randombytes/librandombytes1.a

bin/formosa-mlkem-1024-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/1024/ref/include/ \
    ../code/jasmin/1024/ref/jkem.s \
    randombytes/librandombytes1.a

#-- mlkem-libjade (from pq-code-package) ----------------------------
#--avx2
bin/pqcp-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem768_amd64_avx2/mlkem768_amd64_avx2.s \
    randombytes/librandombytes1.a

bin/pqcp-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem1024_amd64_avx2/mlkem1024_amd64_avx2.s \
    randombytes/librandombytes1.a

#-- mlkem-native (from pq-code-package) -----------------------------
#--avx2
bin/mlkem-native-768-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem768.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-768/ \
		third_party/mlkem-native/test/build/libmlkem768.a \
    randombytes/librandombytes1.a

bin/mlkem-native-1024-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem1024.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-1024/ \
		third_party/mlkem-native/test/build/libmlkem1024.a \
    randombytes/librandombytes1.a

third_party/mlkem-native/test/build/libmlkem768.a:
	$(MAKE) -C third_party/mlkem-native/ build

third_party/mlkem-native/test/build/libmlkem1024.a:
	$(MAKE) -C third_party/mlkem-native/ build

#-- randombytes -----------------------------------------------------
randombytes/librandombytes1.a:
	$(MAKE) -C randombytes/

#-- misc ------------------------------------------------------------
.PHONY: clean
clean:
	$(RM) -f bin/formosa-mlkem-*
	$(RM) -f bin/mlkem-native-*
	$(RM) -f bin/pqcp-mlkem-*
	$(MAKE) -C randombytes/ clean
	$(MAKE) -C third_party/mlkem-native clean
