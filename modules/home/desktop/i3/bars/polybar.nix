{
  config,
  lib,
  osConfig,
  pkgs,
  i3Theme,
  ...
}: let
  i3 = osConfig.my.nixos.desktop.i3;
  inherit (i3Theme) colors;
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
          background = colors.black;
          foreground = colors.gray;
          border-size = 0;
          padding-left = 2;
          padding-right = 2;
          module-margin = 2;
          separator = "";
          font = [
            "JetBrains Mono:size=11;4"
            "Symbols Nerd Font Mono:size=12;4"
            "DejaVu Sans:size=11;4"
          ];
          modules-left = "i3";
          modules-center = "xwindow";
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
          label-focused-foreground = colors.yellow;
          label-focused-padding = 1;
          label-unfocused = "%index%";
          label-unfocused-foreground = colors.gray;
          label-unfocused-padding = 1;
          label-visible = "%index%";
          label-visible-foreground = colors.green;
          label-visible-padding = 1;
          label-urgent = "%index%";
          label-urgent-foreground = colors.red;
          label-urgent-padding = 1;
          label-mode = "%mode%";
          label-mode-foreground = colors.red;
          label-mode-padding = 2;
        };

        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title:0:80:...%";
          label-foreground = colors.green;
          label-empty = "";
        };

        "module/pulseaudio" = {
          type = "internal/pulseaudio";
          interval = 5;
          use-ui-max = false;
          format-volume = "<ramp-volume> <label-volume>";
          label-volume = "%percentage%%";
          label-volume-foreground = colors.gray;
          ramp-volume = [
            ""
            ""
            ""
          ];
          ramp-volume-font = 2;
          ramp-volume-foreground = colors.yellow;
          format-muted = "<label-muted>";
          format-muted-prefix = "󰖁 ";
          format-muted-prefix-font = 2;
          format-muted-prefix-foreground = colors.red;
          label-muted = "muted";
          label-muted-foreground = colors.muted;
        };

        "module/wireless" = {
          type = "internal/network";
          interface-type = "wireless";
          interval = 3;
          format-connected = "<label-connected>";
          format-connected-prefix = " ";
          format-connected-prefix-font = 2;
          format-connected-prefix-foreground = colors.green;
          label-connected = "%signal%%";
          label-connected-foreground = colors.gray;
          format-disconnected = "<label-disconnected>";
          format-disconnected-prefix = "󰖪 ";
          format-disconnected-prefix-font = 2;
          format-disconnected-prefix-foreground = colors.red;
          label-disconnected = "down";
          label-disconnected-foreground = colors.muted;
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          format = "<label>";
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = colors.green;
          label = "%percentage%%";
          label-foreground = colors.gray;
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          format = "<label>";
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = colors.yellow;
          label = "%percentage_used%%";
          label-foreground = colors.gray;
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
          label-charging-foreground = colors.gray;
          animation-charging = [
            ""
            ""
            ""
            ""
            ""
          ];
          animation-charging-font = 2;
          animation-charging-foreground = colors.green;
          animation-charging-framerate = 750;
          format-discharging = "<ramp-capacity> <label-discharging>";
          label-discharging = "%percentage%%";
          label-discharging-foreground = colors.gray;
          ramp-capacity = [
            ""
            ""
            ""
            ""
            ""
          ];
          ramp-capacity-font = 2;
          ramp-capacity-foreground = colors.yellow;
          format-full = "<label-full>";
          format-full-prefix = " ";
          format-full-prefix-font = 2;
          format-full-prefix-foreground = colors.green;
          label-full = "full";
          label-full-foreground = colors.gray;
          format-low = "<label-low>";
          format-low-prefix = " ";
          format-low-prefix-font = 2;
          format-low-prefix-foreground = colors.red;
          label-low = "%percentage%%";
          label-low-foreground = colors.red;
        };

        "module/tray" = {
          type = "internal/tray";
          format = "<tray>";
          tray-spacing = "6px";
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%Y-%m-%d";
          time = "%H:%M";
          label = "%date% %time%";
          label-foreground = colors.gray;
          label-padding = 1;
          format-prefix = " ";
          format-prefix-font = 2;
          format-prefix-foreground = colors.yellow;
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
