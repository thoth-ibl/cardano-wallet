{ system
, compiler
, flags
, pkgs
, hsPkgs
, pkgconfPkgs
, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = {
        name = "cardano-sl-node-ipc";
        version = "2.0.0";
      };
      license = "MIT";
      copyright = "";
      maintainer = "cleverca22@gmail.com";
      author = "Michael Bishop";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.aeson)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.cardano-sl-infra)
          (hsPkgs.cardano-sl-util)
          (hsPkgs.Cabal)
          (hsPkgs.mtl)
          (hsPkgs.universum)
        ];
      };
    };
  } // {
    src = pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-sl";
      rev = "8d97d5e00a3bfe1d6cf92c55f656ac9b81884096";
      sha256 = "0bdckjjzppmv24az0qz8asxkqkga6smwa2lm56ynkm63h5nv50x3";
    };
    postUnpack = "sourceRoot+=/node-ipc; echo source root reset to \$sourceRoot";
  }