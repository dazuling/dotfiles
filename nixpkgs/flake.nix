{
  description = "nix home-manager configuration";

  inputs = {
    flake-utils = {
      url = github:numtide/flake-utils;
    };
    nixpkgs = {
      url = github:nixos/nixpkgs/nixos-unstable;
    };
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        modules = import ./modules.nix;
      in
      {
        packages = {
          homeConfigurations = {
            splendor = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                host = "splendor";
                nixDir = "/dots/nixpkgs";
                screen = "desktop";
              };
              modules = [
                {
                  programs.home-manager.enable = true;
                  # Workaround for flakes https://github.com/nix-community/home-manager/issues/2942.
                  nixpkgs.config.allowUnfreePredicate = (pkg: true);
                  home = {
                    username = "blissful";
                    homeDirectory = "/home/blissful";
                    stateVersion = "22.11";
                  };
                }
                modules.cliModule
                modules.devModule
                modules.guiModule
                modules.i3Module
                modules.themeModule
              ];
            };
            neptune = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                host = "neptune";
                nixDir = "/dots/nixpkgs";
                screen = "laptop";
              };
              modules = [
                {
                  programs.home-manager.enable = true;
                  # Workaround for flakes https://github.com/nix-community/home-manager/issues/2942.
                  nixpkgs.config.allowUnfreePredicate = (pkg: true);
                  home = {
                    username = "blissful";
                    homeDirectory = "/home/blissful";
                    stateVersion = "22.11";
                  };
                }
                modules.cliModule
                modules.devModule
                modules.guiModule
                modules.i3Module
                modules.swayModule
                modules.themeModule
              ];
            };
            sunset = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                host = "sunset";
                nixDir = "/dots/nixpkgs";
                screen = "none";
              };
              modules = [
                {
                  programs.home-manager.enable = true;
                  # Workaround for flakes https://github.com/nix-community/home-manager/issues/2942.
                  nixpkgs.config.allowUnfreePredicate = (pkg: true);
                  home = {
                    username = "regalia";
                    homeDirectory = "/home/regalia";
                    stateVersion = "22.11";
                  };
                }
                modules.cliModule
                modules.devModule
              ];
            };
          };
        };
      }
    );
}
