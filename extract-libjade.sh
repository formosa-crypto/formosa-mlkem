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

gen_implementation() {
  if [ "${#}" -eq 2 ]; then

    # start by realpath them (useful to run make)
    implementation="${project_dir}"/src/"${1}"
    directory="${2}"

    # test if libjade DIRECTORY exists
    if [ ! -d "${directory}" ]; then
      fatal "target directory does not exist: ${directory} "
    fi

    echo ${implementation}
    echo ${directory}

    if [ -d "${project_dir}/build-tmp" ]; then
      rm -r ${project_dir}/build-tmp
    fi
    mkdir ${project_dir}/build-tmp

    

    return 0


  else
    fatal_usage "$0 --gen-implementation: number of required arguments 3 : provided $#"
  fi
}

main() {
  cd "$(dirname "${0}")"
  project_dir="$(pwd -P)"
  cd "${project_dir}"

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
