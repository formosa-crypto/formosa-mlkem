#!/usr/bin/env bash

# example:
#   ./benchmacros-supercop.sh
# or
#   ./benchmacros-supercop.sh results/haswell-i74770k/supercop/raw/ hw > results/haswell-i74770k/supercop/macros.tex
#   ...

if [ ! "$#" -eq 2 ]; then
  ./benchmacros-supercop.sh results/haswell-i74770k/supercop/raw/ hw > results/haswell-i74770k/supercop/macros.tex
  ./benchmacros-supercop.sh results/skylake-i76500u/supercop/raw/ sk > results/skylake-i76500u/supercop/macros.tex
  ./benchmacros-supercop.sh results/cannonlake-i710700k/supercop/raw/ cl > results/cannonlake-i710700k/supercop/macros.tex
  ./benchmacros-supercop.sh results/alderlake-i71260p/supercop/raw/ al > results/alderlake-i71260p/supercop/macros.tex
  exit;
fi

dir=$1 # results/CPU/supercop/raw/
cpu=$2 # sk hw cl al

#crypto_kem_kyber768_ref              -> cref_op_cpu_ccs
#crypto_kem_kyber768_avx2             -> cavx_op_cpu_ccs
#crypto_kem_kyber768_jasmin_ref       -> jref_op_cpu_ccs
#crypto_kem_kyber768_jasmin_avx2      -> jopt_op_cpu_ccs
#crypto_kem_kyber768_jasmin_avx2v     -> javx_op_cpu_ccs
#crypto_kem_kyber768_libjade_ref      -> lref_op_cpu_ccs
#crypto_kem_kyber768_libjade_avx2     -> lopt_op_cpu_ccs
#crypto_kem_kyber768_libjade_rnd_ref  -> rref_op_cpu_ccs
#crypto_kem_kyber768_libjade_rnd_avx2 -> ravx_op_cpu_ccs

get()
{
  file=$1; tag=$2; cpu=$3;

  if ! [ -f $file ]
  then
    gen="XXX"
    enc="XXX"
    dec="XXX"
  else
    gen=$(cat $file | grep -Eo "keypair_cycles - [0-9]*" | sed -e 's/keypair_cycles - //' | sort -g | sed -n '6,+0p');
    enc=$(cat $file | grep -Eo "enc_cycles - [0-9]*" | sed -e 's/enc_cycles - //' | sort -g | sed -n '6,+0p');
    dec=$(cat $file | grep -Eo "dec_cycles - [0-9]*" | sed -e 's/dec_cycles - //' | sort -g | sed -n '6,+0p');
  fi

  echo "\newcommand{\\${tag}gen${cpu}ccs}{${gen}}"
  echo "\newcommand{\\${tag}enc${cpu}ccs}{${enc}}"
  echo "\newcommand{\\${tag}dec${cpu}ccs}{${dec}}"
}

for t in ref,cref avx2,cavx jasmin_ref,jref jasmin_avx2,jopt jasmin_avx2v,javx libjade_ref,lref libjade_avx2,lavx libjade_rref,rref libjade_ravx2,ravx;
do IFS=','
  set -- $t
  get "${dir}/crypto_kem_kyber768_${1}" "${2}" "${cpu}"
done
