{...}: {
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs; [
        nil
      ];
    };
  };
}
