{

description = "A text editor in haskell";

inputs = {
	nixpkgs = {
		type = "github";
		owner = "NixOS";
		repo = "nixpkgs";
		ref = "release-22.11";
	};
};

outputs = { self, nixpkgs }:
	let
		pkgs = import nixpkgs { system = "x86_64-linux"; };
	in {
	packages.x86_64-linux.default =
		pkgs.stdenv.mkDerivation {
			name = "teth";
			meta = {
				license = pkgs.lib.licenses.agpl3Plus;
				description = "A text editor in haskell";
			};
			src = ./src;
			buildInputs = [
				pkgs.ghc
			];
			buildPhase = "ghc Main.hs -o teth";
			installPhase = "mkdir -p $out/bin; install -t $out/bin teth";
		};

	devShells.x86_64-linux.default = with pkgs;
		mkShell {
			packages = [
				ghcid
				hlint
			];
			buildInputs = [
				ghc
			];
		};
	};

}
