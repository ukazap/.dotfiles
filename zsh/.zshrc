# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. $HOME/.nix-profile/etc/profile.d/nix.sh

. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

. $HOME/.antidote/antidote.zsh
antidote load

export BAT_THEME="Solarized (dark)"
export EDITOR=$(command -v micro)
export PATH="$HOME/.local/bin:$PATH"
export RUST_WITHOUT=rust-docs
command -v podman && export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

alias edit=$EDITOR
alias open=xdg-open
alias emix=". .env && mix "
alias eiex=". .env && iex "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh