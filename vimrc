syntax enable
filetype plugin indent on

set nocompatible
set autoread
set autowriteall
set backspace=2
set wildmenu
set hidden

set number
set nowrap
set nojoinspaces
set colorcolumn=81
set cursorline

set laststatus=2
set noshowmode

set incsearch
set hlsearch
set ignorecase
set smartcase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smarttab
set autoindent
set smartindent

if has('persistent_undo')
  call system('mkdir -p ~/.vim/backups')
  set undodir=~/.vim/backups
  set undofile
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-dirvish'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'maralla/completor.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-endwise'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tbastos/vim-lua'
call plug#end()

set background=dark
colorscheme solarized
let g:solarized_termtrans=1

let g:lightline={'colorscheme':'solarized'}

let g:fzf_buffers_jump=1

let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1

let g:vim_json_syntax_conceal=0

nmap <Up> :echo 'Press <k>!'<CR>
nmap <Down> :echo 'Press <j>!'<CR>
nmap <Left> :echo 'Press <h>!'<CR>
nmap <Right> :echo 'Press <l>!'<CR>

nmap <CR><CR> :noh<CR>
nmap <C-k> :Dirvish<CR>

nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>

if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files --hidden'
  nmap <C-f> :Grepper -tool rg<CR>
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND='ag -l -g "" --hidden --no-color --ignore .git'
  nmap <C-f> :Grepper -tool ag<CR>
endif

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END
