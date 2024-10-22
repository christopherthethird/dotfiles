let
  config = import ../../config.nix;
in
with config;
{
  programs.git = {
    enable = true;
    userEmail = user_email;
    userName = user_full_name;
    extraConfig = {
      core = {
        pager = "diff-so-fancy";
      };
      interactive = {
        diffFilter = "diff-so-fancy --patch";
      };
      color = {
        ui = true;
        diff-highlight = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };
        diff = {
          meta = "11";
          frag = "magenta bold";
          func = "146 bold";
          commit = "yellow bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
      };
    };
  };
}
