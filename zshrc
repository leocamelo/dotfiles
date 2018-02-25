# export PATH="$PATH"
export ZSH="~/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="leocamelo"

plugins=(git rails rvm sublime)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias gf="g flow"
alias gr="g push && g push --tag && g co master && g push"

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias sshconfig="vim ~/.ssh/config"

# alias bu="brew update && brew upgrade && brew cleanup"
# alias au="sudo apt update && sudo apt upgrade -y --allow-unauthenticated && sudo apt autoremove"

alias rn="react-native"
alias rn-android-build="cd android && ./gradew assembleRelease"
alias rn-android-server="adb reverse tcp:8081 tcp:8081"

alias resque="QUEUE=* rake resque:work"

ssh-tmux () {
  ssh $1 -t -- /bin/bash -c 'tmux has && exec tmux attach || exec tmux'
}
