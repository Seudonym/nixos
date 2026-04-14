{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/system.nix
    ../../modules/common/fonts.nix
    ../../modules/common/desktop.nix
    ../../modules/common/gaming.nix
    ../../modules/users/wahid.nix
    ../../modules/hardware/asus.nix
    ../../modules/integrations/noctalia.nix
  ];

  networking.hostName = "zephyrus";
}
