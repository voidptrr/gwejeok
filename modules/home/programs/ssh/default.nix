{
  lib,
  config,
  ...
}: let
  cfg = config.my.home.programs.ssh;
in {
  options.my.home.programs.ssh.authenticationKeyPaths = {
    github = lib.mkOption {
      type = with lib.types; nullOr nonEmptyStr;
      default = null;
      description = "Path to the SSH private key used for github.com.";
    };

    codeberg = lib.mkOption {
      type = with lib.types; nullOr nonEmptyStr;
      default = null;
      description = "Path to the SSH private key used for codeberg.org.";
    };
  };

  config = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "github.com" = lib.mkIf (cfg.authenticationKeyPaths.github != null) {
          HostName = "github.com";
          User = "git";
          IdentityFile = cfg.authenticationKeyPaths.github;
          IdentitiesOnly = true;
        };

        "codeberg.org" = lib.mkIf (cfg.authenticationKeyPaths.codeberg != null) {
          HostName = "codeberg.org";
          User = "git";
          IdentityFile = cfg.authenticationKeyPaths.codeberg;
          IdentitiesOnly = true;
        };
      };
    };
  };
}
