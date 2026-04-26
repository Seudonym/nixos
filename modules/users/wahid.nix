{
  inputs,
  pkgs,
  ...
}:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.starryNight;
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
      powerBar
      hidePodcasts
      fullAppDisplay
    ];
    colorScheme = "Base";
  };

  users.users.wahid = {
    isNormalUser = true;
    description = "Wahid Khan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;

    packages = with pkgs; [
      kitty
      vicinae
      brightnessctl
      gpu-screen-recorder
      kdePackages.kdeconnect-kde

      zoxide
      yazi
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
      unzip

      tree-sitter
      typescript-language-server
      lua-language-server
      clang-tools
      biome
      nil
      nixfmt
      gcc

      uv
      awscli2

      codex
      gemini-cli
      sshfs

      onlyoffice-desktopeditors
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      qbittorrent
      gthumb
      nautilus
      morewaita-icon-theme

      nwg-look
      adw-gtk3

      ckan
      lutris
      vulkan-loader
      vulkan-tools
      vulkan-headers
      protonup-qt

      prismlauncher
    ];
  };
}
