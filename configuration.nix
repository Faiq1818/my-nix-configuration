{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/networking.nix
    ./modules/bluetooth.nix
    ./modules/packages.nix
    ./modules/nvidia-driver.nix
    ./modules/steam-config.nix
    ./modules/docker-config.nix
    ./modules/mongodb-config.nix
  ];

  # Linux Kernel version
  boot.kernelPackages = pkgs.linuxPackages_6_16;
  boot.kernelParams = ["nvidia-modeset.hdmi_deepcolor=0"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
  };

  programs.hyprland.enable = true;
  # hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.udisks2.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  users.users.faiqge = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Faiq Ghozy Erlangga";
    extraGroups = ["wheel" "networkmanager" "ydotool"];
  };
  programs = {
    ydotool = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}
