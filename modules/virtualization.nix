{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  virtualisation.podman = {
    enable = true;
  };
}
