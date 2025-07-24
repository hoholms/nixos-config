{
  description = "bysinka_95's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      user = "bysinka";
      hosts = [{
        hostname = "bysinka";
        stateVersion = "25.05";
        channel = "nixos-unstable";
      }];

      makeSystem = { hostname, stateVersion, channel }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs stateVersion hostname user channel; };

          modules = [ ./hosts/${hostname}/configuration.nix ];
        };

    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" =
            makeSystem { inherit (host) hostname stateVersion channel; };
        }) { } hosts;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs homeStateVersion user; };

        modules = [ ./home-manager/home.nix ];
      };
    };
}
