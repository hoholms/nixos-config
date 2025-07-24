{ stateVersion, channel, ... }:

{
  imports =
    [ ./hardware-configuration.nix ./system-packages.nix ../../nixos/modules ];

  system.stateVersion = stateVersion;

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      channel = "https://nixos.org/channels/${channel}";
    };
  };
}
