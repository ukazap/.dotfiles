# 🍜 ukazap's dotfiles

this repo helps me set up a development environment quickly. some stuff may not be relevant for you, but they are for me, cheers.

to achieve portability across operating systems and linux distros, nix package manager is used.

there are two bootstrap scripts available:
  
  - `bootstrap.sh` common stuff which is useful everywhere including cloud environments such as [gitpod.io](gitpod.io) or [codespaces](https://github.com/features/codespaces),
  - `bootstrap-desktop.sh` linux desktop-specific stuff.

## installation

first, review the bootstrap script (avoid running scripts from strangers you haven't read!):

```shell
curl -L https://github.com/ukazap/.dotfiles/raw/main/bootstrap.sh | less
```

then, run it:

```shell
sh <(curl -L https://github.com/ukazap/.dotfiles/raw/main/bootstrap.sh)
```