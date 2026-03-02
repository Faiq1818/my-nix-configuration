{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixvim.url = "github:Faiq1818/my-nix-flakes?dir=nixvim";
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
    in
    {
      nixosConfigurations.nixos = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            inputs
            pkgs-unstable
            ;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };
}
