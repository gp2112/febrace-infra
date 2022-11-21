{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    febrace-client
  ];

  nginx.virtualHosts = {
    "febrace.guip.dev" = {
      locations."/" = {
        root = "${febrace-client}";
      };
    };
  };

}
