SCRIPT_PATH=$(dirname $(realpath "$0"))
bash "$SCRIPT_PATH/util/apps-dir.sh"
bash "$SCRIPT_PATH/util/bin-dir.sh"

DOWNLOAD_URL="https://ziglang.org/download/index.json"
ZIG_VERSION="0.13.0"
KERNEL_NAME=$(uname --kernel-name | tr '[:upper:]' '[:lower:]')
PROCESSOR=$(uname --processor)
ARCH="$PROCESSOR-$KERNEL_NAME"
INSTALL_DIR="$HOME/.local/apps/zig"
BIN_PATH="$HOME/.local/bin/zig"

if [ ! -d "$INSTALL_DIR" ]; then
    mkdir "$INSTALL_DIR"
fi

DOWNLOAD_PATH="/tmp/zig.tar.xz"

if ! command -v jq 2>&1 > /dev/null; then
    echo "This script requires jq to be installed"
    exit 1
fi

DOWNLOAD_OBJ=$(curl -s "$DOWNLOAD_URL" \
    | jq \
    --arg zig_version "$ZIG_VERSION" \
    --arg arch "$ARCH" \
    '.[$zig_version][$arch]')


# -r to avoid double quotes
SHASUM=$(echo "$DOWNLOAD_OBJ" | jq -r '.shasum')
TARBALL=$(echo "$DOWNLOAD_OBJ" | jq -r '.tarball')

# -0 using http1.0
curl -0 "$TARBALL" --output "$DOWNLOAD_PATH"
mkdir /tmp/extracted 2>&1 > /dev/null
tar -xvf "$DOWNLOAD_PATH" -C /tmp/extracted
mv -v "/tmp/extracted/zig-$KERNEL_NAME-$PROCESSOR-$ZIG_VERSION" "$INSTALL_DIR/$ZIG_VERSION"

if [ -L "$BIN_PATH" ]; then
    rm "$BIN_PATH"
fi

ln -s "$INSTALL_DIR/$ZIG_VERSION/zig" "$BIN_PATH"

