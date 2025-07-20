{
  # Use the dedicated Home Manager service for the blueman-applet.
  # This creates an XDG autostart entry, which is more reliable
  # than exec-once as it waits for the graphical session to be ready.
  services.blueman-applet.enable = true;
}
