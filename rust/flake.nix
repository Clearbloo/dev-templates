{
  description = "Rust dev flake";
  inputs = {
    naersk.url = "github:nix-community/naersk/master";
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, naersk, }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
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
              docker
              docker-compose

              # Measure isolate optimize
              hyperfine
              cargo-flamegraph

              # Async
              tokio-console
              oha
            ];
            RUST_SRC_PATH = rustPlatform.rustLibSrc;
          };
      });
}
