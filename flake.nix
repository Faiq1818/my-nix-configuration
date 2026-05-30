{
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixpkgs-for-hyprland.url = "github:NixOS/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-for-hyprland";
    };
  };

  outputs =
    {
      nixpkgs-stable,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      nixpkgs-for-hyprland = import inputs.nixpkgs-for-hyprland {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            inputs
            pkgs-unstable
            nixpkgs-for-hyprland
            ;
        };
        modules = [
          ./configuration.nix
          ./noctalia.nix
        ];
      };
    };
}
