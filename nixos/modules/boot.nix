{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Quiet boot options
  boot.kernelParams = [ "quiet" "console=tty1" ];
  boot.consoleLogLevel = 0;
}
