{ hostname, ... }:

{
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;
  networking.firewall.enable = true;
}
