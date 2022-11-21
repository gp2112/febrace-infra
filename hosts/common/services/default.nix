{ config, pkgs, ...}:


{

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    passwordAuthentication = false;
  };

  networking.firewall.allowedTCPPorts = [ 22 ];


}
