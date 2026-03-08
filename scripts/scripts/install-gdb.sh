#!/usr/bin/env bash
set -exo pipefail

# dependency:
# -gmp

VERSION="17.1"

cd /tmp
curl -L -O "https://ftp.gnu.org/gnu/gdb/gdb-$VERSION.tar.gz"
tar -vzxf "gdb-$VERSION.tar.gz"
cd "gdb-$VERSION.tar.gz"
./configure
make

