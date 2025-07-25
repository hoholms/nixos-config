{ config, ... }: {
  xdg = {
    enable = true;
    userDirs = let home = config.home.homeDirectory;
    in {
      enable = true;
      createDirectories = true;
      desktop = null;
      download = "${home}/Downloads";
      documents = "${home}/Documents";
      pictures = "${home}/Pictures";
      music = null;
      publicShare = null;
    };

    mimeApps = let
      nautilus = [ "org.gnome.Nautilus.desktop" ];
      vlc = [ "vlc.desktop" ];
      zathura = [ "zathura.desktop" ];
      zen = [ "zen-twilight.desktop" ];

      associations = {
        "inode/directory" = nautilus;
        "x-scheme-handler/geo" = "wheelmap-geo-handler.desktop";

        "application/pdf" = zathura;

        "x-scheme-handler/hydralauncher" = "hydralauncher.desktop";
        "x-scheme-handler/discord" = "vesktop.desktop";

        "video/*" = vlc; # not working as expected...
        "video/x-matroska" = vlc;
        "video/quicktime" = vlc;

        "video/mp4" = vlc;
        "audio/mpeg" = vlc;
        "audio/*" = vlc;

        "application/x-extension-shtml" = zen;
        "application/x-extension-xhtml" = zen;
        "application/x-extension-html" = zen;
        "application/x-extension-xht" = zen;
        "application/x-extension-htm" = zen;
        "x-scheme-handler/unknown" = zen;
        "x-scheme-handler/mailto" = zen;
        "x-scheme-handler/chrome" = zen;
        "x-scheme-handler/about" = zen;
        "x-scheme-handler/https" = zen;
        "x-scheme-handler/http" = zen;
        "application/xhtml+xml" = zen;
        "application/json" = zen;
        "text/plain" = zen;
        "text/html" = zen;
      };
    in {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
