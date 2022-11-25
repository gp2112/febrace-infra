{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    febrace-client
  ];

  services.nginx.virtualHosts = {
    "febrace.guip.dev" = {
      forceSSL = true;
      enableACME = true;
      #basicAuthFile = "/var/febraceapi/.basicauth";
      locations."/" = {
        root = "${pkgs.febrace-client}";
      };
    };
  };

}
