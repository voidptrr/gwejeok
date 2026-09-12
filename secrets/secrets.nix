let
  trim = key: builtins.replaceStrings ["\n"] [""] key;
  jett = trim (builtins.readFile ./publickeys/jett_age.pub);
in {
  "privatekeys/codeberg/auth.age".publicKeys = [jett];
  "privatekeys/commit.age".publicKeys = [jett];
  "privatekeys/github/auth.age".publicKeys = [jett];
}
