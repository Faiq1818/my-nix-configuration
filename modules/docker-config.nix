{...}: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    # rootless mode
    #setSocketVariable = true;
  };
}
