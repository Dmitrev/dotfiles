#!/bin/bash

curl -L https://sw.kovidgoyal.net/kitty/installer.sh \
    | sh /dev/stdin dest="$HOME/.local/apps"

