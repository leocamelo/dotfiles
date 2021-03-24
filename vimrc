syntax enable
filetype plugin indent on

set encoding=utf-8
set nocompatible
set autoread
set autowriteall
set backspace=2
set wildmenu
set hidden

set title
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
set gdefault

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smarttab
set autoindent
set smartindent

set updatetime=300
set shortmess+=c

set foldmethod=syntax
set foldlevel=99

set backupdir=~/.vim/backups
set directory=~/.vim/swaps

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

Plug 'elzr/vim-json',               {'for': 'json'}
Plug 'cespare/vim-toml',            {'for': 'toml'}
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'tpope/vim-rails',             {'for': 'ruby'}
Plug 'elixir-lang/vim-elixir',      {'for': 'elixir'}
Plug 'tbastos/vim-lua',             {'for': 'lua'}
Plug 'rust-lang/rust.vim',          {'for': 'rust'}
Plug 'tpope/vim-fireplace',         {'for': 'clojure'}
Plug 'luochen1990/rainbow',         {'for': 'clojure'}
Plug 'pangloss/vim-javascript',     {'for': 'javascript'}
Plug 'mxw/vim-jsx',                 {'for': 'javascript'}
Plug 'leafgarland/typescript-vim',  {'for': 'typescript'}
Plug 'peitalin/vim-jsx-typescript', {'for': 'typescript'}
call plug#end()

set background=dark
colorscheme gruvbox

let mapleader = ','

let g:lightline = {'colorscheme': 'gruvbox'}

let g:fzf_buffers_jump = 1

let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_elixir_credo_strict = 1

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-tabnine', 'coc-solargraph', 'coc-elixir',
                              \'coc-python', 'coc-rls', 'coc-tsserver']

let g:vim_json_syntax_conceal = 0

map <Up> :echo 'Press <k>!'<CR>
map <Down> :echo 'Press <j>!'<CR>
map <Left> :echo 'Press <h>!'<CR>
map <Right> :echo 'Press <l>!'<CR>

nmap <CR><CR> :noh<CR>
nmap <C-k> :NERDTreeToggle<CR>
nmap <space> za

nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --color never -g "!.git/"'
  nmap <C-f> :Grepper -tool rg<CR>
  nmap <C-h> :Grepper -tool rg -cword -noprompt<CR>
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --hidden --no-color --ignore .git'
  nmap <C-f> :Grepper -tool ag<CR>
  nmap <C-h> :Grepper -tool ag -cword -noprompt<CR>
endif

augroup NERDTree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  autocmd BufReadPost,FileReadPost * if &ft !=# 'qf' && exists('g:NERDTree') && g:NERDTree.IsOpen() | :NERDTreeClose | endif
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
augroup END

augroup RainbowParentheses
  autocmd!
  autocmd FileType clojure RainbowToggle
augroup END
