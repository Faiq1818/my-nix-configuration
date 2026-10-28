{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_29;
    storageDriver = "overlay2";
  };

  virtualisation.podman = {
    enable = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
