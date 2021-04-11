{ pkgs, ... }:

let
  bar-loadavg = pkgs.writeScriptBin "bar-loadavg" (builtins.readFile ../scripts/bar-loadavg.sh);
  i3-lock = pkgs.writeScriptBin "i3-lock" (builtins.readFile ../scripts/i3-lock.sh);
  i3-pass = pkgs.writeScriptBin "i3-pass" (builtins.readFile ../scripts/i3-pass.sh);
  i3-yy = pkgs.writeScriptBin "i3-yy" (builtins.readFile ../scripts/i3-yy.sh);
in
{
  home.packages = [
    bar-loadavg
    i3-lock
    i3-pass
    i3-yy
  ];
}
