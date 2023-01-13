#!/usr/bin/env bash

supercop=supercop-20221122-clang-14

 compile jasmin files if possible
if [ -x "$(command -v jasminc)" ]
then
  for src in src/jasmin/ src/libjade/;
  do 
    (find $src  -name Makefile -printf "%h\n" | while read dir; do (make -C $dir distclean && make -C $dir); done)
  done
fi

# clean (but not distclean -- no removal of *.s files)
for src in src/jasmin/ src/libjade/;
do 
  (find $src  -name Makefile -printf "%h\n" | while read dir; do (make -C $dir clean); done)
done

# copy patch files
(cd supercop-patch && find . -name api.h -printf "%h\n") | \
while read dir; do rm -fr ${supercop}/${dir} && cp -r -T supercop-patch/${dir} ${supercop}/${dir}; done

# copy assembly files
cp src/jasmin/ref/jkem.s ${supercop}/crypto_kem/kyber768/jasmin_ref/jkem.s
cp src/jasmin/avx2/jkem.s ${supercop}/crypto_kem/kyber768/jasmin_avx2/jkem.s
cp src/jasmin/avx2v/jkem.s ${supercop}/crypto_kem/kyber768/jasmin_avx2v/jkem.s
cp src/libjade/ref/jkem.s ${supercop}/crypto_kem/kyber768/libjade_ref/jkem.s
cp src/libjade/avx2/jkem.s ${supercop}/crypto_kem/kyber768/libjade_avx2/jkem.s
cp src/libjade/ref/jkem.s ${supercop}/crypto_kem/kyber768/libjade_rref/jkem.s
cp src/libjade/avx2/jkem.s ${supercop}/crypto_kem/kyber768/libjade_ravx2/jkem.s
