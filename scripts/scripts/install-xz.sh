#!/usr/bin/env bash
set -exo pipefail

# import maintainer's public key
gpg --batch --import ~/dotfiles/scripts/scripts/public_keys/xz.pub
# fully trust this key
echo "3690C240CE51B4670D30AD1C38EE757D69184620:6:" | gpg --import-ownertrust

VERSION="5.8.2"
SIG_FILE="$HOME/dotfiles/scripts/scripts/public_keys/xz-$VERSION.sig"
cd /tmp
curl -L -O "https://github.com/tukaani-project/xz/releases/download/v$VERSION/xz-$VERSION.tar.gz"
gpg --verify "$SIG_FILE" "xz-$VERSION.tar.gz"

tar -vzxf "xz-$VERSION.tar.gz"
