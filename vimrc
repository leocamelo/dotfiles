syntax enable
filetype plugin indent on

set nocompatible
set autoread
set backspace=2
set wildmenu

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
set shiftround
set expandtab
set autoindent
set smartindent

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'maralla/completor.vim'
Plug 'editorconfig/editorconfig-vim'
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

let g:lightline={'colorscheme':'solarized'}

let g:vim_json_syntax_conceal=0

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.swp$']

let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1

nm <Up> :echo 'Press <k>!'<CR>
nm <Down> :echo 'Press <j>!'<CR>
nm <Left> :echo 'Press <h>!'<CR>
nm <Right> :echo 'Press <l>!'<CR>

nm <C-k> :NERDTreeToggle<CR>
nm <C-h> :noh<CR>
nm <C-p> :FZF<CR>

if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files --hidden'
  nm <C-f> :Rg<space>
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND='ag -l --hidden'
  nm <C-f> :Ag<space>
endif

augroup NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd bufenter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
augroup END
