{ config, pkgs, ... }:

{
  home.username = "ham";
  home.homeDirectory = "/home/ham";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    firefox
    alacritty
    spotify
    gimp
    inkscape
    obsidian
    blender

    # archives
    zip
    xz
    unzip
    p7zip

    # command line goodness
    neovim
    tmux
    ripgrep
    jq
    fzf
    bat
    fd
    stow
    delta
    neofetch
    helix

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    htop
    lsof

    # networking tools
    dnsutils  # `dig` + `nslookup`

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    starship = {
      enable = true;
    };
  };

  # Some fancy cursors because the default ones don't quite cut it
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  fonts.fontconfig.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
