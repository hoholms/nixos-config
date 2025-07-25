{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.rocmSupport = true;

  home.packages = with pkgs; [
    # --- Editors & IDEs ---
    # jetbrains.idea-ultimate
    nixd
    nil
    nixfmt-classic
    yandex-music

    # --- Terminals & Utilities ---
    btop
    tree
    microfetch
    wget
    unzip
    _7zz
    unrar
    playerctl
    killall
    qbittorrent
    lf # terminal file manager

    # --- Browsers & Communication ---
    librewolf
    firefoxpwa
    vesktop # Discord client

    # --- Gaming ---
    hydralauncher
    nexusmods-app-unfree
    mangohud
    protonup
    protontricks
    winetricks
    wineWowPackages.waylandFull
    bottles
    vlc

    # --- Hyprland Ecosystem & Theming ---
    # Bar & Launcher
    # waybar
    waybar-mpris
    rofi-wayland
    rofi-power-menu

    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Notifications & Applets
    pavucontrol

    # Clipboard & Wallpaper
    cliphist
    wl-clipboard
    hyprpaper
    waypaper
    # hyprlock
    hyprsome

    # System info & Helpers
    rocmPackages.rocm-smi
    gparted

    # --- File Manager (Dolphin) & Dependencies ---
    nautilus
    kdePackages.dolphin
    kdePackages.kdegraphics-thumbnailers
    libsForQt5.ffmpegthumbs
    kdePackages.qtsvg
    libsForQt5.kio-extras
  ];
}
