# nix develop path:$(pwd)/nix
{
  description = "prosemirror-breakout-starter-kit";

  inputs = {
    # Using system nixpkgs https://discourse.nixos.org/t/use-a-system-nixpkgs-version-in-a-flake/43784/3
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in { devShell = with pkgs; mkShell { buildInputs = [ nodejs_22 ]; }; });
}

