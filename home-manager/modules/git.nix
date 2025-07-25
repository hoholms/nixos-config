{
  programs.git = {
    enable = true;
    userName = "bysinka_95";
    userEmail = "ninikabug@gmail.com";
    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
    };
  };

  services.gnome-keyring.enable = true;
}
