{...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  #networking.wireless.iwd.enable = true;

  #Dns
  # networking.networkmanager.dns = "none";
  # networking.useDHCP = false;
  # networking.dhcpcd.enable = false;
  # networking.nameservers = ["8.8.8.8" "1.1.1.1" "8.8.4.4" "1.0.0.1"];
}
