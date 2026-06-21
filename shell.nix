{ pkgs ?
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/c6f52ebd45e5925c188d1a20119978aa4ffd5ef6.tar.gz";
      sha256 = "sha256-m5KWt1nOm76ILk/JSCxBM4MfK3rYY7Wq9/TZIIeGnT8=";
    }) {}
, full ? true
}:

with pkgs;

let jasmin =
  jasmin-compiler.overrideAttrs (o: {
    version = "2026.03.1";
    src = fetchurl {
      url = "https://github.com/jasmin-lang/jasmin/releases/download/v2026.03.1/jasmin-compiler-v2026.03.1.tar.bz2";
      hash = "sha256-eOn5KWNAPx7Z+VMm8mclUyxDlW8Q/MR9EayUxmojb1I=";
    };
  })
; in

let formosa-keccak =
  fetchgit {
    url = "https://github.com/formosa-crypto/formosa-keccak.git";
    rev = "2db21a051a0caa750d52ab9552a5825c015cfc3d";
    hash = "sha256-7Z9OTbqNPu6uWiaxca8o42GOw6o2x9cb95ouP7i2/r4=";
    fetchSubmodules = true;
  }
; in

let
  oc = ocaml-ng.ocamlPackages_4_14;
  why = why3.override {
    ocamlPackages = oc;
    ideSupport = false;
    coqPackages = { coq = null; flocq = null; };
  };
  ecVersion = "a131fcd394184d39ca88f3beb2ff50d626d20eef";
  ec = (easycrypt.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "easycrypt";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-IIX1h8Vo/etRkElg65F3groH2QZm+WMEdvazL0cITlE=";
    };
    postPatch = ''
      substituteInPlace dune-project \
        --replace-warn '(name easycrypt)' '(name easycrypt)(version ${ecVersion})'
    '';
    buildInputs = o.buildInputs ++ (with oc; [
      bitwuzla-cxx hex iter lsp lwt markdown progress ppx_deriving_yojson pcre2 tyxml
    ]);
  })).override {
    ocamlPackages = oc;
    why3 = why;
  };
in

let mkECvar = lib.strings.concatMapStringsSep ";" ({key, val}: "${key}:${val}"); in

mkShell ({
  JASMINC = "${jasmin.bin}/bin/jasminc";
  JASMINCT = "${jasmin.bin}/bin/jasmin-ct";
  JASMIN2EC = "${jasmin.bin}/bin/jasmin2ec";
  JASMINPATH="Keccak=${formosa-keccak}/src/amd64";
  packages = [
    valgrind 
  ];
} // lib.optionalAttrs full {
  packages = [
    ec
    cvc5
    z3
  ];

  EC_RDIRS = mkECvar [
    { key = "Jasmin"; val = "${jasmin.lib}/lib/easycrypt/jasmin"; }
    { key = "CryptoSpecs"; val = "${formosa-keccak}/submodules/crypto-specs/fips202"; }
  ];
  EC_IDIRS = mkECvar [
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/common"; }
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/ref"; }
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/avx2"; }
    { key = "JazzEC"; val = "${formosa-keccak}/proof/amd64/extracted"; }
    { key = "CryptoSpecs"; val = "${formosa-keccak}/submodules/crypto-specs/common"; }
  ];
})
