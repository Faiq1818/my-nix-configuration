{
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/nvidia-driver.nix
    ./modules/steam-config.nix
    ./modules/docker-config.nix
  ];

  # Linux Kernel version
  boot.kernelPackages = pkgs.linuxPackages_6_14;
  boot.kernelParams = ["nvidia-modeset.hdmi_deepcolor=0"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  #networking.wireless.iwd.enable = true;
  
  #Dns
  networking.networkmanager.dns = "none";
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;
  networking.nameservers = ["8.8.4.4"];

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
  };

  programs.hyprland.enable = true;

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
    extraGroups = ["wheel" "networkmanager" "ydotool" "docker"];
  };
  programs = {
    ydotool = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  #services.mongodb = {
  #  enable = true;
  #  package = pkgs.mongodb-ce;
  #};

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}
