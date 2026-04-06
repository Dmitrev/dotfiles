#!/usr/bin/env bash
set -exo pipefail

sudo apt install clang
CC=clang cargo install tree-sitter-cli
