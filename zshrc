export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="leocamelo"

plugins=(git rails)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

alias gf="g flow"
alias gr="g push && g push --tag && g co master && g push"

alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias sshconfig="$EDITOR ~/.ssh/config"

up () {
  case "$(uname -s)" in
    Darwin)
      brew update
      brew upgrade
      brew cleanup
      ;;
    Linux)
      sudo apt update
      sudo apt upgrade -y
      sudo apt autoremove -y
      ;;
  esac
}

ssh-tmux () {
  ssh "$1" -t -- /bin/bash -c "tmux has && exec tmux attach || exec tmux"
}

clip () {
  xclip -sel clip "$1"
}

venv () {
  if [ ! -d venv ]; then
    python3 -m venv venv
  fi

  source venv/bin/activate
}

requirements () {
  pip install --upgrade pip

  for group in "-dev" ""; do
    if [ -f requirements${group}.txt ]; then
      pip install -r requirements${group}.txt
    fi
  done
}

epub () {
  pandoc -f epub -t html "$1" | elinks -dump -dump-color-mode 1 | less -R
}

eval "$(starship init zsh)"
