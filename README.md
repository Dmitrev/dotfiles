# Installation

in order to create the Symlinks you need GNU Stow

on Mac

```sh
brew install stow
```

## enabling config

The dotfiles repo contains package folders on the first level.
Inside each package folder you can find the associated config files.

**Make sure to run all of these commands from the dotfiles directory!!**

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
