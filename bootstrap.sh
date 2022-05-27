#!/bin/sh
lastdir=$(pwd)

if ! command -v nix-env; then
  echo "🥢 installing nix package manager"

  curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

nix-env -iA nixpkgs.git nixpkgs.curl

if cd ~/.dotfiles && git remote -v | grep ukazap/.dotfiles; then
  git pull
else
  rm -rf ~/.dotfiles
  git clone https://github.com/ukazap/.dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
fi

confirm() {
  printf "$1 (y/n): "; read choice
  case $choice in
    y|Y ) true;;
    n|N ) false;;
    * ) echo "Wrong answer, please enter y/n"; confirm "$1" ;;
  esac
}

sh ./bootstrap-common.sh

confirm "Install desktop apps?" && sh ./bootstrap-desktop.sh
cd $lastdir

touch ~/done-bootstrapping
exec zsh