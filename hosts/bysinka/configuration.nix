{ stateVersion, ... }:

{
  imports =
    [ ./hardware-configuration.nix ./system-packages.nix ../../nixos/modules ];

  system.stateVersion = stateVersion;
}
