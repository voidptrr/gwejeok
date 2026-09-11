{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  i3 = config.my.home.desktop.x11.i3;
  inherit (osConfig.my.snippets.theme) font palette;
in {
  options.my.home.desktop.x11.i3.i3status.enable = lib.mkEnableOption "i3status bar";

  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = !i3.i3status.enable || i3.enable;
          message = "my.home.desktop.x11.i3.i3status.enable requires my.home.desktop.x11.i3.enable";
        }
      ];
    }

    (lib.mkIf i3.i3status.enable {
      xsession.windowManager.i3.config.bars = [
        {
          fonts = {inherit (font) names size;};
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          trayOutput = "primary";
          colors = {
            background = palette.base00;
            statusline = palette.base06;
            separator = palette.base04;
            focusedWorkspace = {
              border = palette.base00;
              background = palette.base00;
              text = palette.base0A;
            };
            activeWorkspace = {
              border = palette.base00;
              background = palette.base00;
              text = palette.base06;
            };
            inactiveWorkspace = {
              border = palette.base00;
              background = palette.base00;
              text = palette.base04;
            };
            urgentWorkspace = {
              border = palette.base00;
              background = palette.base00;
              text = palette.base07;
            };
            bindingMode = {
              border = palette.base00;
              background = palette.base00;
              text = palette.base07;
            };
          };
          extraConfig = ''
            separator_symbol "|"
          '';
        }
      ];

      programs.i3status = {
        enable = true;
        enableDefault = false;
        general = {
          output_format = "i3bar";
          markup = "pango";
          colors = true;
          interval = 2;
          color_good = palette.base06;
          color_bad = palette.base07;
          color_degraded = palette.base0A;
        };
        modules = {
          "tztime local" = {
            position = 1;
            settings.format = "<span color='${palette.base0A}'>%Y년 %m월 %d일 %H:%M</span>";
          };
          "volume master" = {
            position = 2;
            settings = {
              format = "VOL %volume";
              format_muted = "VOL muted";
              device = "default";
              mixer = "Master";
              mixer_idx = 0;
            };
          };
          "battery all" = {
            position = 3;
            settings = {
              format = "BAT %status %percentage";
              format_down = "BAT %status %percentage";
              threshold_type = "percentage";
              status_chr = "+";
              status_bat = "";
              status_full = "full";
              low_threshold = 15;
              integer_battery_capacity = true;
              hide_seconds = true;
            };
          };
          "wireless _first_" = {
            position = 4;
            settings = {
              format_up = "WIFI %quality";
              format_down = "WIFI down";
            };
          };
          cpu_usage = {
            position = 5;
            settings.format = "CPU %usage";
          };
          memory = {
            position = 6;
            settings = {
              format = "MEM %percentage_used";
              threshold_degraded = "50%";
              format_degraded = "MEM %percentage_used";
            };
          };
        };
      };
    })
  ];
}
