{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      update = "cd ~/nix && sudo nixos-rebuild --option eval-cache false switch --flake ./#default";
      df="df -h";
      ls="ls";
      l="ls -lah";
      ll="ls -lah";
      ap="ansible-playbook";
      tf="terraform";
      vi="nvim";
      h="history";
      k="kubectl";
      a="source venv/bin/activate";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
