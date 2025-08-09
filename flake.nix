{
  description = "bysinka_95's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs:
    let
      user = "bysinka";
      hosts = [{
        system = "x86_64-linux";
        hostname = "bysinka";
        stateVersion = "25.05";
        homeStateVersion = "25.05";
        channel = "nixos-unstable";
      }];

      makeSystem = { hostname, system, stateVersion, channel, ... }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs stateVersion hostname system user channel;
          };
          modules = [
            ./hosts/${hostname}/configuration.nix
            chaotic.nixosModules.default
          ];
        };

      makeHomeConfiguration = { hostname, system, homeStateVersion, ... }: {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs homeStateVersion user hostname system;
        };
        modules = [ ./home-manager/home.nix ];
      };

    in {
      nixosConfigurations = nixpkgs.lib.foldl'
        (configs: host: configs // { "${host.hostname}" = makeSystem host; })
        { } hosts;

      homeConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${user}" = home-manager.lib.homeManagerConfiguration
            (makeHomeConfiguration host);
        }) { } hosts;
    };
}
