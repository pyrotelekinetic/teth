{

description = "A text editor";

inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

outputs = { self, nixpkgs }: let
  allSystems = output: nixpkgs.lib.genAttrs
    nixpkgs.lib.systems.flakeExposed
    (system: output nixpkgs.legacyPackages.${system});
in {
  packages = allSystems (pkgs: {
    default = pkgs.haskellPackages.developPackage { root = ./.; };
  });

  devShells = allSystems (pkgs: {
    default = pkgs.haskellPackages.shellFor {
      packages = _: [ self.packages.${pkgs.system}.default ];
      nativeBuildInputs = with pkgs.haskellPackages; [
        ghc
        ghcid
        hlint
        cabal-install
      ];
    };
  });
};

}
