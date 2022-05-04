# 🍜 ukazap's dotfiles

this repo helps me set up a development environment quickly. some stuff may not be relevant for you, but they are for me, cheers.

to achieve portability across operating systems and linux distros, nix package manager is used.

## installing

first, review the bootstrap script (common sense says you should not execute scripts you haven't read).

all good? then run it:

```shell
sh <(curl -L https://github.com/ukazap/.dotfiles/raw/main/bootstrap.sh)
```

that will clone/pull this repository and then execute `bootstrap-common.sh` and optionally followed by `bootstrap-desktop`:
  
  - `bootstrap-common.sh`: common stuff which is useful everywhere including cloud environments such as [gitpod.io](gitpod.io) or [codespaces](https://github.com/features/codespaces),
  - `bootstrap-desktop.sh`: linux desktop-specific stuff.

## todo

* [x] use [antidote](https://getantidote.github.io/) to manage zsh plugins
* [ ] lock nixpkgs versions, use home.nix and home-manager
* [ ] restore secrets (e.g. gpg keys, ssh keys) from remote backups
* [x] test on fedora
* [x] test on ubuntu
* [ ] test on macos
* [ ] add podman/docker in bootstrap.sh
