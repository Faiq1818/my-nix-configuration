{...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  #networking.wireless.iwd.enable = true;

  #Dns
  networking.networkmanager.dns = "none";
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;
  networking.nameservers = ["8.8.4.4"];
}
