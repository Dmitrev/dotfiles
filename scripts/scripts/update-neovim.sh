#!/bin/bash

current_dir=$(pwd);
neovim_dir="$HOME/neovim";

cd $neovim_dir;

git fetch --tags && git fetch && git checkout master && git pull;

latest_tag=$(git tag | tail -1);

read -p "Found NVIM version $latest_tag are you sure you want to update now? (y/n)" -n 1 -r
echo

if [[ $REPLY =~ ^[yY]$ ]]
then
    echo "upgrading neovim... to $latest_tag";
else

    echo "Aborting upgrade";
    exit 0;
fi


cd $current_dir;