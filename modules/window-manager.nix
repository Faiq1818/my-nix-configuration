{ nixpkgs-for-hyprland, ... }:
{
  programs.hyprland = {
    enable = true;
    package = nixpkgs-for-hyprland.hyprland;
  };
  programs.niri.enable = true;
}
