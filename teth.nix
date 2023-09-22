{ mkDerivation, base, brick, core-text, lens, lib, text, vty }:
mkDerivation {
  pname = "teth";
  version = "0.0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base brick core-text lens text vty ];
  description = "A text editor in haskell";
  license = lib.licenses.agpl3Plus;
  mainProgram = "teth";
}
