#!/usr/bin/env bash

# pro user tip (because this repository shares the same structure as in libjade); assumes libjade is next to formosa-25519
#
# ./extract-libjade.sh --list-implementations | while read implementation; do ./extract-libjade.sh --gen-implementation $implementation ../libjade/src/$implementation; done

stderr() {
  echo >&2 "${@}"
}

fatal() {
  if (( "$#" == 0 )); then
    fatal "Some error ocurred"
  else
    stderr "error:" "$@"
    exit 1
  fi
}

fatal_abspath_usage() {
  fatal "abspath() usage: abspath <FILE>" 
}

print_usage() {
  stderr "usage:"
  stderr " \$ ${script} --list-implementations"
  stderr " \$ ${script} --gen-implementation IMPLEMENTATION DIRECTORY"
}

fatal_usage() {
  if (( "$#" != 0 )); then
    stderr "error:" "$@"
  fi
  print_usage
  exit 1
}

list_implementations() {
  echo "crypto_kem/mlkem768/amd64/ref"
  echo "crypto_kem/mlkem768/amd64/avx2"
#  echo "crypto_kem/mlkem1024/amd64/ref"
#  echo "crypto_kem/mlkem1024/amd64/avx2"
}

flatten_jazz() {
  WORKDIR=$(dirname $1)
  TARGETFILE=${2}
  cd ${WORKDIR}
  jasminc -I Keccak:../../../../formosa-keccak/src/amd64/ -ptyping -until_typing jkem.jazz > ${TARGETFILE}
#  mkdir -p .deps
#  ((printf "jkem.jpp: "; printf "jkem.jazz "; jasminc -I Keccak:../../../../formosa-keccak/src/amd64/ -print-dependencies jkem.jazz) > .deps/jkem.jpp.d)
#  (${JPP} -I Keccak:../../../../formosa-keccak/src/amd64/ -out jkem.jpp -in jkem.jazz)
#  mv jkem.jpp ${TARGETFILE}
#  rm -r .deps
}

gen_implementation() {
  if [ "${#}" -eq 2 ]; then

    IMPLEMENTATION="${1}"
    TARGETDIR=$(realpath "${2}")

    # test if libjade DIRECTORY exists
    if [ ! -d "${TARGETDIR}" ]; then
      fatal "target directory does not exist: ${TARGETDIR} "
    fi

    if [ ${IMPLEMENTATION} = "crypto_kem/mlkem768/amd64/ref" ];then
       flatten_jazz ${PROJECTDIR}/code/jasmin/768/ref/jkem.jazz $TARGETDIR/kem.jazz
       cp "${PROJECTDIR}/code/jasmin/768/ref/include/api.h" "${TARGETDIR}/api.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem768/amd64/avx2" ];then
       flatten_jazz ${PROJECTDIR}/code/jasmin/768/avx2/jkem.jazz $TARGETDIR/kem.jazz
       cp "${PROJECTDIR}/code/jasmin/768/avx2/include/api.h" "${TARGETDIR}/api.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem1024/amd64/ref" ];then
       flatten_jazz ${PROJECTDIR}/code/jasmin/1024/ref/jkem.jazz $TARGETDIR/kem.jazz
       cp "${PROJECTDIR}/code/jasmin/1024/ref/include/api.h" "${TARGETDIR}/api.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem1024/amd64/avx2" ];then
       flatten_jazz ${PROJECTDIR}/code/jasmin/1024/avx2/jkem.jazz $TARGETDIR/kem.jazz
       cp "${PROJECTDIR}/code/jasmin/1024/avx2/include/api.h" "${TARGETDIR}/api.h"
    else
      fatal "Implementation not supported: ${IMPLEMENTATION} "
    fi
      
    return 0

  else
    fatal_usage "$0 --gen-implementation: number of required arguments 3 : provided $#"
  fi
}

main() {
  cd "$(dirname "${0}")"
  PROJECTDIR="$(pwd -P)"
  JPP="${PROJECTDIR}/scripts/jpp"
  cd "${PROJECTDIR}"

  local cmd; cmd="$1"; shift || fatal_usage "Please specify a command"
  case "${cmd}" in
    "--list-implementations")
      list_implementations "$@" ;;
    "--gen-implementation")
      gen_implementation "$@" ;;
    *)
      fatal_usage "Invalid command: ${cmd}" ;;
  esac
}

init() {
  set -e
  script="${0}"
  main "${@}"
}

init "${@}"
