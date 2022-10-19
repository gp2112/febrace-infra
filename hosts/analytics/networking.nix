{ config, pkgs, ... }:

{
  networking = {
    hostName = "analytics";


  };

  networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
}
