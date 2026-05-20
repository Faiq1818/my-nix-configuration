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
  networking.nameservers = [
    "8.8.8.8"
    "1.1.1.1"
    "8.8.4.4"
    "1.0.0.1"
  ];

  networking.hosts = {
    "127.0.0.1" = [
      "instagram.com"
      "www.instagram.com"
      "tiktok.com"
      "www.tiktok.com"
    ];
  };

}
