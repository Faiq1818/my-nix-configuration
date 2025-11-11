{...}: {
  services = {
    xserver.enable = false;
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.enable = true;
    udisks2.enable = true;
  };
}
