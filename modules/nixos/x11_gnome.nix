{ config, pkgs, ... }:

{
  services.xserver = {

    enable = true;
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    displayManager.defaultSession = "gnome-xorg";
  };

  # Configure keymap in X11
  services.xserver.xkb = { 
    layout = "us"; 
    variant = "";
  };
}
