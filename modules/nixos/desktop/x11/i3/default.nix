{
  config,
  lib,
  ...
}: {
  options.my.nixos.desktop.x11.i3.enable = lib.mkEnableOption "i3 window manager";

  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = !config.my.nixos.desktop.x11.i3.enable || config.my.nixos.desktop.x11.enable;
          message = "my.nixos.desktop.x11.i3.enable requires my.nixos.desktop.x11.enable";
        }
      ];
    }

    (lib.mkIf config.my.nixos.desktop.x11.i3.enable {
      services.xserver.windowManager.i3.enable = true;
    })
  ];
}
