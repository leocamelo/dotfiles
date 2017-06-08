# export PATH="$PATH"
export ZSH="~/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="leocamelo"

plugins=(git rails rvm sublime pow)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias gf="git flow"

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

alias bu="brew update && brew upgrade && brew cleanup"
alias au="sudo apt-get update && sudo apt-get upgrade -y"

alias android-build="cd android && ./gradew assembleRelease"
alias android-server="adb reverse tcp:8081 tcp:8081"
