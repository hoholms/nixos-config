{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Quiet boot options
  # boot.kernelParams = [ "quiet" "console=tty1" ];
  # boot.consoleLogLevel = 0;
}
