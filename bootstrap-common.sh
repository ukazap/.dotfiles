#!/bin/sh
echo 🥢 installing nix packages

nix-env -iA \
  nixpkgs.bat \
  nixpkgs.cowsay \
  nixpkgs.fzf \
  nixpkgs.glibcLocales \
  nixpkgs.jc \
  nixpkgs.jq \
  nixpkgs.magic-wormhole \
  nixpkgs.micro \
  nixpkgs.neofetch \
  nixpkgs.ripgrep \
  nixpkgs.stow \
  nixpkgs.tmux \
  nixpkgs.zsh \
  ;

echo 🥢 installing dotfiles
stow zsh
stow tmux

if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo 🥢 setting zsh as default shell
  command -v zsh | sudo tee -a /etc/shells
  if command -v chsh; then
    sudo chsh -s $(command -v zsh) $(whoami)
  elif command -v lchsh; then
    echo "🥢 Ouch, there's no chsh. Please input this in the next prompt: $(command -v zsh)"
    sudo lchsh $(whoami)
  fi
fi

echo 🥢 installing tmux plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

if ! command -v asdf; then
  echo 🥢 installing asdf version manager
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
fi

if [ ! -d ~/.antidote ]; then
  echo "🥢 installing antidote (zsh plugin management)"
  git clone https://github.com/mattmc3/antidote.git ~/.antidote
fi
