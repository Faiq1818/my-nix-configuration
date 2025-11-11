{
  pkgs,
  inputs,
  config,
  ...
}: {
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
    mako

    # Application
    git
    vscode
    kdePackages.dolphin
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
    protonup-ng
    heroic
    kdePackages.gwenview
    krita
    aria2
    unrar
    onlyoffice-desktopeditors
    unzip
    android-file-transfer
    yazi
    foot
    posting
    insomnia
    brave
    nvtopPackages.nvidia
    osu-lazer-bin
    zoom-us
    android-studio
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.nixvim.packages.${pkgs.system}.default
    tree
    lazygit
    qbittorrent
    spotify-player
    ciscoPacketTracer8
    obs-studio
    kdePackages.kdenlive
    python313Packages.pipx
    android-tools
  ];
  security.polkit.enable = true;
  # services.unifi = {
  # enable = true;
  # mongodbPackage = pkgs.mongodb-ce;
  # };

  programs.kdeconnect.enable = true;
  # android studio licence eula accept
  nixpkgs.config.android_sdk.accept_license = true;
}
