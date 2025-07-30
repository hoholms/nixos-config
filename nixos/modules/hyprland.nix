{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  security.pam.services.hyprlock = { };
}
