cd ~

echo 🍜 installing nix package manager

sh <(curl -L https://nixos.org/nix/install) --no-daemon
. $HOME/.nix-profile/etc/profile.d/nix.sh

echo 🍜 installing nix packages

nix-env -iA \
  nixpkgs.bat \
  nixpkgs.curl \
  nixpkgs.fzf \
  nixpkgs.git \
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

echo 🍜 installing oh my zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ "$SHELL" != "$(which zsh)" ]; then
  if command -v lchsh; then
    echo "Please input this in the next prompt: $(which zsh)"
    sudo lchsh $(whoami)
  elif command -v chsh; then
    sudo chsh -s $(which zsh) $(whoami)
  fi
fi

echo 🍜 installing asdf version manager

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

echo 🍜 installing dotfiles

git clone https://github.com/ukazap/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow zsh
cd ~