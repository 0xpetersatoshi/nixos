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
    bat
    brightnessctl
    btop
    cliphist
    delta
    eza
    fd
    fzf
    gcc
    ghostty
    git
    gnumake
    kitty
    lazygit
    libcxxStdenv
    neofetch
    neovim
    nerdfonts
    ripgrep
    starship
    stow
    tmux
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
    libsForQt5.dolphin-plugins
    libsForQt5.kwallet
    libsForQt5.kwalletmanager
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
