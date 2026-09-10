{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  i3 = osConfig.my.nixos.desktop.i3;
  inherit (osConfig.my.snippets.theme) colors font;
  enabled = config.my.home.desktop.i3.enable && i3.enable && i3.usei3Status;
in {
  config = lib.mkIf enabled {
    xsession.windowManager.i3.config.bars = [
      {
        fonts = {inherit (font) names size;};
        position = "top";
        statusCommand = "${pkgs.i3status}/bin/i3status";
        trayOutput = "primary";
        colors = {
          background = colors.black;
          statusline = colors.green;
          separator = colors.muted;
          focusedWorkspace = {
            border = colors.black;
            background = colors.black;
            text = colors.yellow;
          };
          activeWorkspace = {
            border = colors.black;
            background = colors.black;
            text = colors.green;
          };
          inactiveWorkspace = {
            border = colors.black;
            background = colors.black;
            text = colors.muted;
          };
          urgentWorkspace = {
            border = colors.black;
            background = colors.black;
            text = colors.red;
          };
          bindingMode = {
            border = colors.black;
            background = colors.black;
            text = colors.red;
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
        color_good = colors.green;
        color_bad = colors.red;
        color_degraded = colors.yellow;
      };
      modules = {
        "tztime local" = {
          position = 1;
          settings.format = "<span color='${colors.yellow}'>%Y-%m-%d %H:%M</span>";
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
  };
}
