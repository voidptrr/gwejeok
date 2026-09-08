{
  lib,
  config,
  ...
}: {
  options.my.home.programs.codex.enable = lib.mkEnableOption "codex";

  config = lib.mkIf config.my.home.programs.codex.enable {
    programs.codex = {
      enable = true;

      settings = {
        model = "gpt-5.6-sol";
        review_model = "gpt-6-astra";
        model_reasoning_effort = "high";
        personality = "pragmatic";

        approval_policy = "on-request";
        sandbox_mode = "workspace-write";
        web_search = "live";

        check_for_update_on_startup = false;

        shell_environment_policy.ignore_default_excludes = false;

        projects =
          lib.genAttrs
          (map (repo: "${config.home.homeDirectory}/git/${repo}") [
            "nixos-config"
            "nvim-config"
          ])
          (_: {trust_level = "trusted";});
      };

      profiles = {
        deep = {
          model = "gpt-6-astra";
          model_reasoning_effort = "xhigh";
        };

        balanced = {
          model = "gpt-5.6-terra";
          model_reasoning_effort = "high";
        };

        fast = {
          model = "gpt-5.6-luna";
          model_reasoning_effort = "medium";
        };
      };
    };
  };
}
