{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k-config";
        src = (builtins.dirOf __curPos.file) + "/p10k";
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    # History settings
    history = {
      size = 10000;
      share = true;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # Aliases
    shellAliases = {
      nixconfig = "sudoedit /etc/nixos/configuration.nix";
      nixupdate = "sudo nixos-rebuild switch --flake ~/nixos-config --sudo";
      nixclean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      homeupdate = "home-manager switch --flake ~/nixos-config";
      zedots = "zeditor ~/nixos-config";
    };

    initContent = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      zstyle ':completion:*' menu select
    '';
  };
}
