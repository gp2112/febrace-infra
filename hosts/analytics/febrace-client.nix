{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    febrace-client
  ];

  services.nginx.virtualHosts = {
    "febrace.guip.dev" = {
      locations."/" = {
        root = "${pkgs.febrace-client}";
      };
    };
  };

}
