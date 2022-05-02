. $HOME/.nix-profile/etc/profile.d/nix.sh

. $HOME/.antidote/antidote.zsh
antidote load

. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

export EDITOR=$(command -v micro)
export PATH="$HOME/.local/bin:$PATH"
export RUST_WITHOUT=rust-docs
if command -v podman; then
  export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
fi

alias edit=$EDITOR
alias open=xdg-open
alias emix=". .env && mix "
alias eiex=". .env && iex "

if [ -z "$TMUX" ]; then
  if tmux has-session; then
    tmux ls
    read -k "choice?Choose tmux session to attach: "
    tmux attach -t $choice || tmux
  else
    clear && tmux
  fi
fi
