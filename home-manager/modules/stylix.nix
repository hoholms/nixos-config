{ inputs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  # TODO: Figure it out and configure
  stylix = {
    enable = true;
    polarity = "dark";
  };
}
