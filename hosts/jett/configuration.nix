{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen6
    ./hardware-configuration.nix
    ./base.nix
    ./home.nix
    ./secrets.nix
  ];

  my.nixos = {
    base.enable = true;

    desktop = {
      x11 = {
        enable = true;
        i3.enable = true;
      };
    };

    programs.nix.enable = true;

    services = {
      ly.enable = true;
    };
  };
}
