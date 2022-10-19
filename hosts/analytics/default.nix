{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./networking.nix
  ];

  ec2.hvm = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  filesystems."/" = {
    device = "/dev/disk/by-label/nixos";
  };

}
