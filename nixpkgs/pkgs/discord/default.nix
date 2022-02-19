{ pkgs, ... }:

let
  inherit (pkgs) callPackage fetchurl;
  discord = callPackage ./base.nix rec {
    pname = "discord";
    binaryName = "Discord";
    desktopName = "Discord";
    version = "0.0.17";
    src = fetchurl {
      url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "sha256-NGJzLl1dm7dfkB98pQR3gv4vlldrII6lOMWTuioDExU=";
    };
  };
in
{
  # RIP in neptune. Doesn't work.
  home.packages = [ discord ];
}
