{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./networking.nix
    ./nginx.nix
    ./febraceapi.nix
  ];

  ec2.hvm = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
  };

}
