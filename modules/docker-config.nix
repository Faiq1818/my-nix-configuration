{...}: {
  virtualisation.docker = {
    enable = false;
    storageDriver = "btrfs";
    # rootless mode
    #setSocketVariable = true;
  };
}
