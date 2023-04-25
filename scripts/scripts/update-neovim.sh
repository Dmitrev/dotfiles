#!/bin/bash
current_dir=$(pwd);
neovim_dir="$HOME/neovim";
neovim_install_dir="$HOME/nvim";

[ ! -d "$neovim_dir" ] && git clone --depth 1 https://github.com/neovim/neovim.git
[ ! -d "$neovim_install_dir" ] && mkdir $neovim_install_dir

cd $neovim_dir;

git fetch --tags && git fetch && git checkout master && git pull;

latest_tag=$(git tag | tail -1);

read -p "Found NVIM version $latest_tag are you sure you want to update now? (y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[yY]$ ]]
then
    echo "upgrading neovim... to $latest_tag";
    git checkout $latest_tag;

    # clean up
    rm -r build/
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$neovim_install_dir install
    nvim --version
else

    echo "Aborting upgrade";
    exit 0;
fi


cd $current_dir;
