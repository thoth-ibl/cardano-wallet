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
        name = "acid-state-exts";
        version = "0.14.2";
      };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "Lemmih <lemmih@gmail.com>";
      author = "David Himmelstrup";
      homepage = "https://github.com/acid-state/acid-state";
      url = "";
      synopsis = "Add ACID guarantees to any serializable Haskell data structure.";
      description = "Use regular Haskell data structures as your database and get stronger ACID guarantees than most RDBMS offer.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs.acid-state)
          (hsPkgs.base)
          (hsPkgs.directory)
          (hsPkgs.filepath)
          (hsPkgs.exceptions)
          (hsPkgs.extra)
          (hsPkgs.mtl)
          (hsPkgs.safecopy)
          (hsPkgs.time-units)
        ] ++ pkgs.lib.optional (system.isWindows) (hsPkgs.Win32);
      };
    };
  } // {
    src = pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-sl";
      rev = "8d97d5e00a3bfe1d6cf92c55f656ac9b81884096";
      sha256 = "0bdckjjzppmv24az0qz8asxkqkga6smwa2lm56ynkm63h5nv50x3";
    };
    postUnpack = "sourceRoot+=/acid-state-exts; echo source root reset to \$sourceRoot";
  }