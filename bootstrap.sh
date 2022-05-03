lastdir=$(pwd)

if cd ~/.dotfiles && git remote -v | grep ukazap/.dotfiles; then
  git pull
else
  rm -rf ~/.dotfiles
  git clone https://github.com/ukazap/.dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
fi

sh ./bootstrap-common.sh

printf "Install desktop apps? (y/n): "; read choice
case $choice in
  y|Y ) sh ./bootstrap-desktop.sh;;
  * ) echo "bootstrap-desktop.sh skipped";;
esac

cd $lastdir
echo "🍜 run 'exec zsh' to switch to zsh"
echo "🍜 try rebooting the computer if zsh isn't yet the default shell"
echo "🍜 and that's it!"