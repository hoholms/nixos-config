{ pkgs, stateVersion, channel, ... }:

{
  imports =
    [ ./hardware-configuration.nix ./system-packages.nix ../../nixos/modules ];

  system.stateVersion = stateVersion;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      channel = "https://nixos.org/channels/${channel}";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.initrd.kernelModules = [ "amdgpu" ];
}
