{ config, pkgs, ... }:

{
  nix.settings.substituters = [
    "https://cache.nixos.org/"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  environment.systemPackages =
    [ pkgs.vim
      pkgs.pandoc
      pkgs.rectangle

      # dev
      pkgs.silver-searcher
      pkgs.coreutils
      pkgs.jq
      pkgs.llvm
      pkgs.pkg-config
      pkgs.pcre
      pkgs.direnv
    ];
  
  homebrew.enable = true;
  homebrew.brews =
  [
    {
    name = "d12frosted/emacs-plus/emacs-plus";
    args = [ 
      "with-no-titlebar" 
      "with-native-comp"
      "with-retro-emacs-logo-icon"
      ];
    }

    "opam"
  ];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  system.stateVersion = 4;
}
