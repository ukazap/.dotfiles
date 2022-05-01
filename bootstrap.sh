# install nix

sh <(curl -L https://nixos.org/nix/install) --no-daemon
. $HOME/.nix-profile/etc/profile.d/nix.sh

# install nix packages

nix-env -iA \
  nixpkgs.asdf-vm \
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

# install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ "$SHELL" != "$(which zsh)" ] && command -v lchsh; then
  echo "I will change the login shell, please input this: $(which zsh)"
  sudo lchsh $(whoami)
fi

# restore dotfiles

echo "restoring dotfiles..."