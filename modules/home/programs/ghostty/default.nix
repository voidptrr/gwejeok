{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  theme = osConfig.my.snippets.theme;
  inherit (theme) font palette;
in {
  options.my.home.programs.ghostty.enable = lib.mkEnableOption "ghostty terminal";

  config = lib.mkIf config.my.home.programs.ghostty.enable {
    programs.ghostty = {
      enable = true;
      themes.${theme.name} = {
        palette = [
          "0=${palette.base00}"
          "1=${palette.base08}"
          "2=${palette.base0B}"
          "3=${palette.base0A}"
          "4=${palette.base0D}"
          "5=${palette.base0E}"
          "6=${palette.base0C}"
          "7=${palette.base07}"
          "8=${palette.base0A}"
          "9=${palette.base08}"
          "10=${palette.base0B}"
          "11=${palette.base0A}"
          "12=${palette.base0D}"
          "13=${palette.base0E}"
          "14=${palette.base0C}"
          "15=${palette.base07}"
        ];
        background = palette.base02;
        foreground = palette.base07;
        cursor-color = palette.base06;
        cursor-text = palette.base00;
        selection-background = palette.base04;
        selection-foreground = palette.base07;
      };
      settings = {
        command = "${pkgs.zsh}/bin/zsh -l";
        font-family = builtins.head font.names;
        theme = theme.name;
        font-size = font.size;
        background-opacity = 0.95;
        background-blur-radius = 20;
        window-decoration = "server";
        auto-update = "off";
      };
    };
  };
}
