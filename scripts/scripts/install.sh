#!/usr/bin/env bash
set -euo pipefail

echo "Starting software install"

ARCH_PACKAGES=(
    git
    curl
    vim
    tmux
    ttc-iosevka
    ttf-nerd-fonts-symbols
    zsh
    kitty
    ripgrep
    fd
    fzf
    stow
    starship
    syncthing
    nodejs
    npm
    rustup
    go
)

sudo pacman -Syu --needed "${ARCH_PACKAGES[@]}"
paru -Syu --needed neovim-nightly
systemctl --user enable --now syncthing.service

if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    chsh -s /usr/bin/zsh
    echo "Default shell changed to zsh. Log out and back in."
else
    echo "zsh already configured as default shell"
fi

cargo install --locked tree-sitter-cli

stow zsh
stow nvim
stow kitty
stow tmux
stow scripts
stow pomodoro
stow git
stow phpactor

echo "Done."
