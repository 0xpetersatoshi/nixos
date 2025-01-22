{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:bluskript/stylix/myfork";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, home-manager, disko, ... }@inputs: let
    system = "x86_64-linux";
    homeStateVersion = "24.11";
    user = "peter";
    hosts = [
      { hostname = "nixbox"; stateVersion = "24.11"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion hostname user;
      };

      modules = [
        disko.nixosModules.disko
        ./hosts/${hostname}/configuration.nix
        ./hosts/${hostname}/disko.nix
        # Add home-manager as a NixOS module
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs homeStateVersion user;
          };
        }
      ];
    };

  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;
  };
}
