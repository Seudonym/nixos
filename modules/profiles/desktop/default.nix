{ inputs, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

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

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
