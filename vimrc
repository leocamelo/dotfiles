set nocompatible
filetype off

set number
set nowrap
set showcmd
set incsearch
set backspace=2
set laststatus=2
set colorcolumn=80

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

let NERDTreeShowHidden=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
