set number
set nowrap
set nojoinspaces
set colorcolumn=80

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set mouse=a
set clipboard=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'roxma/nvim-completion-manager'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
call plug#end()

if has('termguicolors')
  set termguicolors
endif

if executable('ag')
  set grepprg=ag\ --vimgrep
  let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching=0
endif

colorscheme OceanicNext

let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let NERDTreeShowHidden=1

nm <C-k> :NERDTreeToggle<CR>

nm <C-h> :bp<CR>
nm <C-l> :bn<CR>
