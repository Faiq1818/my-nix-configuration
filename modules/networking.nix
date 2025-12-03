{...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [8081];
  networking.firewall.allowedUDPPorts = [8081];
  #networking.wireless.iwd.enable = true;

  #Dns
  # networking.networkmanager.dns = "none";
  # networking.useDHCP = false;
  # networking.dhcpcd.enable = false;
  networking.nameservers = ["8.8.8.8" "1.1.1.1" "8.8.4.4" "1.0.0.1"];
  
  # services.vsftpd.enable = true;
  # services.vsftpd.writeEnable = true;
  # services.vsftpd.localUsers = true;
  # services.vsftpd.chrootlocalUser = true;
  # services.vsftpd.allowWriteableChroot = true;
  # services.vsftpd.localRoot = "/home/$USER";
}
