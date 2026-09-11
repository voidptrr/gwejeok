{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  i3 = osConfig.my.nixos.desktop.i3;
  inherit (osConfig.my.snippets.theme) font palette;
  enabled = config.my.home.desktop.i3.enable && i3.enable && i3.usePolybar;
in {
  config = lib.mkIf enabled {
    xsession.windowManager.i3.config.bars = [];
    xsession.windowManager.i3.config.startup = [
      {
        command = "systemctl --user restart polybar.service";
        always = true;
        notification = false;
      }
    ];

    services.polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
      script = "polybar --reload main &";
      settings = {
        "bar/main" = {
          width = "100%";
          height = "34px";
          offset-x = 0;
          offset-y = 0;
          fixed-center = true;
          background = palette.base00;
          foreground = palette.base07;
          border-size = 0;
          line-size = "2px";
          padding-left = 1;
          padding-right = 1;
          module-margin = 1;
          separator = "";
          font =
            [
              "${builtins.head font.names}:size=${toString font.size};4"
              "Symbols Nerd Font Mono:size=${toString font.size};4"
            ]
            ++ map (name: "${name}:size=${toString font.size};4") (builtins.tail font.names)
            ++ ["DejaVu Sans:size=${toString font.size};4"];
          modules-left = "i3";
          modules-right = "pulseaudio wireless cpu memory battery tray date";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          enable-ipc = true;
        };

        "module/i3" = {
          type = "internal/i3";
          pin-workspaces = true;
          show-urgent = true;
          index-sort = true;
          enable-click = true;
          enable-scroll = true;
          wrapping-scroll = false;
          format = "<label-state> <label-mode>";
          label-focused = "%index%";
          label-focused-foreground = palette.base07;
          label-focused-underline = palette.base0A;
          label-focused-padding = 1;
          label-unfocused = "%index%";
          label-unfocused-foreground = palette.base05;
          label-unfocused-padding = 1;
          label-visible = "%index%";
          label-visible-foreground = palette.base06;
          label-visible-padding = 1;
          label-urgent = "%index%";
          label-urgent-foreground = palette.base07;
          label-urgent-padding = 1;
          label-mode = "%mode%";
          label-mode-foreground = palette.base07;
          label-mode-padding = 2;
        };

        "module/pulseaudio" = {
          type = "internal/pulseaudio";
          interval = 5;
          use-ui-max = false;
          format-volume = "<ramp-volume> <label-volume>";
          label-volume = "%percentage%%";
          label-volume-foreground = palette.base07;
          ramp-volume = [
            ""
            ""
            ""
          ];
          ramp-volume-font = 2;
          ramp-volume-foreground = palette.base0A;
          format-muted = "<label-muted>";
          format-muted-prefix = "󰖁 ";
          format-muted-prefix-font = 2;
          format-muted-prefix-foreground = palette.base07;
          label-muted = "muted";
          label-muted-foreground = palette.base04;
        };

        "module/wireless" = {
          type = "internal/network";
          interface-type = "wireless";
          interval = 3;
          format-connected = "<label-connected>";
          format-connected-prefix = " ";
          format-connected-prefix-font = 2;
          format-connected-prefix-foreground = palette.base06;
          label-connected = "%signal%%";
          label-connected-foreground = palette.base07;
          format-disconnected = "<label-disconnected>";
          format-disconnected-prefix = "󰖪 ";
          format-disconnected-prefix-font = 2;
          format-disconnected-prefix-foreground = palette.base07;
          label-disconnected = "down";
          label-disconnected-foreground = palette.base04;
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          format = "<label>";
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = palette.base06;
          label = "%percentage%%";
          label-foreground = palette.base07;
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          format = "<label>";
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = palette.base0A;
          label = "%percentage_used%%";
          label-foreground = palette.base07;
        };

        "module/battery" = {
          type = "internal/battery";
          battery = "BAT0";
          adapter = "AC";
          full-at = 100;
          low-at = 15;
          poll-interval = 5;
          format-charging = "<animation-charging> <label-charging>";
          label-charging = "+%percentage%%";
          label-charging-foreground = palette.base07;
          animation-charging = [
            ""
            ""
            ""
            ""
            ""
          ];
          animation-charging-font = 2;
          animation-charging-foreground = palette.base06;
          animation-charging-framerate = 750;
          format-discharging = "<ramp-capacity> <label-discharging>";
          label-discharging = "%percentage%%";
          label-discharging-foreground = palette.base07;
          ramp-capacity = [
            ""
            ""
            ""
            ""
            ""
          ];
          ramp-capacity-font = 2;
          ramp-capacity-foreground = palette.base0A;
          format-full = "<label-full>";
          format-full-prefix = " ";
          format-full-prefix-font = 2;
          format-full-prefix-foreground = palette.base06;
          label-full = "full";
          label-full-foreground = palette.base07;
          format-low = "<label-low>";
          format-low-prefix = " ";
          format-low-prefix-font = 2;
          format-low-prefix-foreground = palette.base07;
          label-low = "%percentage%%";
          label-low-foreground = palette.base07;
        };

        "module/tray" = {
          type = "internal/tray";
          format = "<tray>";
          tray-spacing = "6px";
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%Y년 %m월 %d일";
          time = "%H:%M";
          label = "%date% %time%";
          label-foreground = palette.base07;
          label-padding = 1;
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = palette.base0A;
        };
      };
    };

    systemd.user.services.polybar = {
      Unit = {
        After = ["graphical-session.target"];
        PartOf = lib.mkForce ["graphical-session.target"];
      };
      Install.WantedBy = lib.mkForce ["graphical-session.target"];
    };
  };
}
