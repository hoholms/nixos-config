{
  programs.zed-editor = {
    enable = true;

    extensions = [ "nix" ];

    userSettings = {
      base_keymap = "JetBrains";
      features = { copilot = false; };
      telemetry = { metrics = false; };
      vim_mode = false;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "dark";
        dark = "Ayu Dark";
        light = "Ayu Light";
      };
      languages = {
        Nix = {
          language_servers = [ "nil" "!nixd" ];
          formatter = { external = { command = "nixfmt"; }; };
        };
      };
    };
  };
}
