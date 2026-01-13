{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Desktop config
    pavucontrol
    networkmanagerapplet
    rose-pine-cursor
    xwayland-satellite
    catppuccin-sddm

    # Hyprland config
    hyprpolkitagent
    hyprpaper
    waybar
    rofi
    wl-clipboard
    mako
    slurp
    grim
    kdePackages.dolphin
    kdePackages.gwenview

    # Application
    git
    vscode
    kdePackages.dolphin
    firefox
    vesktop
    spotify
    vlc
    fastfetch
    btop
    superfile
    cava
    tmux
    mangohud
    protonup-ng
    heroic
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
    tree
    spotify-player
    #ciscoPacketTracer8
    obs-studio
    kdePackages.kdenlive
    python313Packages.pipx
    android-tools
    nethogs
    mangohud
    podman-compose
    podman-desktop
    qbittorrent
    gh
    dbeaver-bin
    rquickshare

    # Inputs from flake
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.nixvim.packages.${pkgs.system}.default
  ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "ciscoPacketTracer8-8.2.2"
  # ];

  programs = {
    ydotool.enable = true;
    zsh.enable = true;
    kdeconnect.enable = true;
  };

  security.polkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # android studio licence eula accept
  nixpkgs.config.android_sdk.accept_license = true;
}
