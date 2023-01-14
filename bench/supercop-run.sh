#!/usr/bin/env bash

# example:
#   ./supercop-run.sh
# or
#   ./supercop-run resutls/haswell-i74770k/supercop/raw
#   ./supercop-run resutls/skylake-i76500u/supercop/raw
#   ./supercop-run resutls/cannonlake-i710700k/supercop/raw
#   ./supercop-run resutls/alderlake-i71260p/supercop/raw

supercop=supercop-20221122-clang-14
target=bin

if [ "$#" -eq 1 ]; then
  target=$1;
fi

cd $supercop

for dir in ref avx2 jasmin_ref jasmin_avx2 jasmin_avx2v libjade_ref libjade_avx2;
do
  dir=crypto_kem/kyber768/$dir
  name=${dir//\//_};
  args=${dir//\// };
  ./do-part $args;
  find bench/ -name data -exec cp {} ../$target/$name \;
done

for dir in  libjade_rref libjade_ravx2;
do
  dir=crypto_kem/kyber768/$dir
  name=${dir//\//_};
  args=${dir//\// };
  ./do-part-try-disabled $args;
  find bench/ -name data -exec cp {} ../$target/$name \;
done


