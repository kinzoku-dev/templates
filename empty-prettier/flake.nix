{
  description = "Empty Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        nativeBuildInputs = with pkgs; [
          nodePackages_latest.prettier
        ];
        buildInputs = nativeBuildInputs;
        shellHook = "";
      in {
        devShells.default = pkgs.mkShell {inherit nativeBuildInputs buildInputs shellHook;};
      }
    );
}
