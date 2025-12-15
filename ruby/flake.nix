{
  description = "Ruby dev flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; };

  outputs = { nixpkgs, ... }:
    let forAllSystems = nixpkgs.lib.genAttrs [ "aarch64-linux" "x86_64-linux" ];
    in {
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in { default = pkgs.mkShellNoCC { packages = with pkgs; [ ruby ]; }; });
    };
}
