{ pkgs ?
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/e402c3eb6d88384ca6c52ef1c53e61bdc9b84ddd.tar.gz";
      sha256 = "sha256:0yz78sahc3mzv38bah8chl2y9cmwsmp9r2p7xv4ny6rcvl1f94cf";
    }) {}
, full ? true
}:

with pkgs;

let
  oc = ocaml-ng.ocamlPackages_4_14;
  why = why3.override {
    ocamlPackages = oc;
    ideSupport = false;
    coqPackages = { coq = null; flocq = null; };
  };
  ecVersion = "a8274feb63b62d281db350cd6dd8940c69aca835";
  ec = (easycrypt.overrideAttrs (_: {
    src = fetchFromGitHub {
      owner = "EasyCrypt";
      repo = "easycrypt";
      rev = ecVersion;
      hash = "sha256-Rbs3alnnnDPbKrAqPq1pj/kedHWC+PvPFES4d+V8EAk=";
    };
    postPatch = ''
      substituteInPlace dune-project --replace '(name easycrypt)' '(name easycrypt)(version ${ecVersion})'
    '';
  })).override {
    ocamlPackages = oc;
    why3 = why;
  };
  altergo = alt-ergo.override { ocamlPackages = oc; } ;
in

mkShell ({
  JASMINC = "${jasmin-compiler.bin}/bin/jasminc";
  JAZZCT = "${jasmin-compiler.bin}/bin/jazzct";
} // lib.optionalAttrs full {
  packages = [
    ec
    altergo
    cvc4
    z3
  ];

  EC_RDIRS = "Jasmin:${jasmin-compiler.lib}/lib/jasmin/easycrypt";
})
