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
      font = {
        names = ["JetBrains Mono"];
        package = pkgs.jetbrains-mono;
        size = 12.0;
      };
      colors = {
        green = "#8a9a7b";
        gray = "#8b8792";
        muted = "#808080";
        red = "#c4746e";
        yellow = "#c4b28a";
        black = "#000000";
        terminal = "#101d23";
      };
    };
  };
}
