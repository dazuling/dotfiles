{ pkgs, ... }:

{
  programs.fish.enable = true;
  programs.gpg.enable = true;

  imports = [
    ../pkgs/git
    ../pkgs/tmux
  ];

  home.packages = with pkgs; [
    autossh
    bat
    curl
    dnsutils
    exa
    fd
    fzf
    graphviz
    imagemagick
    jq
    mediainfo
    neofetch
    neovim
    nnn
    pass
    pdftk
    procps-ng
    python39Packages.pipx
    ripgrep
    speedtest-cli
    sqlite
    sshfs
    tldr
    trash-cli
    tree
    weechat
    wget
    whois
  ];
}
