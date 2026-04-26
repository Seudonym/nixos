{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.spicetify-nix.nixosModules.default
    ../../modules/core
    ../../modules/profiles/desktop
    ../../modules/profiles/gaming
    ../../modules/hardware/asus
    ../../users/wahid
  ];

  networking.hostName = "zephyrus";
}
