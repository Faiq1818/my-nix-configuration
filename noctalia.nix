{ pkgs, inputs, ... }:
{
  environment.systemPackages =[
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.noctalia-new.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
