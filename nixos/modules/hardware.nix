{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
  };
  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.udisks2.enable = true;

  # LACT service for AMD GPU control
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
