{ pkgs, ... }:


let
  domain = "api.febrace.guip.dev";
  port = 5000;
in
{
  services.febraceapi = {
    enable = true;
    user = "febraceapi";
    credentialsFile = "/var/febraceapi/.aws";
    inherit port;
  };


  services.nginx.virtualHosts = {
    "${domain}" = {
      forceSSL = true;
      enableACME = true;
      basicAuthFile = "/var/febraceapi/.basicauth";
      locations."/api" = {
        proxyPass = "http://127.0.0.1:${toString port}";
      };
    };
  };
}
