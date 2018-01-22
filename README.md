# dotfiles

This repository manages my personal configuration for: iTerm, Git and ZSH

## Screenshot
WIP :wink:

## Install

```bash
# Clone this repository
git clone git@github.com:korni22/dotfiles.git ~/.dotfiles

# Set everything up (overwrites existing)
cd ~/.dotfiles && make all
```

## Advanced

If you don't want everything, you can run the steps individually:

- `make brew`: Install [Homebrew](https://brew.sh) + packages
- `make cask`: Install [Brew Cask](https://caskroom.github.io/) and the applications
- `make link`: Link `.*` to `$HOME` (**NOTE:** This will overwrite your current
  files)
