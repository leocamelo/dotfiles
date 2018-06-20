syntax enable
filetype plugin indent on

set nocompatible
set autoindent
set autoread
set backspace=2
set wildmenu

set number
set nowrap
set nojoinspaces
set colorcolumn=81
set cursorline

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maralla/completor.vim'
Plug 'yggdroot/indentline'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'elzr/vim-json'
Plug 'mhinz/vim-grepper'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

if executable('ag')
  set grepprg=ag\ --vimgrep

  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0

  nm <C-f> :Grepper -tool ag<CR>
endif

set background=dark
colorscheme solarized

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let g:vim_json_syntax_conceal=0

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

nm <Up> :echo 'Press <k>!'<CR>
nm <Down> :echo 'Press <j>!'<CR>
nm <Left> :echo 'Press <h>!'<CR>
nm <Right> :echo 'Press <l>!'<CR>

nm <C-k> :NERDTreeToggle<CR>

nm <C-n> :enew<CR>
nm <C-j> :call CloseBuffer()<CR>
nm <C-h> :bp<CR>
nm <C-l> :bn<CR>

function CloseBuffer()
  let bufs = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  if len(bufs) == 1 | bd | else | bp | bd # | endif
endfunction

augroup NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd bufenter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
augroup END
