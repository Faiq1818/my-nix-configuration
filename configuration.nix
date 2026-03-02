{ pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/input.nix
    ./modules/window-manager.nix
    ./modules/bluetooth.nix
    ./modules/drivers.nix
    ./modules/packages.nix
    ./modules/nvidia-driver.nix
    ./modules/steam-config.nix
    ./modules/virtualization.nix
    ./modules/database.nix
  ];

  # Linux Kernel version
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.kernelParams = [ "nvidia-modeset.hdmi_deepcolor=0" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.logind.settings.Login = {
    HibernateDelaySec = 0;
    HandleLidSwitch = "suspend";
  };

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Timezone
  time.timeZone = "Asia/Jakarta";

  # Font
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # Users
  users.users.faiqge = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Faiq Ghozy Erlangga";
    extraGroups = [
      "wheel"
      "networkmanager"
      "ydotool"
      "docker"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";
}
