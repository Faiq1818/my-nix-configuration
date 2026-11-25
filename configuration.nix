{ pkgs, ... }:
{
  imports = [
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
    ./modules/systemd.nix
  ];

  # Linux Kernel version
  boot.kernelPackages = pkgs.linuxPackages_7_0;
  boot.kernelParams = [ "nvidia-modeset.hdmi_deepcolor=0" "clearcpuid=umip"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };

  zramSwap.enable = true;

  nix.settings.max-jobs = 10;

  services.logind.settings.Login = {
    HibernateDelaySec = 0;
    HandleLidSwitch = "suspend";
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  time.timeZone = "Asia/Jakarta";

  fonts = {
    packages = with pkgs; [
      nerd-fonts._0xproto
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" "Noto Serif CJK SC" "DejaVu Serif" ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" "DejaVu Sans" ];
        monospace = [ "0xProto Nerd Font Mono" "DejaVu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

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
      "i2c"
      "libvirtd"
      "wireshark"
      "dialout"
    ];
  };

  hardware.i2c.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}
