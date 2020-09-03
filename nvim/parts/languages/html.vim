augroup HtmlMap
	autocmd!

	" Autocomplete HTML tags.
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd VimEnter,BufEnter *.html,*.php set autoindent
augroup END
