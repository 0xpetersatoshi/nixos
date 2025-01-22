{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnupg
    keymapp
    lsof
    pinentry-qt
  ];
}
