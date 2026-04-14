{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zephyrus"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" ];
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts = {

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      nerd-fonts.victor-mono
      roboto
    ];
    fontconfig = {
      defaultFonts = {
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
  };

  # DE
  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable polkit
  security.polkit.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.wahid = {
    isNormalUser = true;
    description = "Wahid Khan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kitty
      vicinae
      brightnessctl
      spotify
      gpu-screen-recorder

      zoxide
      gh
      eza
      dua
      duf
      fd
      ripgrep
      stow
      git
      zsh
      starship

      # nvim
      tree-sitter
      typescript-language-server
      lua-language-server
      clang-tools
      biome
      nil
      nixfmt
      gcc

      codex

      onlyoffice-desktopeditors
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      qbittorrent

      # gayming
      ckan
      lutris
      protonup-qt
    ];
  };

  programs.zsh.enable = true;

  hardware.bluetooth.enable = true;

  # steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    neovim
    wget
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
    xwayland-satellite
    wl-clipboard
  ];

  system.stateVersion = "25.11"; # Did you read the comment?

}
