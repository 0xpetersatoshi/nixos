{ pkgs, ... }:

{
  security.pam.services = {
    kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };

    login = {
      enableKwallet = true;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

 }
