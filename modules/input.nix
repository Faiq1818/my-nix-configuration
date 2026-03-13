{ pkgs, ... }:
{
  services.xserver = {
    xkb = {
      layout = "us";
      # variant = "";
      # options = "caps:swapescape";
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk # alternatively, kdePackages.fcitx5-qt
        qt6Packages.fcitx5-chinese-addons # table input method support
        fcitx5-nord # a color theme
      ];
      waylandFrontend = true;
    };
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
            leftmeta = "leftalt";
            leftalt = "leftmeta";
          };
        };
      };
    };
  };
}
