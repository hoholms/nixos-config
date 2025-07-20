{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    roboto
    dejavu_fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-emoji
    texlivePackages.hebrew-fonts
    powerline-fonts
    powerline-symbols
  ];
}
