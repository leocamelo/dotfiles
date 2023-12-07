export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="leocamelo"

plugins=(asdf git rails)

source $ZSH/oh-my-zsh.sh

export EDITOR="lvim"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

alias open="xdg-open"

alias e="$EDITOR"
alias zshconfig="e ~/.zshrc"
alias vimconfig="e ~/.vimrc"
alias sshconfig="e ~/.ssh/config"

alias lvimconfig="e ~/.config/lvim/config.lua"

alias docker-compose="podman-compose"
alias docker-compose-dev="docker-compose -f docker-compose-dev.yml"

gfr () {
  g co master
  g pull
  g merge develop
  g tag "$1"
  g push --follow-tags
}

up () {
  sudo dnf upgrade -y
  sudo dnf autoremove -y
  flatpak uninstall --unused
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

nvidia-run () {
  DRI_PRIME=1 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
}

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
