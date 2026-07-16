{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
  };

  virtualisation.podman = {
    enable = true;
  };
}
