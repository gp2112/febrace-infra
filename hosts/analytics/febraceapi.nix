{ pkgs, ... }:


let
  domain = "febrace.guip.dev";
  port = 5000;
in
{
  services.febraceapi = {
    enable = true;
    credentialsFile = "/var/${services.febraceapi.user}/.aws";
    inherit port;
  };


  services.nginx.virtualHosts = {
    "${domain}" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:${port}";
      };
    };
  };

}
