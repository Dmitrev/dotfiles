export EDITOR="nvim"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/nvim/bin:$PATH
export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

# EBS install
export PYENV_ROOT="$HOME/deps/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
## END EBS install

## nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
## end nvm

starship --version &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(starship init zsh)"
fi

# login to development
alias src="source ~/.zshrc"

alias meg_dev="eb use MEG-Development-81"
alias meg_test="eb use MEG-Testing-81"
alias meg_demo="eb use MEG-Staging-81"
alias meg_prod="eb use MEG-Live-81"

alias ssh_dev="meg_dev && eb ssh"
alias ssh_test="meg_test && eb ssh"
alias ssh_demo="meg_demo && eb ssh"
alias ssh_prod="meg_prod && eb ssh"

# restart bluetooth
alias rbt="sudo /etc/init.d/bluetooth restart"

# reload bluetooth kernel module, in case when bluetooth won't turn on any more
# In most cases rbt is enough
alias rkbt="sudo modprobe -r btusb && sudo modprobe btusb"

## tmux shortcuts
alias meg="~/scripts/meg.sh" # old setup
alias megfeat="~/scripts/meg_feature.sh" # feature branch in new setup
alias megfrontend="~/scripts/meg_frontend.sh" # feature branch in new setup
alias megmysql="~/scripts/meg_mysql.sh" # feature branch in new setup
alias megpr="~/scripts/meg_pr.sh" # feature branch in new setup
alias dot="~/scripts/dot.sh"

## docker aliases
alias dockstop="docker container ls | awk '{print $$1 spnsorshipEntityName \" $$2}' | fzf | awk '{print $$1}' | xargs -I {} docker container stop" 

# zellij shortcuts
alias zj="zellij"
# alias meg="zellij attach meg || zellij -s meg --layout ~/.config/zellij/layouts/meg.kdl"
# alias dot="zellij attach dotfiles || zellij -s dotfiles --layout ~/.config/zellij/layouts/dotfiles.kdl"
# alias rust="zellij --layout ~/.config/zellij/layouts/rust.kdl"

# work shortcuts
alias jira="open https://mediaexchangegroup.atlassian.net/jira/software/projects/MEG/boards/1"

# nvim stuff
# LSP cache clear
alias lcc='rm ~/.local/state/nvim/lsp.log && echo "cleared LSP log"';

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
