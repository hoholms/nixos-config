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

  services.xserver.videoDrivers = [ "amdgpu" ];

  boot.initrd.kernelModules = [ "amdgpu" "i2c-dev" ];

  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  boot.kernelParams = [
    "video=DP-2:3440x1440@240"
    "video=DP-4:2560x1440@165"
    "video=HDMI-A-1:d"
  ];
}
