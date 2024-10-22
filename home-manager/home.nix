{ config, pkgs, ... }:

let
  config = import ../config.nix;
in
{
  nixpkgs.config.allowUnfree = true;

  home = with config; {
    username = user_name;
    homeDirectory = "/home/${user_name}";
    stateVersion = "24.11";

    packages =
      with pkgs;
      (import ../packages.nix {
        pkgs = pkgs;
      });

  };

  imports = [
    ../programs.nix
  ];
}
