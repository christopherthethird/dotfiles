{ pkgs, config, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = import ./aliases.nix;
    enableVteIntegration = true;
    profileExtra = builtins.readFile ./bash_profile;
    bashrcExtra = builtins.readFile ./bashrc;
    initExtra = ''
      ${builtins.readFile ./functions.sh};
      ${builtins.readFile ./exports.sh};
    '';
  };
}
