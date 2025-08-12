{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    lact # The GPU GUI control tool
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ package-version-server ];

  # Move Steam config here as it is not needed/supported for each host
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    # These automatically configure the firewall if it's enabled
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # LACT service for AMD GPU control
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
