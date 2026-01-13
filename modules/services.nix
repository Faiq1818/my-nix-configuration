{ pkgs, ... }: {
  services = {
    xserver.enable = false;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha-mauve";
      extraPackages = [ pkgs.catppuccin-sddm ];
    };
    udisks2.enable = true;
  };
}
