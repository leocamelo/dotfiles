export PATH="$PATH:~/.rvm/bin"

export ZSH="~/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="leocamelo"

plugins=(git rails rvm sublime)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

# Setup RVM
# [[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

# Setup NVM
# export NVM_DIR="~/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
