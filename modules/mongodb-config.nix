{pkgs, ...}: {
  services.mongodb = {
    enable = false;
    package = pkgs.mongodb-ce;
  };
}
