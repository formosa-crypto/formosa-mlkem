{ pkgs ?
    import (fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/3de8f8d73e35724bf9abef41f1bdbedda1e14a31.tar.gz;
      sha256 = "sha256:1akf8bq8i1flj33sdwl95lkng4wgwlzh9yxylk2drq8fksg5i291";
    }) {}
, full ? true
}:

with pkgs;

let jasmin =
  jasmin-compiler.overrideAttrs (o: {
    src = fetchFromGitLab {
      owner = "jasmin-lang";
      repo = "jasmin-compiler";
      rev = "v2025.06.1";
      hash = "sha256-6E6lTrR6lxMKbVHLnjxML8rbLyu4bJxeqOxHwBOszxk=";
    };
  })
; in

let crypto-specs =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "crypto-specs";
    rev = "7f48d933a393fa3019ff6015f50fcd8d98147e26";
    hash = "sha256-kQe8brGk8q9zTc7E0M9902sGlTc4Mpsrqc4gyilK3jk=";
  }
; in

let formosa-keccak =
  fetchFromGitHub {
    owner = "formosa-crypto";
    repo = "formosa-keccak";
    rev = "40118f698e3fb3c39f1763aee76da794a19fdcf3";
    hash = "sha256-tZnzWfbFKqFnarhlAHmoDEsxVRYQy7xk4EE6AZOf3Qo=";
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
  ecVersion = "cf546c41e43f4db631ca58e0991b6de7425abb55";
  ec = (easycrypt.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "EasyCrypt";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-eybret9ysLdmMsiVu9+OimOwHZLMh4haA/86o6wwUIs=";
    };
    postPatch = ''
      substituteInPlace dune-project \
        --replace-warn '(name easycrypt)' '(name easycrypt)(version ${ecVersion})'
    '';
    buildInputs = o.buildInputs ++ (with oc; [
      bitwuzla hex iter progress ppx_deriving_yojson pcre2
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
    cvc5
    z3
  ];

  EC_RDIRS = mkECvar [
    { key = "Jasmin"; val = "${jasmin.lib}/lib/easycrypt/jasmin"; }
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
