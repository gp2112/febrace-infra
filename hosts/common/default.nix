{ config, pkgs, ...}:

{

  imports = [
    ./services
    ./users.nix
  ];

  nix.package = pkgs.nixUnstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.settings.trusted-users = [ "@wheel" "githubactions" ];

  networking.firewall.enableTCPorts = [ 22 ];

  i18n.defaultLocale = "en_US.UTF-8";

  environment.enableAllTerminfo = true;

}