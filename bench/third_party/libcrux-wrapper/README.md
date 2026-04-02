# libcrux bench wrapper

This crate provides a tiny C ABI wrapper around the `libcrux-ml-kem` Rust crate so
that `bench/src/crypto_kem.c` can benchmark libcrux using the same harness as the
other implementations.

The build is driven from `bench/Makefile` via:

```sh
make compile-extended
```

which runs:

```sh
cd third_party/libcrux-wrapper && LIBCRUX_ENABLE_SIMD256=1 cargo build --release
```

The final C link step currently uses `-lpthread -ldl -lm`, which matches the
common native libraries emitted by Rust static libraries on Linux. If your Rust
toolchain reports additional `native-static-libs`, add them to
`LIBCRUX_LDLIBS` in `bench/Makefile`.

The wrapper exports the five symbols expected by the benchmark harness for ML-KEM
768 and 1024:

- `LIBCRUX_MLKEM{768,1024}_keypair`
- `LIBCRUX_MLKEM{768,1024}_keypair_derand`
- `LIBCRUX_MLKEM{768,1024}_enc`
- `LIBCRUX_MLKEM{768,1024}_enc_derand`
- `LIBCRUX_MLKEM{768,1024}_dec`
