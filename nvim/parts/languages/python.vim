augroup PythonMap
	autocmd!

	" Compile Python files in Sage.
	autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %
augroup END
