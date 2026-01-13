{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/window-manager.nix
    ./modules/bluetooth.nix
    ./modules/packages.nix
    ./modules/nvidia-driver.nix
    ./modules/steam-config.nix
    ./modules/docker-config.nix
    ./modules/mongodb-config.nix
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

  # hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  time.timeZone = "Asia/Jakarta";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
        qt6Packages.fcitx5-chinese-addons  # table input method support
        fcitx5-nord            # a color theme
      ];
      waylandFrontend = true;
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  users.users.faiqge = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Faiq Ghozy Erlangga";
    extraGroups = ["wheel" "networkmanager" "ydotool" "docker"];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}
