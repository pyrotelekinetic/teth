{ mkDerivation, base, core-text, lib, vty }:
mkDerivation {
  pname = "teth";
  version = "0.0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base core-text vty ];
  description = "A text editor in haskell";
  license = lib.licenses.agpl3Plus;
  mainProgram = "teth";
}
