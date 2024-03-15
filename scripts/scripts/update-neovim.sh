#!/bin/bash

current_dir=$(pwd);
neovim_dir="$HOME/.local/apps/neovim";
neovim_install_dir="$neovim_dir/nvim-dist";
nvim_bin_path="$HOME/.local/bin/nvim"
 
[ ! -d "$neovim_dir" ] && git clone --depth 1 https://github.com/neovim/neovim.git $neovim_dir
[ ! -d "$neovim_install_dir" ] && mkdir $neovim_install_dir

cd $neovim_dir;

git fetch --tags && git fetch && git checkout master && git pull;

latest_tag=$(git tag | tail -1);

echo "Choose option: "
echo "    1) latest stable ($latest_tag) - default" 
echo "    2) latest nightly"

read -p "Your choice (1 or 2): " VERSION_CHOICE

git fetch --tags --force

if [ "$VERSION_CHOICE" = "2" ]
then
    BRANCH="nightly"
else 
    BRANCH=$latest_tag
fi

echo "upgrading neovim... to $BRANCH";
git checkout $BRANCH;

# clean up
rm -r build/
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$neovim_install_dir install

if [ ! -f $nvim_bin_path ]; then
    ln -s "${neovim_install_dir}/bin/nvim" $nvim_bin_path
fi

$nvim_bin_path --version

cd $current_dir;
