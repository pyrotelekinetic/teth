{

description = "A text editor in haskell";

inputs.nixpkgs = {
  type = "github";
  owner = "NixOS";
  repo = "nixpkgs";
  ref = "nixos-23.05";
};

outputs = { self, nixpkgs }: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  haskellPackages = pkgs.haskell.packages.ghc92;
  teth = haskellPackages.callPackage ./teth.nix { };
in {
  packages.x86_64-linux.default = teth;

  devShells.x86_64-linux.default = haskellPackages.shellFor {
    packages = _: with haskellPackages; [
      teth
      ghcid
      hlint
      cabal2nix
      cabal-install
    ];
  };
};

}
