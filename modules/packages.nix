{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Desktop config
    pavucontrol
    #impala
    networkmanagerapplet

    # Hyprland config
    hyprpolkitagent
    hyprpaper
    waybar
    rofi
    wl-clipboard

    # Database
    mongodb-ce
    mongosh

    # Application
    kitty
    git
    vscode
    kdePackages.dolphin
    neovim
    firefox
    vesktop
    spotify
    vlc
    grim
    fastfetch
    btop
    superfile
    slurp
    kdePackages.dolphin
    cava
    tmux
    mangohud
    protonup
    heroic
    obs-studio
    kdePackages.gwenview
    krita
    aria2
    unrar
    onlyoffice-bin
    unzip
    android-file-transfer
    yazi
    foot
  ];
}
