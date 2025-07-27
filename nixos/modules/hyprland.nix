{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.gvfs.enable = true;

  security.pam.services.hyprlock = { };
}
