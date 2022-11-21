{ config, pkgs, ...}:

{

  imports = [
    ./services
    ./users.nix
  ];

  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.settings.trusted-users = [ "@wheel" "githubactions" ];


  i18n.defaultLocale = "en_US.UTF-8";

  environment.enableAllTerminfo = true;

  time.timeZone = "America/Sao_Paulo";

  system.stateVersion = "22.05";

}
