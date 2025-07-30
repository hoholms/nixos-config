{
  services.hyprpaper = {
    enable = false;

    settings = let
      folder = (builtins.dirOf __curPos.file) + "/wallpapers";
      image = "default.jpg";
    in {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "${folder}/${image}" ];

      wallpaper = [ ",${folder}/${image}" ];
    };
  };
}
