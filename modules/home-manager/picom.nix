{ config, pkgs, lib, ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    fade = true;
    backend = "glx";
    fadeDelta = 40;
    fadeSteps = [ 1 0.15 ];
    settings.corner-radius = 4.0;
    settings = {
      frame-opacity = 0.5;
      blur = { 
       	method = "dual_kawase";
      	size = 20;
      	deviation = 5.0;
      };
    };
  };
}
