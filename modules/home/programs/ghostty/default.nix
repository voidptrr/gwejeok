{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (osConfig.my.snippets.theme) colors font;
in {
  options.my.home.programs.ghostty.enable = lib.mkEnableOption "ghostty terminal";

  config = lib.mkIf config.my.home.programs.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        command = "${pkgs.zsh}/bin/zsh -l";
        font-family = builtins.head font.names;
        theme = "Everforest Dark Hard";
        background = colors.terminal;
        font-size = font.size;
        background-opacity = 0.95;
        background-blur-radius = 20;
        window-decoration = "server";
        auto-update = "off";
      };
    };
  };
}
