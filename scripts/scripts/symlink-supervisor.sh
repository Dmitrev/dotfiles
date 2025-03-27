#!/bin/bash

confdir="/home/dmitri/supervisor"
fd . "$confdir" --type f --extension conf | xargs basename | while read -r filename; do
    symlink="/etc/supervisor/conf.d/$filename"
    target="$confdir/$filename"

    if [ -L "$symlink" ]; then
        echo "link already exists: $symlink"
    else
        sudo ln -s "$target" "$symlink"
        echo "created symlink: $symlink -> $target"
    fi
done


# reload supervisor
sudo supervisorctl reread
sudo supervisorctl reload


