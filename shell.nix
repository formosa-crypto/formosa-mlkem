{ pkgs ?
    import (fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/dee6c49f2361b678b4f2c868081989ac92279f6a.tar.gz;
      sha256 = "sha256:11c9b68gbr06s1czvhfnzdmix9fzyjbg76xnrhfgympm4clykn9b";
    }) {}
, full ? true
}:

with pkgs;

let jasmin =
  jasmin-compiler.overrideAttrs (o: {
    src = fetchFromGitLab {
      owner = "jasmin-lang";
      repo = "jasmin-compiler";
      rev = "v2025.06.0";
      hash = "sha256-pATAWGsp6bFWg5m1O5Sg86hDOS8TN++DN+dXgXdSn5w=";
    };
  })
; in

let crypto-specs =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "crypto-specs";
    rev = "be385c1803cb7ea7a6521fdf97429081bfa88174";
    hash = "sha256-wEJzjfiCg6MPqfo+Qdi8PnHgKGmGFpYmhmoTYiRh8EA=";
  }
; in

let formosa-keccak =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "formosa-keccak";
    rev = "5f16c4a0548b4220ce9438a7c52a4feb01c2c4b3";
    hash = "sha256-WlBwunfRV32o5v2583TUt+TLZUQ3JK6lCHKK8LZn5NU=";
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
  ecVersion = "c9717f9146429bea92647fdc49d575fc44f2b11d";
  ec = (easycrypt.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "EasyCrypt";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-CISmx3IrJH872rEd587JOTH5qPgyJyZP583e80vHMwI=";
    };
    postPatch = ''
      substituteInPlace dune-project \
        --replace-warn '(name easycrypt)' '(name easycrypt)(version ${ecVersion})'
    '';
    buildInputs = o.buildInputs ++ (with oc; [
      bitwuzla hex iter progress ppx_deriving_yojson
    ]);
  })).override {
    ocamlPackages = oc;
    why3 = why;
  };
  altergo = callPackage ./config/alt-ergo.nix { ocamlPackages = oc; } ;
in

let mkECvar = lib.strings.concatMapStringsSep ";" ({key, val}: "${key}:${val}"); in

mkShell ({
  JASMINC = "${jasmin.bin}/bin/jasminc";
  JASMINCT = "${jasmin.bin}/bin/jasmin-ct";
  JASMIN2EC = "${jasmin.bin}/bin/jasmin2ec";
  JASMINPATH="Keccak=${formosa-keccak}/src/amd64";
} // lib.optionalAttrs full {
  packages = [
    ec
    altergo
    cvc4
    z3
  ];

  EC_RDIRS = mkECvar [
    { key = "Jasmin"; val = "${jasmin.lib}/lib/jasmin/easycrypt"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/fips202"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/ml-kem"; }
  ];
  EC_IDIRS = mkECvar [
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/ref"; }
    { key = "Keccak"; val = "${formosa-keccak}/proof/amd64/avx2"; }
    { key = "JazzEC"; val = "${formosa-keccak}/proof/amd64/extracted"; }
    { key = "JazzEC"; val = "${crypto-specs}/arrays"; }
    { key = "CryptoSpecs"; val = "${crypto-specs}/common"; }
  ];
})
