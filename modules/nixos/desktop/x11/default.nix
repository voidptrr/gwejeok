{
  config,
  lib,
  self,
  ...
}: {
  imports = self.lib.fs.scanPaths ./.;

  options.my.nixos.desktop.x11.enable = lib.mkEnableOption "X11 desktop support";

  config = lib.mkIf config.my.nixos.desktop.x11.enable {
    services.xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      xkb.options = "caps:escape";
    };
  };
}
