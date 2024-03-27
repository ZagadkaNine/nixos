#
# DELL Precision 5560 + NVIDIA RTX A2000
#

{ config, pkgs, ... }:

{
  users.users.zagadkanine = {
    isNormalUser = true;
    description = "ZagadkaNine";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager = {
    users.zagadkanine = {
      imports = [
        ./modules/home-manager/zsh.nix
        ./modules/home-manager/gtk.nix
        ./modules/home-manager/neovim/neovim.nix
      ];
      programs.git = {
        enable = true;
        userName = "zagadkanine";
        userEmail = "zagadkanine";
      };

      home.packages = [
        pkgs.whatsapp-for-linux
        pkgs.enpass
        pkgs.spotify
        pkgs.kubectl
        pkgs.postman
      ];

      home.file = {
        ".config/rofi".source = zagadkanine_dotfiles/rofi;
        ".config/rofi-pass".source = zagadkanine_dotfiles/rofi-pass;
        ".config/alacritty".source = zagadkanine_dotfiles/alacritty;
        ".config/starship.toml".source = zagadkanine_dotfiles/starship.toml;
        ".config/hypr".source = zagadkanine_dotfiles/hypr;
        ".config/waybar".source = zagadkanine_dotfiles/waybar;
        ".wallpapers".source = zagadkanine_dotfiles/wallpapers;
      };
    
      home.sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "brave";
        TERMINAl = "alacritty";
      };

      home.stateVersion = "23.11";
    };
  };
}
