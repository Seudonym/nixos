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
}
