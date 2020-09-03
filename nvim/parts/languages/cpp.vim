augroup CppMap
	autocmd!
	
	" Compile code and run it on F12 key.
	autocmd FileType cpp nnoremap <F12> :!g++ -g % -o %:r.out<CR>:split<CR>:term ./%:r.out<CR>:startinsert<CR>
	" Run previous compiled version on F11 key.
	autocmd FileType cpp nnoremap <F11> :split<CR>:term ./%:r.out<CR>:startinsert<CR>
augroup END
