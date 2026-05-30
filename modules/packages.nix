{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  security.polkit.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi
      xorg.libXrandr
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXfixes
      xorg.libxcb
      libGL
      mesa
      nspr
      zlib
      glib
      stdenv.cc.cc
    ];
  };

  # android studio licence eula accept
  nixpkgs.config.android_sdk.accept_license = true;

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
      rose-pine-cursor
      xwayland-satellite
      catppuccin-sddm
      hyprpolkitagent
      wl-clipboard
      slurp
      grim
      kdePackages.dolphin
      kdePackages.gwenview
      ddcutil
      quickshell

      # Application
      git
      vscode
      vesktop
      spotify
      vlc
      fastfetch
      btop
      superfile
      tmux
      mangohud
      protonup-ng
      heroic
      krita
      unrar
      onlyoffice-desktopeditors
      zip
      unzip
      yazi
      foot
      insomnia
      brave
      kdePackages.kdenlive
      python313Packages.pipx
      android-tools
      nethogs
      podman-compose
      podman-desktop
      qbittorrent
      gh
      dbeaver-bin
      scrcpy
    ]
    ++ (with pkgs-unstable; [
      firefox
      nvtopPackages.nvidia
      osu-lazer-bin
      zoom-us
      android-studio
      tree
      obs-studio
      opencode
      nodejs_24
      go
      claude-code
      koreader

      # Inputs from flake
      inputs.zen-browser.packages.${pkgs.system}.default
    ]);
}
