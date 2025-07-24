{ pkgs, ... }:

{
  programs.regreet = {
    enable = true;

    cageArgs = [ "-s" ];

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
    };
  };
}
