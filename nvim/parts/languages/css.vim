augroup CssMap
	autocmd!

	" Compile main SCSS when a file is saved.
	" doesn't work atm
	" autocmd BufWritePost *.scss !eval 'node-sass --output-style compressed styles/scss/init.scss > styles/init.css'	
augroup END
