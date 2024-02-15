#!/bin/bash

INSTALL_PATH=~/.local/bin

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir=$INSTALL_PATH -y
