#!/usr/bin/env bash

# example:
#   ./benchmacros.sh
# or
#   ./benchmacros.sh results/haswell-i74770k/ hw > results/haswell-i74770k/macros.tex
#   ...

if [ ! "$#" -eq 2 ]; then
  ./benchmacros.sh results/haswell-i74770k/ hw > results/haswell-i74770k/macros.tex
  ./benchmacros.sh results/skylake-i76500u/ sk > results/skylake-i76500u/macros.tex
  ./benchmacros.sh results/cannonlake-i710700k/ cl > results/cannonlake-i710700k/macros.tex
  ./benchmacros.sh results/alderlake-i71260p/ al > results/alderlake-i71260p/macros.tex
  exit;
fi

dir=$1 # results/CPU/
cpu=$2 # sk hw cl al

# bench_crystals_ref.out   -> cref_op_cpu_cc
# bench_crystals_avx2.out  -> cavx_op_cpu_cc
# bench_jasmin_ref.out     -> jref_op_cpu_cc
# bench_jasmin_avx2.out    -> jopt_op_cpu_cc
# bench_jasmin_avx2v.out   -> javx_op_cpu_cc

get()
{
  file=$1; tag=$2; cpu=$3;

  if ! [ -f $file ]
  then
    line="XXX,XXX,XXX"
  else
    line=$(sed -n '6,+0p' $file) # change line here if needed
  fi  

  gen=$(cut -d, -f1 < <(cat <<< "$line"))
  enc=$(cut -d, -f2 < <(cat <<< "$line"))
  dec=$(cut -d, -f3 < <(cat <<< "$line"))

  echo "\newcommand{\\${tag}gen${cpu}cc}{${gen}}"
  echo "\newcommand{\\${tag}enc${cpu}cc}{${enc}}"
  echo "\newcommand{\\${tag}dec${cpu}cc}{${dec}}"
}

for t in crystals_ref,cref crystals_avx2,cavx jasmin_ref,jref jasmin_avx2,jopt jasmin_avx2v,javx libjade_ref,lref libjade_avx2,lavx;
do IFS=','
  set -- $t
  get "${dir}/bench_${1}.out" "${2}" "${cpu}"
done
