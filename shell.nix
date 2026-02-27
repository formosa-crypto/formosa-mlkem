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
    src = fetchFromGitLab {
      owner = "jasmin-lang";
      repo = "jasmin-compiler";
      rev = "731add92e577d47afa1b88c8a80b3216af29ee40";
      hash = "sha256-2VfTqnQMioiPAdgQGAfUA4GT/r3CLO5HmzBd532S5NI=";
    };
  })
; in

let crypto-specs =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "crypto-specs";
    rev = "fb050598ed356c5c6604d92a1e198b2dd4543777";
    hash = "sha256-SG2jQzBcce/aPQAbJSVold2gm7buHOrOBsK7MHNIRFs=";
  }
; in

let formosa-keccak =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "formosa-keccak";
    rev = "b156255e8119edff499c91aea5a9d5f0385cbfe0";
    hash = "sha256-8mQFs229LOQx783t+rfql/fAvQxYQYnvv4NSHGto8wY=";
  }
; in

let
  oc = ocaml-ng.ocamlPackages_4_14;
  why = why3.override {
    ocamlPackages = oc;
    ideSupport = false;
    coqPackages = { coq = null; flocq = null; };
  };
  bitwuzla = callPackage ./config/bitwuzla.nix { inherit (oc) buildDunePackage zarith; };
  ecVersion = "701fd101aa31224720747ff3733a5364899a3387";
  ec = (easycrypt.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "vbgl";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-TJ5WeS5wqCSjvAlkvy5oRf4uxiocR54ukVyL2ESmJdY=";
    };
    postPatch = ''
      substituteInPlace dune-project \
        --replace-warn '(name easycrypt)' '(name easycrypt)(version ${ecVersion})'
    '';
    buildInputs = o.buildInputs ++ (with oc; [
      bitwuzla hex iter markdown progress ppx_deriving_yojson pcre2 tyxml
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
    { key = "CryptoSpecs"; val = "${crypto-specs}/fips202"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/ml-kem"; }
  ];
  EC_IDIRS = mkECvar [
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/common"; }
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/ref"; }
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/avx2"; }
    { key = "JazzEC"; val = "${formosa-keccak}/proof/amd64/extracted"; }
    { key = "JazzEC"; val = "${crypto-specs}/arrays"; }
    { key = "JazzEC"; val = "${crypto-specs}/common"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/arrays"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/common"; }
  ];
})
