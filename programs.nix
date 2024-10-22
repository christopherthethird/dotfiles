{ pkgs, ... }:

{
  imports = [
    ./apps/bash/bash.nix
    ./apps/git/git.nix
  ];

  programs.home-manager.enable = true;

}
