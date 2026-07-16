{ ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    8081
    3000
  ];
  networking.firewall.allowedUDPPorts = [
    8081
    3000
  ];
  networking.networkmanager.settings = {
    main = {
      dns = "none";
      rc-manager = "unmanaged";
    };
  };
  # networking.nameservers = [
  #   "1.1.1.1"
  # ];
  environment.etc."resolv.conf".text = ''
    nameserver 1.1.1.1
    nameserver 8.8.8.8
    options edns0
  '';

  networking.hosts = {
    "127.0.0.1" = [
      "tiktok.com"
      "www.tiktok.com"
    ];
  };

}
