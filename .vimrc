set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'davidhalter/jedi-vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'

" run :PluginInstall in vim, or vim +PluginInstall +qall from shell

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax on
filetype on
filetype plugin on
filetype indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set smarttab
set autoindent

set backspace=indent,eol,start

set mouse=a

set ignorecase
set smartcase
set incsearch
set hlsearch

set showmatch " show matching brackets

set ruler
set showmode
set showcmd " show what you are typing as a command

set nocompatible " vim, not vi

set scrolloff=5 " keep at least 5 lines above/below

set modelines=1

set t_Co=256
set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif
let g:solarized_termtrans=1
colorscheme solarized
highlight Normal cterm=NONE ctermbg=NONE gui=NONE guibg=#232323 " darker bg

" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Open NERDTree on gvim/macvim startup. (default: 1)
" (When set to 2, open only if directory was given as startup argument).
let g:nerdtree_tabs_open_on_gui_startup=2

" Open NERDTree on console vim startup. (default: 0)
" (When set to 2, open only if directory was given as startup argument).
let g:nerdtree_tabs_open_on_console_startup=2

let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1

" jump to last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" iterm: change cursor shape in insert mode
let iterm_session_id=$ITERM_SESSION_ID
if iterm_session_id isnot# ''
    let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
    let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
endif
