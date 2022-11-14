{
  description = "Febrace nix infrastructure.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";


    # Febrace apps
    febraceapi.url = "github:gp2112/febrace-analytics-api";
    febrace-client.url = "github:gp2112/febrace-client";
  };

  outputs = { nixpkgs, flake-utils, febrace-api, febrace-client, ... }@inputs:
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
        febraceapi = febraceapi.overlays.default;
        febrace-client = febrace-client.overlays.default;
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
            febraceapi.nixosModules.default
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
