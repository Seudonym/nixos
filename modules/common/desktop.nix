{ ... }:

{
  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
}
