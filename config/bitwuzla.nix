{
  lib,
  fetchurl,
  buildDunePackage,
  gmp,
  zarith,
}:

let
  bitwuzla-c = buildDunePackage rec {
    pname = "bitwuzla-c";
    version = "1.0.5";

    src = fetchurl {
      url = "https://github.com/bitwuzla/ocaml-bitwuzla/releases/download/${version}/bitwuzla-${version}.tbz";
      hash = "sha256-vzKQieT7945dTK/zSSJ6C5inXS8XSTHJQproxZScamw=";
    };

    buildInputs = [ gmp ];

  };
in

buildDunePackage rec {
  pname = "bitwuzla";
  inherit (bitwuzla-c) version src;

  propagatedBuildInputs = [
    bitwuzla-c
    zarith
  ];
}
