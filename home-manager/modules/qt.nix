{ pkgs, ... }:

# TODO: Figure it out and configure
{
  home.packages = with pkgs; [ papirus-icon-theme ];
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
