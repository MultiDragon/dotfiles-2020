augroup JavaMap
	autocmd!
	
	" Compiles Java file on F12 key.
	autocmd FileType java nnoremap <F12> :w<CR>:call jobstart("bash -c 'cd lib && ./compile.sh'")<CR>

	" Opens Jar on F11 key.
	autocmd FileType java nnoremap <F11> :call system("~/.custom/bin/jar-vim")<CR>

	" Use JavaComplete
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
