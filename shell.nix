{ pkgs ?
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/46397778ef1f73414b03ed553a3368f0e7e33c2f.tar.gz";
      sha256 = "sha256:1kl124v7ny2ar49s5498vx2jl3g8dwaqqvkdaqbjalhn9npl6dlv";
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
