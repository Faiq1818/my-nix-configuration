{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
  };

  virtualisation.podman = {
    enable = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
