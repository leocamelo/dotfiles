export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="leocamelo"

plugins=(asdf git rails)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

alias e="$EDITOR"
alias zshconfig="e ~/.zshrc"
alias vimconfig="e ~/.vimrc"
alias sshconfig="e ~/.ssh/config"

alias docker="podman"
alias docker-compose="podman-compose"
alias docker-compose-dev="docker-compose -f docker-compose-dev.yml"

gfr () {
  g co master
  g pull
  g merge develop
  g tag "$1"
  g push
  g push --tags
  g co develop
}

up () {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update
    brew upgrade
    brew cleanup
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo dnf upgrade -y
    sudo dnf autoremove -y
    flatpak uninstall --unused
    flatpak update -y
  fi
}

clip () {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cat "$@" | pbcopy
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xclip -sel clip "$@"
  fi
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

nvrun () {
  DRI_PRIME=1 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
}

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
