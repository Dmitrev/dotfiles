#!/bin/bash

lsp_dir=~/deps/lsp
# prepare target dir
if [ ! -d "$lsp_dir" ]; then
    mkdir $lsp_dir
fi

# install lua-language-server
lsp_dir_lua="$lsp_dir/lua-language-server"
lsp_lua_bin_path="$lsp_dir_lua/bin/lua-language-server"
lsp_lua_symlink_target="/usr/local/bin/lua-language-server"

if [ ! -d "$lsp_dir_lua" ]; then
    mkdir $lsp_dir_lua
fi

rm -rfv "$lsp_dir_lua/*"
curl https://api.github.com/repos/LuaLS/lua-language-server/releases/latest \
    | jq --raw-output '.assets[4].browser_download_url' \
    | xargs curl -L -o /tmp/lualsp.tar.gz \
    && tar -xzvf /tmp/lualsp.tar.gz -C "${lsp_dir_lua}/"

if [ -L "$lsp_lua_symlink_target" ]; then
    rm $lsp_lua_symlink_target
fi

ln -s $lsp_lua_bin_path $lsp_lua_symlink_target
# end lua-language-server
