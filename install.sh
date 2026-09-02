#!/usr/bin/env bash

set -euo pipefail

stow -R git --dotfiles
stow -R syncthing
