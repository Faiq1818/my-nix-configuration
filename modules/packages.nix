{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  programs = {
    ydotool.enable = true;
    zsh.enable = true;
    kdeconnect.enable = true;
    thunderbird.enable = true;
  };

  environment.systemPackages =
    with pkgs;
    [
      # Desktop package
      pavucontrol
      networkmanagerapplet
      rose-pine-cursor
      xwayland-satellite
      catppuccin-sddm
      hyprpolkitagent
      hyprpaper
      waybar
      rofi
      wl-clipboard
      slurp
      grim
      kdePackages.dolphin
      kdePackages.gwenview

      # Application
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
      obsidian
      swaynotificationcenter
    ]
    ++ (with pkgs-unstable; [
      git
      vscode
      kdePackages.dolphin
      firefox
      nvtopPackages.nvidia
      osu-lazer-bin
      zoom-us
      android-studio
      tree
      spotify-player
      obs-studio
      chromium
      opencode

      # Inputs from flake
      inputs.zen-browser.packages.${pkgs.system}.default
      inputs.nixvim.packages.${pkgs.system}.default
    ]);

  security.polkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # android studio licence eula accept
  nixpkgs.config.android_sdk.accept_license = true;
}
