#!/bin/bash

current_dir=$(pwd);
neovim_dir="$HOME/deps/neovim";
neovim_install_dir="$neovim_dir/nvim-dist";
nvim_bin_path="$HOME/bin/nvim"
 
[ ! -d "$neovim_dir" ] && git clone --depth 1 https://github.com/neovim/neovim.git $neovim_dir
[ ! -d "$neovim_install_dir" ] && mkdir $neovim_install_dir

cd $neovim_dir;

git fetch --tags && git fetch && git checkout master && git pull;

latest_tag=$(git tag | tail -1);

read -p "Found NVIM version $latest_tag are you sure you want to update now? (y/n)" -n 1 -r
echo

echo "upgrading neovim... to $latest_tag";
git checkout $latest_tag;

# clean up
rm -r build/
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$neovim_install_dir install

if [ ! -f $nvim_bin_path ]; then
    ln -s "${neovim_install_dir}/bin/nvim" $nvim_bin_path
fi

$nvim_bin_path --version

cd $current_dir;
