{ config, pkgs, ... }:

{
  hardware = {
    opengl = {
      enable = true;
    };
    nvidia.modesetting.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager ={
      sddm.enable = true;
      sddm.theme = "${import ./sddm-sugar-dark-z9.nix { inherit pkgs; }}";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Wayland
    eww
    dunst
    libnotify
    rofi-wayland
    waybar
    hyprland-protocols
    hyprlock
    swaybg
    sddm-chili-theme
    libsForQt5.qt5.qtgraphicaleffects
    gnome.gvfs
    gnome.nautilus
    wl-clipboard

  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland 
      pkgs.xdg-desktop-portal 
    ];

    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -ro";
        };
      };
    };
  };

  services.xserver.xkb = { 
    layout = "us"; 
    variant = "";
  };

}
