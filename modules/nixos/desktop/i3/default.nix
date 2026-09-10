{
  config,
  lib,
  pkgs,
  ...
}: {
  options.my.nixos.desktop.i3 = {
    enable = lib.mkEnableOption "i3 window manager";

    usei3Status = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable i3status integration for i3.";
    };

    usePolybar = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Polybar integration for i3.";
    };
  };

  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = !config.my.nixos.desktop.i3.enable || config.my.nixos.desktop.xserver.enable;
          message = "my.nixos.desktop.i3.enable requires my.nixos.desktop.xserver.enable";
        }
        {
          assertion = !config.my.nixos.desktop.i3.usei3Status || config.my.nixos.desktop.i3.enable;
          message = "my.nixos.desktop.i3.usei3Status requires my.nixos.desktop.i3.enable";
        }
        {
          assertion = !config.my.nixos.desktop.i3.usePolybar || config.my.nixos.desktop.i3.enable;
          message = "my.nixos.desktop.i3.usePolybar requires my.nixos.desktop.i3.enable";
        }
        {
          assertion = !(config.my.nixos.desktop.i3.usei3Status && config.my.nixos.desktop.i3.usePolybar);
          message = "my.nixos.desktop.i3.usei3Status and my.nixos.desktop.i3.usePolybar are mutually exclusive";
        }
      ];
    }

    (lib.mkIf config.my.nixos.desktop.i3.enable {
      fonts.packages = lib.optionals config.my.nixos.desktop.i3.usePolybar [pkgs.nerd-fonts.symbols-only];
      services.xserver.windowManager.i3.enable = true;
    })
  ];
}
