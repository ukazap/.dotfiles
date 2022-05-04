# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. ~/.nix-profile/etc/profile.d/nix.sh

. ~/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

. ~/.antidote/antidote.zsh
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
. ~/.p10k.zsh

export BAT_THEME="Solarized (dark)"
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
export EDITOR=$(command -v micro)
export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"
export PATH="~/.local/bin:$PATH"

alias edit=$EDITOR
alias open=xdg-open
alias emix=". .env && mix "
alias eiex=". .env && iex "

if [ -f ~/done-bootstrapping ]; then
  rm ~/done-bootstrapping
  cowsay -f dragon "dev environment setup done 🍜"
  neofetch
fi
