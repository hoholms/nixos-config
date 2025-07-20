{
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL = "1"; # Forcing electron apps to use Wayland
    TERMINAL = "kitty";
    EDITOR = "nano";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
  };
}
