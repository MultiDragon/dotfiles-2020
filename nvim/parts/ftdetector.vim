augroup ftdetector
	autocmd!
	" autocmd BufNewFile,BufRead *.vim setfiletype vim
	" autocmd BufNewFile,BufRead *.php setfiletype php
	" autocmd BufNewFile,BufRead *.js setfiletype javascript
	autocmd BufNewFile,BufRead *.tex,*.sty setfiletype tex
	autocmd BufNewFile,BufRead *.py,*.pyx,*.sage,*.spyx setfiletype python
	autocmd BufNewFile,BufRead *.html,*.ejs setfiletype html
	" autocmd BufNewFile,BufRead *.css setfiletype css
	" autocmd BufNewFile,BufRead *.java setfiletype java
	" autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.cxx setfiletype cpp
	autocmd BufNewFile,BufRead *.snippets setfiletype snippets
	autocmd BufNewFile,BufRead *.md setfiletype markdown
	autocmd BufNewFile,BufRead *.yaml setfiletype yaml
	autocmd BufNewFile,BufRead COMMIT_EDITMSG setfiletype gitcommit
	autocmd BufNewFile,BufRead *.rasi setfiletype css
	autocmd BufNewFile,BufRead .luacheckrc setfiletype lua

	autocmd BufNewFile,BufRead * call ftdetector#TestFileType()
augroup END

function ftdetector#TestFileType()
	if getline(1) =~ '^#!.*python$'
		setfiletype python
	elseif getline(1) =~ '^#!.*sh$'
		setfiletype sh
	endif
endfunction
