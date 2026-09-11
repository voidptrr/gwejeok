{
  lib,
  pkgs,
  self,
  ...
}: let
  language = {
    locale = "ko_KR.UTF-8";
    browser = [
      "ko-KR"
      "ko"
      "en-GB"
      "en"
    ];
  };

  font = {
    names = [
      "JetBrains Mono"
      "Noto Sans CJK KR"
    ];
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
    ];
    size = 12.0;
  };

  themes = lib.mapAttrs (_: path: import path) (self.lib.fs.scanAttrs ./themes);

  selectedTheme = "dark-blue";
in {
  options.my.snippets.theme = lib.mkOption {
    type = lib.types.attrs;
    description = "Shared desktop appearance settings.";

    default =
      themes.${selectedTheme}
      // {
        name = selectedTheme;
        inherit language font;
      };
  };
}
