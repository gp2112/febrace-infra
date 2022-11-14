{ pkgs, ... }:


{
  services.nginx = {
    enable = true;
  };

  networking.firewall.enableTCPorts = [ 80 443 ];

}
