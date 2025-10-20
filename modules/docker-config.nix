{...}: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    # rootless mode
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
