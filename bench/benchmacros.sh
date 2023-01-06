#!/usr/bin/env bash

# example:
# ./benchmacros.sh results/skylake-i6500u/ sk

dir=$1 # results/*
cpu=$2 # sk hw cl etc...

# bench_pqclean_clean.out -> cref_op_gen_cc
# bench_pqclean_avx2.out  -> cavx_op_gen_cc
# bench_jasmin_ref.out    -> jref_op_gen_cc
# bench_jasmin_avx2.out   -> javx_op_gen_cc
# bench_jasmin_avx2r.out  -> jopt_op_gen_cc

get()
{
  file=$1; tag=$2; cpu=$3;

  line=$(sed -n '6,+0p' $file) # change line here if needed
  gen=$(cut -d, -f1 < <(cat <<< "$line"))
  enc=$(cut -d, -f2 < <(cat <<< "$line"))
  dec=$(cut -d, -f3 < <(cat <<< "$line"))

  echo "\newcommand{\\${tag}gen${cpu}cc}{${gen}}"
  echo "\newcommand{\\${tag}enc${cpu}cc}{${enc}}"
  echo "\newcommand{\\${tag}dec${cpu}cc}{${dec}}"
}

for t in pqclean_clean,cref pqclean_avx2,cavx jasmin_ref,jref jasmin_avx2,javx jasmin_avx2r,jopt;
do IFS=','
  set -- $t
  get "${dir}/bench_${1}.out" "${2}" "${cpu}"
done
