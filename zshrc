export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="leocamelo"

plugins=(git rails)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

alias gf="g flow"

alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias sshconfig="$EDITOR ~/.ssh/config"

gfr () {
  g co master
  g pull

  gf release start "$1"
  gf release finish "$1"

  g push
  g push --tag

  g co master
  g push
}

up () {
  sudo dnf upgrade -y
  sudo dnf autoremove -y
  flatpak update -y
}

ssh-tmux () {
  ssh "$1" -t -- /bin/bash -c "tmux has && exec tmux attach || exec tmux"
}

clip () {
  xclip -sel clip "$@"
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

docker-compose-dev () {
  docker-compose -f docker-compose-dev.yml "$@"
}

eval "$(starship init zsh)"
