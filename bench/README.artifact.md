# Overview

Under folder `bench/table/`, you can find a `table.tex` file and a `Makefile`. Running `make` on `bench/table/` does the following:
* runs `make` on `bench/`, which compiles and executes the benchmark binaries (located in `bench/bin`) and writes a series of `*.out` files with the measurements;
* runs the `benchmacros.sh` script, which produces the `bench/table/macros.tex` with the selected measurements;
* compiles `bench/table/table.tex`, which imports `bench/table/macros.tex`, into `bench/table/table.pdf`, using `pdflatex`.

It is also possible to run `make` on `bench/` and manually inspect the `bin/*.out` files.

For convenience, we include the assembly files compiled with the Jasmin compiler to make this process simpler. These files are:
* `bench/src/jasmin/ref/jkem.s`, formally verified reference implementation;
* `bench/src/jasmin/avx2v/jkem.s`, formally verified vectorized implementation;
* `bench/src/jasmin/avx2/jkem.s`, fully optimized vectorized implementation.

These correspond to the code under `code/jasmin/{ref,avx2v,avx2}/`. If you have one of the latest versions of the Jasmin compiler available on your system, you can run `make distclean && make jkem.s` on `bench/src/jasmin/{ref,avx2v,avx2}/`. You can then rerun the benchmarks on `bench/` using `make` or on `bench/table` using `make distclean && make`.

The results present on the submitted paper were obtained using `clang-14` on all systems, and the flags were `-march=native -O3 -fomit-frame-pointer -fwrapv -Qunused-arguments -fPIC -fPIE`. Considering that `-Qunused-arguments` might not be available if only `gcc` is installed in your system, we removed it from the `Makefile`s exported to this artifact. If you have `clang-14` available in your system and want to run exactly with the same configuration: `make distclean && make CC="clang-14" CFLAGS="-march=native -O3 -fomit-frame-pointer -fwrapv -Qunused-arguments -fPIC -fPIE"`.

If you wish to check that the implementations being benchmarked are performing the expected computation (disclaimer: to some extent, since testing does not replace formal verification), you can run `make run-test` on `bench/`. This will compile the implementations (`bin/test_*` binaries) with the same testing code used by SUPERCOP, and a final checksum is printed. The expected checksum is `8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730` and can also be found on `supercop-20221122/crypto_kem/kyber768/checksumbig` (https://bench.cr.yp.to/supercop.html).

The expected execution time can take several minutes, depending on the CPU characteristics. If you wish to speed up things and still get a reasonable cycle count precision, open the file `bench/common/config.h` and change `#define TIMINGS 10000` to `#define TIMINGS 1000`. 
