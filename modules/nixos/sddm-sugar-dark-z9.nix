{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-sugar-dark-z9";
  src = pkgs.fetchFromGitHub {
    owner = "ZagadkaNine";
    repo = "sddm-sugar-dark-z9";
    rev = "370df67e3ba5f07eddbbbf8b184e22620d232f96";
    sha256 = "1yg07idnr5ka04f8zc40xi4mlxh6697jyccgs91cl49viwr3yyln";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
   '';
}
