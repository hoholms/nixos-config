{ pkgs, ... }:

{
  # Global Nixpkgs Configurations
  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
    allowUnsupportedSystem = true;
  };

  home.packages = with pkgs; [
    # -------------------------------------------------------------------
    # System Core & Utilities
    # These are fundamental tools for system interaction and basic tasks.
    # -------------------------------------------------------------------
    btop # System monitor
    tree # Directory listing utility
    fastfetch # System information fetcher
    wget # Network downloader
    unzip # Archive extraction
    _7zz # 7-Zip archiver
    unrar # RAR archiver
    file-roller # Archive manager (GUI)
    playerctl # Media player controller
    killall # Process killer
    gparted # Disk partition editor (GUI)
    rocmPackages.rocm-smi # AMD ROCm System Management Interface

    # -------------------------------------------------------------------
    # File Management
    # Tools for navigating, viewing, and managing files.
    # -------------------------------------------------------------------
    lf # Terminal file manager
    nautilus # GNOME file manager (GUI)
    kdePackages.dolphin # KDE file manager (GUI)

    # -------------------------------------------------------------------
    # Development & Nix Ecosystem
    # Tools related to coding, development environments, and Nix itself.
    # -------------------------------------------------------------------
    # jetbrains.idea-ultimate # IDE
    nixd # Nix language server
    nil # Nix linter
    nixfmt-classic # Nix code formatter

    # -------------------------------------------------------------------
    # Web Browsers & Communication
    # Applications for internet Browse and communication.
    # -------------------------------------------------------------------
    librewolf # Privacy-focused browser
    firefoxpwa # Firefox PWA helper
    telegram-desktop # Messaging client
    vesktop # Discord client (Vesktop fork)

    # -------------------------------------------------------------------
    # Media & Entertainment
    # Applications for consuming media, gaming, and related utilities.
    # -------------------------------------------------------------------
    vlc # Media player
    loupe # Image viewer
    qbittorrent # Torrent client
    mangohud # Gaming overlay
    protonup # ProtonUp-Qt for Wine/Proton management
    protontricks # Winetricks helper for Proton
    hydralauncher # Game launcher
    nexusmods-app-unfree # Nexus Mods client
    # yandex-music # Music streaming client

    # -------------------------------------------------------------------
    # Hyprland Ecosystem & Theming
    # Tools specific to the Hyprland Wayland compositor and related theming.
    # -------------------------------------------------------------------
    # Bars & Launchers
    waybar-mpris # Waybar with MPRIS support
    rofi-wayland # Rofi for Wayland
    rofi-power-menu # Rofi-based power menu

    # Wayland Portals & Notifications
    libnotify # Notification library
    xdg-desktop-portal-gtk # XDG Desktop Portal for GTK applications
    xdg-desktop-portal-hyprland # XDG Desktop Portal for Hyprland

    # Audio & Clipboard
    pavucontrol # PulseAudio Volume Control
    cliphist # Wayland clipboard history
    wl-clipboard # Wayland clipboard utilities

    # Screenshots & Wallpaper
    hyprshot # Hyprland screenshot tool
    waypaper
  ];
}
