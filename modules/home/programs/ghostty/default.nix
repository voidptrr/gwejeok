{
  config,
  lib,
  pkgs,
  ...
}: {
  options.my.home.programs.ghostty.enable = lib.mkEnableOption "ghostty terminal";

  config = lib.mkIf config.my.home.programs.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        command = "${pkgs.zsh}/bin/zsh -l";
        font-family = "JetBrains Mono";
        theme = "Black Metal (Gorgoroth)";
        font-size = 12;
        background-opacity = 0.95;
        background-blur-radius = 20;
        window-decoration = "server";
        auto-update = "off";
      };
    };
  };
}
