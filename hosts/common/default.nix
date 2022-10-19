{ config, pkgs, ...}:

{

  imports = [ ./services ];

  nix.package = pkgs.nixUnstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  i18n.defaultLocale = "en_US.UTF-8";

  environment.enableAllTerminfo = true;

}
