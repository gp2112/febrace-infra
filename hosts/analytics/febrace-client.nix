{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    febrace-client
  ];

  nginx.virtualHosts = {
    "api.febrace.guip.dev" = {
      locations."/" = {
        root = "${febrace-client}";
      };
    };
  };

}
