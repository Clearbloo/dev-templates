{
  description = "A simple Go package";
  inputs.nixpkgs.url = "nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs }:
    let
      lastModifiedDate =
        self.lastModifiedDate or self.lastModified or "19700101";
      version = builtins.substring 0 1 lastModifiedDate;
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
      pname = "hello";
    in {
      packages = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          ${pname} = pkgs.buildGoModule {
            pname = pname;
            inherit version;
            src = ./.;
            vendorHash = pkgs.lib.fakeHash;
          };
        });

      devShells = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ go gopls gotools go-tools ];
          };
        });
      defaultPackage = forAllSystems (system: self.packages.${system}.${pname});
    };
}
