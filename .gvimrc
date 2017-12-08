set guifont=Meslo_LG_M_Regular_for_Powerline:h14

" show toolbar
set guioptions+=T

" make sure split panes do not cause any additional scrollbar to show
" (that would cause an annoying change of window size)
set guioptions-=L
set guioptions-=R

" iterm-like split like in iterm:
"nnoremap <silent> <D-d> :vsp<CR>:wincmd l<CR>
"nnoremap <silent> <D-D> :sp<CR>:wincmd j<CR>
"inoremap <silent> <D-d> <C-o>:vsp<CR><C-o>:wincmd l<CR>
"inoremap <silent> <D-D> <C-o>:sp<CR><C-o>:wincmd j<CR>
set splitright
set splitbelow
nnoremap <silent> <D-d> :vnew<CR>:wincmd l<CR>
nnoremap <silent> <D-D> :new<CR>:wincmd j<CR>
inoremap <silent> <D-d> <C-o>:vnew<CR><C-o>:wincmd l<CR>
inoremap <silent> <D-D> <C-o>:new<CR><C-o>:wincmd j<CR>

" iterm-like split navigation
nnoremap <silent> <A-D-Up> :wincmd k<CR>
nnoremap <silent> <A-D-Down> :wincmd j<CR>
nnoremap <silent> <A-D-Left> :wincmd h<CR>
nnoremap <silent> <A-D-Right> :wincmd l<CR>
inoremap <silent> <A-D-Up> <C-o>:wincmd k<CR>
inoremap <silent> <A-D-Down> <C-o>:wincmd j<CR>
inoremap <silent> <A-D-Left> <C-o>:wincmd h<CR>
inoremap <silent> <A-D-Right> <C-o>:wincmd l<CR>

" iterm-like tab navigation
nmap <silent> <D-Right> :tabnext<CR>
nmap <silent> <D-Left> :tabprev<CR>
imap <silent> <D-Right> <C-o>:tabnext<CR>
imap <silent> <D-Left> <C-o>:tabprev<CR>
nmap <silent> <C-Tab> :tabnext<CR>
nmap <silent> <C-S-Tab> :tabprev<CR>
imap <silent> <C-Tab> <C-o>:tabnext<CR>
imap <silent> <C-S-Tab> <C-o>:tabprev<CR>
nnoremap <silent> <D-1> :tabn 1<CR>
nnoremap <silent> <D-2> :tabn 2<CR>
nnoremap <silent> <D-3> :tabn 3<CR>
nnoremap <silent> <D-4> :tabn 4<CR>
nnoremap <silent> <D-5> :tabn 5<CR>
nnoremap <silent> <D-6> :tabn 6<CR>
nnoremap <silent> <D-7> :tabn 7<CR>
nnoremap <silent> <D-8> :tabn 8<CR>
nnoremap <silent> <D-9> :tabn 9<CR>
inoremap <silent> <D-1> <C-o>:tabn 1<CR>
inoremap <silent> <D-2> <C-o>:tabn 2<CR>
inoremap <silent> <D-3> <C-o>:tabn 3<CR>
inoremap <silent> <D-4> <C-o>:tabn 4<CR>
inoremap <silent> <D-5> <C-o>:tabn 5<CR>
inoremap <silent> <D-6> <C-o>:tabn 6<CR>
inoremap <silent> <D-7> <C-o>:tabn 7<CR>
inoremap <silent> <D-8> <C-o>:tabn 8<CR>
inoremap <silent> <D-9> <C-o>:tabn 9<CR>

