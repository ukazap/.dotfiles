. ~/.nix-profile/etc/profile.d/nix.sh

. ~/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

. ~/.antidote/antidote.zsh
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
. ~/.p10k.zsh

export BAT_THEME="Solarized (dark)"
export EDITOR=$(command -v micro)
export PATH="~/.local/bin:$PATH"
command -v podman && export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

alias edit=$EDITOR
alias open=xdg-open
alias emix=". .env && mix "
alias eiex=". .env && iex "