export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="leocamelo"

plugins=(git rails rvm)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias gf="g flow"
alias gr="g push && g push --tag && g co master && g push"

alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias sshconfig="$EDITOR ~/.ssh/config"

# alias bu="brew update && brew upgrade && brew cleanup"
# alias au="sudo apt update && sudo apt upgrade -y && sudo apt autoremove"

ssh-tmux () {
  ssh $1 -t -- /bin/bash -c 'tmux has && exec tmux attach || exec tmux'
}

clip () {
  cat $1 | xclip -sel clip
}
