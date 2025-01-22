{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnupg
    keymapp
    pinentry-qt
  ];
}
