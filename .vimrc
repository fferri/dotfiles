set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" user-interface:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'

Plug 'ntpeters/vim-better-whitespace'

Plug 'majutsushi/tagbar'

Plug 'hecal3/vim-leader-guide'

" git:
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" misc:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'chrisbra/NrrwRgn'
Plug 'scrooloose/nerdcommenter'

" completion:
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'w0rp/ale'

" run :PluginInstall in vim, or vim +PluginInstall +qall from shell
" All of your Plugins must be added before the following line
call plug#end()

syntax on
filetype on
filetype plugin on
filetype indent on

let mapleader=","
nmap ; :

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set smarttab
set autoindent

set backspace=indent,eol,start

set number " line numbers
set foldcolumn=1 " Add a bit extra margin to the left

set mouse=a

"set clipboard=unnamed

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

set nobackup
set noswapfile

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

function! HasPaste()
    if &paste
        return '(paste)  '
    endif
    return ''
endfunction

set t_Co=256
set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
else
  "let g:solarized_termcolors=16
endif
let g:solarized_termtrans=1
colorscheme solarized
highlight Normal cterm=NONE ctermbg=NONE gui=NONE guibg=#232323 " darker bg

" line numbers style
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" sign column style
highlight SignColumn term=bold cterm=NONE ctermbg=NONE gui=NONE guibg=NONE

" Copy and paste
if has('clipboard') && !has('gui_running')
  vnoremap <C-c> "+y
  vnoremap <C-x> "+d
  vnoremap <C-v> "+p
  inoremap <C-v> <C-r><C-o>+
endif

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <C-n> :NERDTreeToggle<cr>
let g:nerdtree_tabs_open_on_gui_startup=2 " Open NERDTree on startup only if directory was given as startup argument
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_sync_cursorline = 1 " after open a file, if NERDTree is open, it will show that file in NERDTree window
let g:NERDTreeHighlightCursorline = 1 " configure NERDTree to always show the cursorline:

map <leader>t :TagbarToggle<cr>

map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>gp :Gpush<cr>
map <leader>gu :Gpull<cr>

let g:lmap = {}
let g:lmap.n = { 'name' : 'NERDtree' }
let g:lmap.t = { 'name' : 'TagBar' }
let g:lmap.g = { 'name' : 'Git' }
call leaderGuide#register_prefix_descriptions(",", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>

let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

let g:airline_theme='angr'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1

" jump to last position when reopening a file
"if has("autocmd")
"    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
" not needed with Plug 'farmergreg/vim-lastplace'

" iterm: change cursor shape in insert mode
let iterm_session_id=$ITERM_SESSION_ID
if iterm_session_id isnot# ''
    let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
    let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
endif
