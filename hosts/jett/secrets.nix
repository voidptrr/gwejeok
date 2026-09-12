{
  config,
  self,
  ...
}: let
  userSecret = file: {
    inherit file;
    owner = "voidptr";
    group = config.users.users.voidptr.group;
    mode = "0600";
  };
in {
  age = {
    identityPaths = [
      "${config.users.users.voidptr.home}/.config/ragenix/age/keys.txt"
    ];

    secrets = {
      codebergSshKey = userSecret (self.secretsDir + /privatekeys/codeberg/auth.age);
      githubSshKey = userSecret (self.secretsDir + /privatekeys/github/auth.age);
      gitSigningKey = userSecret (self.secretsDir + /privatekeys/commit.age);
    };
  };
}
