{
  lib,
  config,
  ...
}: {
  options.my.home.programs.codex.enable = lib.mkEnableOption "codex";

  config = lib.mkIf config.my.home.programs.codex.enable {
    programs.codex.enable = true;
  };
}
