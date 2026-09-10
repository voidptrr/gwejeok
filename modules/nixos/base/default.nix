{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.my.snippets.theme) font;
in {
  options.my.nixos.base.enable = lib.mkEnableOption "base system configuration";

  config = lib.mkIf config.my.nixos.base.enable {
    hardware.alsa.enablePersistence = true;
    security.rtkit.enable = true;

    fonts.packages = font.packages;
    fonts.fontconfig.defaultFonts = {
      monospace = font.names;
      sansSerif = font.names;
    };
    environment.systemPackages = with pkgs; [
      brightnessctl
      pulseaudio
      alsa-utils
      xclip
      wl-clipboard
      man-pages
      scc
    ];

    services = {
      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
          tapping = false;
        };
      };

      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        jack.enable = true;
        wireplumber.enable = true;
      };
    };
  };
}
