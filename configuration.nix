{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Linux Kernel version
  boot.kernelPackages = pkgs.linuxPackages_6_14;
  boot.kernelParams = [ "nvidia-modeset.hdmi_deepcolor=0" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
  };

  programs.hyprland.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  services.udisks2.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.faiqge = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Faiq Ghozy Erlangga";
    extraGroups = [ "wheel" "ydotool" ];
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

  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # Desktop config
  pavucontrol impala

  # Hyprland config
  hyprpolkitagent hyprpaper
  waybar rofi wl-clipboard

  # Language
  nodejs_24 typescript
  rustup

  # Database
  mongodb-ce mongosh

  # Application
  kitty git vscode kdePackages.dolphin neovim
  firefox vesktop spotify vlc grim
  fastfetch btop superfile slurp kdePackages.dolphin
  cava tmux mangohud protonup heroic
  obs-studio kdePackages.gwenview krita cemu
  aria2 unrar onlyoffice-bin unzip android-file-transfer
  ];

  ################
  # Steam Config #
  ################
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##########################
  # Nvidia driver settings #
  ##########################
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [
    # "modesetting"  # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    "nvidia"
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
