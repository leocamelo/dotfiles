set number
set nowrap
set nojoinspaces
set colorcolumn=81

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set clipboard=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
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

let g:deoplete#enable_at_startup=1

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

nm <Up> :echo 'Press <k>!'<CR>
nm <Down> :echo 'Press <j>!'<CR>
nm <Left> :echo 'Press <h>!'<CR>
nm <Right> :echo 'Press <l>!'<CR>

nm <C-k> :NERDTreeToggle<CR>

nm <C-n> :enew<CR>
nm <C-q> :bp\|bd #<CR>
nm <C-h> :bp<CR>
nm <C-l> :bn<CR>

augroup NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END
