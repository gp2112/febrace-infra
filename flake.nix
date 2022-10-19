{
  description = "Febrace nix infrastructure.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }@inputs:
    let
      inherit (builtins) attrValues;
      inherit (flake-utils.lib) eachDefaultSystemMap;
      inherit (nixpkgs.lib) nixosSystem;
    in
    rec {
      # Conjunto de mudanças à coleção de pacotes
      overlays = {
        # Nossas modificações
        default = import ./overlay;
      };


      # Exportar pacotes com todas as overlays aplicadas
      packages = eachDefaultSystemMap (system:
        import nixpkgs {
          inherit system;
          overlays = attrValues overlays;
          config.allowUnfree = true;
        }
      );

      # Configurações NixOS
      nixosConfigurations = {
        analytics = nixosSystem {
          # Configuração
          modules = [
            "${nixpkgs}/nixos/modules/virtualisation/amazon-image.nix"
            ./hosts/analytics
          ];
          # Repassar nossos inputs, para permitir referenciar da config
          specialArgs = { inherit inputs; };
          # Nossos pacotes
          pkgs = packages.x86_64-linux;
          system = "x86_64-linux";
        };
    };
  };
}
