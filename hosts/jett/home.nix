{
  config,
  self,
  ...
}: {
  home-manager.users.voidptr = {
    imports = builtins.attrValues self.homeModules;

    home = {
      homeDirectory = "/home/voidptr";
      stateVersion = "26.05";
      username = "voidptr";
    };

    programs.home-manager.enable = true;

    my.home = {
      desktop.x11 = {
        enable = true;
        i3.enable = true;
        polybar.enable = true;
      };

      programs = {
        firefox.enable = true;
        git = {
          enable = true;
          name = "voidptrr";
          email = "bruno.tommaso@protonmail.com";
          signingKeyPath = config.age.secrets.gitSigningKey.path;
        };
        ghostty.enable = true;
        neovim.enable = true;
        codex.enable = true;
        ssh.authenticationKeyPaths = {
          github = config.age.secrets.githubSshKey.path;
          codeberg = config.age.secrets.codebergSshKey.path;
        };
        zsh.enable = true;
      };
    };
  };
}
