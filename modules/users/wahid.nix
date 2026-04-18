{
  inputs,
  pkgs,
  ...
}:

{
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

      codex

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
      protonup-qt
    ];
  };
}
