augroup PythonMap
	autocmd!
	autocmd FileType javascript nnoremap <F2> :%!js-beautify -t<CR>:w<CR>
augroup END
