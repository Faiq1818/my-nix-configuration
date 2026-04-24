{ pkgs, ... }:
{
  systemd.user.services.mpris-proxy = {
    enable = true;
    after = [
      "network.target"
      "sound.target"
      "bluetooth.target"
    ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = [
        ""
        "${pkgs.bluez}/bin/mpris-proxy"
      ];
      Restart = "on-failure";
    };
  };
}
