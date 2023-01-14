# Overview

## To run the benchmarks:

Running:

```
make run
```

should produce a `bin/` directory with `bench` executables and `*.out` files (took ~6 minutes on my i7-6500u).

Every implementation (pqclean and Jasmin) uses the same randombytes C implementation, and the best median of 3 executions (with each execution having 10000 calls to the corresponding function) is recorded. Each `*.out` file has 11 lines (change in `common/config.h` which corresponds to running the previous experiment 11 times (easier to ensure if the machine is somewhat stable by inspecting the `*.out` files). The order of the columns is: `keygen,enc,dec`. The input pointers are aligned at 64 bytes (to reduce noise). Each run set of 10000 executions has 10000 different keypairs (all "sub" pointers are aligned).

## To record the benchmarks:

Run something like the following:

```
mkdir -p results/comet_lake-CPUMODEl
cp bin/*.out results/comet_lake-CPUMODEl
git add results/comet_lake-CPUMODEl
...
```

## To produce the macros:

Running (don't miss the `/` after `CPUMODEl`):

```
./benchmacros.sh results/skylake-i6500u/ sk
```

Should print (the contents correspond to line 6 --- `*.out` files are sorted):

```
\newcommand{\crefgenskcc}{248152}
\newcommand{\crefencskcc}{306516}
\newcommand{\crefdecskcc}{347698}
\newcommand{\cavxgenskcc}{56948}
\newcommand{\cavxencskcc}{72944}
\newcommand{\cavxdecskcc}{53508}
\newcommand{\jrefgenskcc}{411502}
\newcommand{\jrefencskcc}{487440}
\newcommand{\jrefdecskcc}{559948}
\newcommand{\javxgenskcc}{50038}
\newcommand{\javxencskcc}{64964}
\newcommand{\javxdecskcc}{50426}
\newcommand{\joptgenskcc}{71126}
\newcommand{\joptencskcc}{86048}
\newcommand{\joptdecskcc}{71038}
```

And then redirect/c&p to anywhere you want.

# Running some tests:

Running:

```
make run-tests
```

should print the following:

```
8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730
8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730
8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730
8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730
8004a42f34a4125acb4f88628139576882cdf9502a77937003e34f52d217a730
```

These correspond to `checksumbig` from supercop. All being equal means that its OK. This was done mostly to ensure that `avx2v` was OK.

# SUPERCOP

I didn't commit (yet) the SUPERCOP changes that are required to replicate the results. Run `git blame` on this file and reach me out.

After the setup of SUPERCOP, run:

```
./supercop.sh
mkdir -p results/skylake-i76500u/supercop/raw 
mv bin/* results/skylake-i76500u/supercop/raw/
./benchmacros-supercop.sh results/skylake-i76500u/supercop/raw sk > results/skylake-i76500u/supercop/macros.tex
```


