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
            capslock = "esc";
            esc = "capslock";
            leftalt = "leftmeta";
            rightalt = "rightcontrol";
            # leftmeta = "leftalt";
            # rightcontrol = "toggle(numbers)";
            leftmeta = "overload(kshold, leftalt)";
            rightcontrol = "leftalt";
          };

          # kstoggle = {
          #   a = "1";
          #   s = "2";
          #   d = "3";
          #   f = "4";
          #   g = "5";
          #   h = "6";
          #   j = "7";
          #   k = "8";
          #   l = "9";
          #   ";" = "0";
          # };

          kshold = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
            i = "home";
            o = "end";
            q = "pageup";
            w = "pagedown";
          };
        };
      };
    };
  };
}
