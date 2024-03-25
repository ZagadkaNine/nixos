{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    iconTheme = {
      name = "Tela-orange";
      package = pkgs.tela-icon-theme;
    };
  };
}
