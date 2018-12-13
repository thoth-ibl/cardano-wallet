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
        name = "cardano-sl-crypto-test";
        version = "2.0.0";
      };
      license = "MIT";
      copyright = "2016 IOHK";
      maintainer = "hi@serokell.io";
      author = "Serokell";
      homepage = "";
      url = "";
      synopsis = "Cardano SL - arbitrary instances for cardano-sl-crypto";
      description = "This package contains arbitrary instances for the cryptography primitives used in Cardano SL.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs.QuickCheck)
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.cardano-crypto)
          (hsPkgs.cardano-sl-binary)
          (hsPkgs.cardano-sl-binary-test)
          (hsPkgs.cardano-sl-crypto)
          (hsPkgs.cardano-sl-util)
          (hsPkgs.cardano-sl-util-test)
          (hsPkgs.cryptonite)
          (hsPkgs.generic-arbitrary)
          (hsPkgs.hedgehog)
          (hsPkgs.memory)
          (hsPkgs.quickcheck-instances)
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
    postUnpack = "sourceRoot+=/crypto/test; echo source root reset to \$sourceRoot";
  }