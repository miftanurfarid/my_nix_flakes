{ config, pkgs, ... }:

{
  home.username = "fafa";
  home.homeDirectory = "/home/fafa";
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    libreoffice
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this uration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the uration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fafa/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    exa.enable = true;
    exa.enableAliases = true;
    neovim.enable = true;
    neovim.coc.enable = true;
    
    git = {
      enable = true;
      lfs.enable = true;
      userEmail = "miftanurfarid@gmail.com";
      userName = "miftanurfarid";
       extraConfig= {
        init = {
	  defaultBranch = "master";
	};
      };
    };

    # EDITOR
    vscode = {
      enable = true;
      extensions = [
        pkgs.vscode-extensions.jnoortheen.nix-ide
        pkgs.vscode-extensions.yzhang.markdown-all-in-one
      ];
    };
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
