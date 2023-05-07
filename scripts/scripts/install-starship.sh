#!/bin/bash

INSTALL_PATH=~/bin/starship

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir=$INSTALL_PATH
