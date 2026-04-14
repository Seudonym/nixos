{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      nerd-fonts.victor-mono
      roboto
    ];

    fontconfig.defaultFonts = {
      serif = [
        "Liberation Serif"
        "Vazirmatn"
      ];
      sansSerif = [
        "Ubuntu"
        "Vazirmatn"
      ];
      monospace = [ "Ubuntu Mono" ];
    };
  };
}
