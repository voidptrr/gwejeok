{
  lib,
  pkgs,
  ...
}: {
  options.my.snippets.theme = lib.mkOption {
    type = lib.types.attrs;
    description = "Shared desktop appearance settings.";

    default = {
      wallpaper = ../../assets/anime2.jpg;
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
        packages = [
          pkgs.jetbrains-mono
          pkgs.noto-fonts-cjk-sans
        ];
        size = 12.0;
      };
      colors = {
        green = "#4e927f";
        gray = "#e3dccb";
        muted = "#7d817c";
        red = "#c8584f";
        yellow = "#d1a64a";
        black = "#101416";
        terminal = "#101d23";
      };
    };
  };
}
