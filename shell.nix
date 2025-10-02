{ pkgs ?
    import (fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/9d1fa9fa266631335618373f8faad570df6f9ede.tar.gz;
      sha256 = "sha256:1pn90y4nw8c3gdz9c2chpy75hiay3872zhgfkmxc1mhgpkwx66bx";
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
    rev = "58d35d65630e17c79ebe58028a2ce64c467056e9";
    hash = "sha256-MlsrFcpDa1bocAoT4AMb9H08bCTBBs+yfczqwxK5aBI=";
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
  ecVersion = "ae9418da46b17fef73156599b1ecac72b7f4abaa";
  ec = (easycrypt.overrideAttrs (o: {
    src = fetchFromGitHub {
      owner = "EasyCrypt";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-OhwCt7VI+nX2+M5ftXvkRsNZSqMH0cKJtKD+8JZL4RI=";
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
