{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
  
    displayManager.defaultSession = "xfce+i3";
   
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock
        i3blocks
        rofi
        alacritty
        lxappearance
        picom
     ];
    };
  };

  services.xserver.displayManager.gdm.enable = true; 

  # Configure keymap in X11
  services.xserver.xkb = { 
    layout = "us"; 
    variant = "";
  };
}
