"""
"""
" Author:  Ayush Garg
" Date:    09-10-2021
" Version: 0.1
"""
"""
 
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'preservim/nerdtree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'arcticicestudio/nord-vim'
    "Plug 'morhetz/gruvbox'
    Plug 'mhartington/oceanic-next'
    Plug 'christoomey/vim-tmux-navigator'
    "Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    " fuzzy find files
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'tmhedberg/SimpylFold'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    "yaml folds 
    Plug 'pedrohdz/vim-yaml-folds'

    "To see undo history
    Plug 'mbbill/undotree'

    "Language parser tool for better syntax highlighting, folds
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "git integration
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'

    "ale aysnc linting
    Plug 'dense-analysis/ale'

    " Remove un-used imports and variables
    Plug 'tell-k/vim-autoflake'

    " fuzzy search in project/folder
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Vim plugin that makes it so easy to have tags.
    Plug 'ludovicchabant/vim-gutentags'

    " Vim plugin for working with python virtualenvs
    Plug 'jmcantrell/vim-virtualenv'

    " This plugin provides a start screen for Vim and Neovim.
    Plug 'mhinz/vim-startify'

    " Auto Complete for several languages
    Plug 'Valloric/YouCompleteMe'

    " Javascript specific pluging

    " Another javascript syntax
    Plug 'othree/yajs.vim'

    " The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
    Plug 'maxmellon/vim-jsx-pretty'

    " PHP Specific plugins
    Plug 'StanAngeloff/php.vim'

    " This one will automatically format your code whenever you want
    Plug 'stephpy/vim-php-cs-fixer'

    "Tools for refactoring and correctly formatting your code
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

    " PHP Refactoring Toolbox for VIM
    Plug 'adoy/vim-php-refactoring-toolbox'

    call plug#end()


" Other configuration

" Map caps lock to escape when enterin vim
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

" Back to normal i.e capslock mapping to capslock when leaving vim
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


filetype plugin on
filetype plugin indent on

autocmd BufRead,BufNewFile *.py                     setfiletype python
autocmd BufRead,BufNewFile *.php                    setfiletype php
autocmd BufRead,BufNewFile *.js *.jsx               setfiletype javascript


let g:gutentags_ctags_exclude = ['*.css', '*.html']
let g:gutentags_cache_dir = '~/.config/nvim/gutentags'

syntax on

set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set relativenumber
set title
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=50

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


"map <silent> <leader>jd :CtrlPTag<cr><c-\>w
nmap gd :YcmCompleter GoToDefinition<CR>
"
"
"
"" Disable Arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>
noremap! <Up> <Nop>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
noremap <C-l> <C-w>l
colorscheme OceanicNext
"colorscheme nord
set termguicolors
let mapleader=" "
let NERDTreeShowHidden=1
nnoremap <Leader>m :NERDTreeToggle<cr>
nmap <Leader>[ :bp!<cr>
nmap <Leader>] :bn!<cr>
nmap <Leader>x :bd<cr>

nmap <Leader>gl :diffget //3<cr>
nmap <Leader>gh :diffget //2<cr>
nmap <Leader>gs :G<cr><c-w>T

nmap <Leader>N :tabnew<cr>
nmap <Leader>n :tabnext<cr>
nmap <Leader>b :tabprevious<cr>

nmap <Leader>u :UndotreeToggle<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>p :buff#<CR>


nnoremap <F5> :buffers<CR>:buffer<Space>

inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:airline#extensions#branch#enabled = 1

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" read the file as soon as it changes on the disk.
set autoread

au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()

" Enable folding
set foldmethod=indent
set foldlevel=99
"filetype plugin indent on

" Enable folding with the spacebar
nnoremap <space> za

