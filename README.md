# Automated installation (Mac only)

```sh
chmod u+x install.sh
```

```sh
./install.sh
```

**Install script (todo)**

- Install brew if not found
- Install packer


# Installation manual

in order to create the Symlinks you need GNU Stow

on Mac

```sh
brew install stow
```

## install packer

the plugin manager used for nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## How it works

The dotfiles repo contains package folders on the first level.
Inside each package folder you can find the associated config files.

The files are structured like this:

```sh
<package>/path/relative/to/home/file.conf
```

This is so that stow knows where to put the files when symlinking

**Make sure to run all of these commands from the dotfiles directory, because by default stow considers the current dir to be the dotfiles dir and one level up the target dir!!**

### Enabling a package

basically create the symlinks

```sh
stow <package>
```

for example

```sh
stow nvim
```

### Disabling a package

```sh
stow -D <package>
```
