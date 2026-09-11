{
  config,
  lib,
  osConfig,
  pkgs,
  self,
  ...
}: let
  x11 = config.my.home.desktop.x11;
  osX11 = osConfig.my.nixos.desktop.x11;
  inherit (osConfig.my.snippets.theme) wallpaper;
  screenshot = pkgs.writeShellApplication {
    name = "screenshot";
    runtimeInputs = with pkgs; [
      coreutils
      maim
      xclip
    ];
    text = ''
      mode="''${1:-full}"
      screenshot_dir="$HOME/Pictures/Screenshots"
      screenshot_file="$screenshot_dir/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

      mkdir -p "$screenshot_dir"

      case "$mode" in
        full)
          maim "$screenshot_file"
          ;;
        selection)
          maim --select "$screenshot_file"
          ;;
        *)
          echo "usage: screenshot [full|selection]" >&2
          exit 2
          ;;
      esac

      xclip -selection clipboard -target image/png -in "$screenshot_file"
    '';
  };
in {
  imports = self.lib.fs.scanPaths ./.;

  options.my.home.desktop.x11.enable = lib.mkEnableOption "X11 user session";

  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = !x11.enable || osX11.enable;
          message = "my.home.desktop.x11.enable requires my.nixos.desktop.x11.enable";
        }
      ];
    }

    (lib.mkIf x11.enable {
      home.packages = [screenshot];

      services.picom = {
        enable = true;
        backend = "glx";
        vSync = true;
        settings = {
          blur-background = true;
          blur-background-fixed = true;
          blur-method = "dual_kawase";
          blur-strength = 4;
        };
      };

      systemd.user.services.xwallpaper = {
        Unit = {
          Description = "Set X11 wallpaper";
          PartOf = ["graphical-session.target"];
          Before = ["picom.service"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${lib.getExe pkgs.xwallpaper} --zoom ${wallpaper}";
          RemainAfterExit = true;
        };
        Install.WantedBy = ["graphical-session.target"];
      };
    })
  ];
}
