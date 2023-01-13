#!/bin/bash
#exec compile.bench

ulimit -s 50000

rm compile.bench

for arg in -until_typing -until_cstexp -until_inline -until_rmfunc -until_unroll -until_splitting -until_valloc -until_vallocd -until_vshare -until_vshared -until_arrexp -until_rmarrinit -until_rmglobals -until_arrexp -until_makeref -until_lowering -until_stkalloc -until_ralloc -until_rallocd -until_linear -until_asm; do

  echo "=====================================================" >> compile.bench
  echo "=====      Benchmark with flag $arg"                   >> compile.bench
  echo "=====================================================" >> compile.bench

  make clean
  export JADDFLAGS=$arg
  #(time make jindcpa.s) 2>compile.bench
  (time make jpolyvec.s 2>&1) 2>>compile.bench
done


