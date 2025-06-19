#!/bin/bash


git clone https://github.com/xdebug/vscode-php-debug.git ~/.local/apps/vscode-php-debug
cd ~/.local/apps/vscode-php-debug
npm install && npm run build
cd -

