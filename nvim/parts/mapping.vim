" Save file on russian keymap.
nnoremap Жц :w

" Mapleader operations.
let mapleader=','
nnoremap <leader>w :w<CR>
nnoremap <leader>q :Bdelete!<CR>
nnoremap <leader>m :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>

" Save file with Ctrl-S.
inoremap <C-S> <Esc>:w<CR>i

" Remove hlsearch on F3.
nnoremap <F3> :noh<CR>

" Moving to various windows.
nnoremap <silent> <S-Left>  <C-w><Left><C-w><Left>
nnoremap <silent> <S-Right> <C-w><Right><C-w><Right>
nnoremap <silent> <S-e>     <C-w><Left><C-w><Left><C-w><Right>

" Moving to other buffers with Tab.
nnoremap <silent>   <tab> :bnext!<CR>
nnoremap <silent> <s-tab> :bprevious!<CR>
nnoremap <silent> <a-tab> :tabnext<CR>
nnoremap <silent> <c-tab> :tabprevious<CR>

" Return to last position when changing buffers.
autocmd!
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
