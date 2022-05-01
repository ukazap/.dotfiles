# install nix

sh <(curl -L https://nixos.org/nix/install) --no-daemon
. $HOME/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
  nixpkgs.git \
  nixpkgs.zsh \
  nixpkgs.curl \
  nixpkgs.tmux \
  nixpkgs.asdf-vm \
  nixpkgs.micro

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ "$SHELL" != "$(which zsh)" ] && command -v lchsh; then
  echo "I will change the login shell, please input this: $(which zsh)"
  sudo lchsh $(whoami)
fi