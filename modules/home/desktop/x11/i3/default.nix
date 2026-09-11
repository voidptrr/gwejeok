{
  lib,
  config,
  osConfig,
  self,
  ...
}: let
  i3 = config.my.home.desktop.x11.i3;
  osI3 = osConfig.my.nixos.desktop.x11.i3;
  inherit (osConfig.my.snippets.theme) font palette;
in {
  imports = self.lib.fs.scanPaths ./.;

  options.my.home.desktop.x11.i3.enable = lib.mkEnableOption "i3 user configuration";

  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = !i3.enable || config.my.home.desktop.x11.enable;
          message = "my.home.desktop.x11.i3.enable requires my.home.desktop.x11.enable";
        }
        {
          assertion = !i3.enable || osI3.enable;
          message = "my.home.desktop.x11.i3.enable requires my.nixos.desktop.x11.i3.enable";
        }
        {
          assertion = !(i3.i3status.enable && config.my.home.desktop.x11.polybar.enable);
          message = "my.home.desktop.x11.i3.i3status.enable and my.home.desktop.x11.polybar.enable are mutually exclusive";
        }
      ];
    }

    (lib.mkIf i3.enable {
      xsession.windowManager.i3 = {
        enable = true;
        config = {
          fonts = {inherit (font) names size;};
          modifier = "Mod4";
          focus.followMouse = true;
          floating = {
            border = 2;
            modifier = "Mod4";
            titlebar = false;
          };
          window = {
            border = 2;
            hideEdgeBorders = "none";
            titlebar = false;
            commands = [
              {
                criteria.title = "coding";
                command = "floating enable, resize set 1200 900, move position center";
              }
            ];
          };
          colors = {
            background = palette.base00;
            focused = {
              border = palette.base06;
              background = palette.base00;
              text = palette.base0A;
              indicator = palette.base06;
              childBorder = palette.base06;
            };
            focusedInactive = {
              border = palette.base0D;
              background = palette.base00;
              text = palette.base0D;
              indicator = palette.base0D;
              childBorder = palette.base0D;
            };
            unfocused = {
              border = palette.base04;
              background = palette.base00;
              text = palette.base04;
              indicator = palette.base04;
              childBorder = palette.base04;
            };
            urgent = {
              border = palette.base08;
              background = palette.base00;
              text = palette.base07;
              indicator = palette.base08;
              childBorder = palette.base08;
            };
          };
          modes = lib.mkForce {};
          keybindings = lib.mkForce {
            XF86MonBrightnessUp = "exec --no-startup-id brightnessctl set +5%";
            XF86MonBrightnessDown = "exec --no-startup-id brightnessctl set 5%-";
            XF86AudioMute = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
            XF86AudioRaiseVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
            XF86AudioLowerVolume = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
            XF86AudioMicMute = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

            Print = "exec --no-startup-id screenshot full";
            "Shift+Print" = "exec --no-startup-id screenshot selection";
            "Mod4+Shift+s" = "exec --no-startup-id screenshot selection";

            "Mod4+Return" = "exec --no-startup-id ghostty";
            "Mod4+m" = "exec --no-startup-id rofi -show drun -normal-window";
            "Mod4+f" = "exec --no-startup-id firefox";
            "Mod4+Shift+f" = "floating toggle";
            "Mod4+c" = "exec --no-startup-id ghostty --title=coding";
            "Mod4+Shift+q" = "kill";

            "Mod4+h" = "focus left";
            "Mod4+j" = "focus down";
            "Mod4+k" = "focus up";
            "Mod4+l" = "focus right";

            "Mod4+space" = "layout toggle split";
            "Mod4+Control+r" = "reload";

            "Mod4+1" = "workspace number 1";
            "Mod4+2" = "workspace number 2";
            "Mod4+3" = "workspace number 3";
            "Mod4+4" = "workspace number 4";
            "Mod4+5" = "workspace number 5";
            "Mod4+6" = "workspace number 6";
            "Mod4+7" = "workspace number 7";
            "Mod4+8" = "workspace number 8";
            "Mod4+9" = "workspace number 9";

            "Mod4+Shift+1" = "move container to workspace number 1";
            "Mod4+Shift+2" = "move container to workspace number 2";
            "Mod4+Shift+3" = "move container to workspace number 3";
            "Mod4+Shift+4" = "move container to workspace number 4";
            "Mod4+Shift+5" = "move container to workspace number 5";
            "Mod4+Shift+6" = "move container to workspace number 6";
            "Mod4+Shift+7" = "move container to workspace number 7";
            "Mod4+Shift+8" = "move container to workspace number 8";
            "Mod4+Shift+9" = "move container to workspace number 9";
          };
        };
      };
    })
  ];
}
