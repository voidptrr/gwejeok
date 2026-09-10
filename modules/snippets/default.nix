{
  lib,
  self,
  ...
}: {
  imports = lib.filter (path: path != ./themes) (self.lib.fs.scanPaths ./.);
}
