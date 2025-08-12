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
    extraPackages = with pkgs; [ amdvlk ];
  };

  hardware.amdgpu.overdrive.enable = true;

  # chaotic.mesa-git.enable = true;
  # chaotic.mesa-git.extraPackages = with pkgs; [ amdvlk ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [ "video=DP-2:2560x1440@165" "video=DP-4:1920x1080@144" ];
}
