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
  echo "crypto_kem/mlkem1024/amd64/ref"
  echo "crypto_kem/mlkem1024/amd64/avx2"
}

flatten_jazz() {
  cd $BUILDTMPDIR
  pwd
}

gen_implementation() {
  if [ "${#}" -eq 2 ]; then

    IMPLEMENTATION="${1}"
    TARGETDIR="${2}"

    # test if libjade DIRECTORY exists
    if [ ! -d "${TARGETDIR}" ]; then
      fatal "target directory does not exist: ${TARGETDIR} "
    fi

    if [ -d ${BUILDTMPDIR} ]; then
      rm -r ${BUILDTMPDIR}
    fi
    mkdir ${BUILDTMPDIR}

    if [ ${IMPLEMENTATION} = "crypto_kem/mlkem768/amd64/ref" ];then
      cp -r ${PROJECTDIR}/code/jasmin/768/ref/* ${BUILDTMPDIR}
      flatten_jazz jkem.jazz ${TARGETDIR}/kyber768.jazz
      cp "${BUILDTMPDIR}/api.h" "${TARGETDIR}/kyber768.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem768/amd64/avx2" ];then
      cp -r "${PROJECTDIR}/code/jasmin/768/avx2/*" ${BUILDTMPDIR}
      flatten_jazz jkem.jazz ${TARGETDIR}/kyber768.jazz
      cp "${BUILDTMPDIR}/api.h" "${TARGETDIR}/kyber768.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem1024/amd64/ref" ];then
      cp -r "${PROJECTDIR}/code/jasmin/1024/ref/*" ${BUILDTMPDIR}
      flatten_jazz jkem.jazz ${TARGETDIR}/kyber1024.jazz
      cp "${BUILDTMPDIR}/api.h" "${TARGETDIR}/kyber1024.h"
    elif [ ${IMPLEMENTATION} = "crypto_kem/mlkem1024/amd64/avx2" ];then
      cp -r "${PROJECTDIR}/code/jasmin/1024/avx2/*" ${BUILDTMPDIR}
      flatten_jazz jkem.jazz ${TARGETDIR}/kyber1024.jazz
      cp "${BUILDTMPDIR}/api.h" "${TARGETDIR}/kyber1024.h"
    else
      fatal "Implementation not supported: ${IMPLEMENTATION} "
    fi
      
    rm -r ${BUILDTMPDIR}
    return 0

  else
    fatal_usage "$0 --gen-implementation: number of required arguments 3 : provided $#"
  fi
}

main() {
  cd "$(dirname "${0}")"
  PROJECTDIR="$(pwd -P)"
  BUILDTMPDIR="${PROJECTDIR}/build-tmp"
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
