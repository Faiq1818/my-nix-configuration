{...}: {
  virtualisation.docker = {
    enable = false;
    storageDriver = "btrfs";
    # rootless mode
    # rootless = {
    #   enable = false;
    #   setSocketVariable = true;
    # };
  };
}
