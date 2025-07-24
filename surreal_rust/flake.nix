{
  description = "Surreal + Rust dev flake";
  inputs = {
    naersk.url = "github:nix-community/naersk/master";
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, naersk, }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg:
            builtins.elem (pkgs.lib.getName pkg) [ "surrealdb" ];
        };
        naersk-lib = pkgs.callPackage naersk { };
      in {
        defaultPackage = naersk-lib.buildPackage ./.;
        devShell = with pkgs;
          mkShell {
            buildInputs = [
              cargo
              rustc
              rust-analyzer
              rustfmt
              rustPackages.clippy
              surrealdb
              surrealist
              docker
              docker-compose
            ];
            RUST_SRC_PATH = rustPlatform.rustLibSrc;
          };
      });
}
