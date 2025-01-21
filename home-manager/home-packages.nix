{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    _1password-cli
    _1password-gui
    brave
    firefox
    obsidian
    spotify
    telegram-desktop
    yubioath-flutter

    # CLI utils
    brightnessctl
    btop
    cliphist
    eza
    fd
    fzf
    ghostty
    git
    kitty
    neovim
    ripgrep
    starship
    unzip
    wget
    wl-clipboard
    zinit
    zip
    zoxide

    # Programming
    go
    python314
    rustup
    uv

    # WM stuff
    hyprpolkitagent
    libsForQt5.dolphin
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts
    syncthing
    syncthingtray
  ];
}
