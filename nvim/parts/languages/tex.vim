" Zathura Instance ID, used by F11 button
let @i=0

" Opens current document if Zathura is not opened,
" sends DBus signal to Zathura otherwise.
function ZathuraProc(zathura_id, filename)
	if a:zathura_id
		silent! execute '!dbus-send --type=method_call --dest=org.pwmt.zathura.PID-' . a:zathura_id . ' /org/pwmt/zathura org.pwmt.zathura.OpenDocument string:"' . a:filename . '.pdf" string:"" int32:0'
	else
		call jobstart('zathura ' . a:filename . '.pdf')
		let @i=trim(system("ps aux \| grep zathura \| grep -v grep \| awk '{print $2}\'"))
	endif
endfunction

function InkscapeVim(line)
	let str = join(getline(a:line, a:line), '\n')
	let q = trim(system("~/.custom/bin/inkscape-vim " . str))
	let ret = setline(a:line, q)
endfunction

" Some general things for Vimtex.
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'         " for forward-search
let g:tex_conceal='abdmg'                  " concealment
let g:vimtex_view_automatic=0              " don't open zathura when file is compiled
let g:vimtex_quickfix_enabled=0            " disable window at the bottom

augroup TexMap
	autocmd!
	
	" Compiles Tex file on F12 key.
	autocmd FileType tex nnoremap <F12> :w<CR>:VimtexCompile<CR>

	" Opens PDF file on F11 key.
	autocmd FileType tex nnoremap <F11> :call ZathuraProc(@i, expand('%:r'))<CR>
	" Closes it on F10 key.
	autocmd FileType tex nnoremap <F10> :execute '!kill ' . @i<CR>:let @i=0<CR><CR>
	" Spell Check. F1 key tries to fix the last mistake.
	autocmd FileType tex setlocal spell
	autocmd FileType tex inoremap <F1> <c-g>u<Esc>[s1z=`]a<c-g>u

	" Create Inkscape figure.
	autocmd FileType tex nnoremap <F8> :call InkscapeVim(line('.'))<CR>:w<CR>
	autocmd FileType tex let g:indentLine_setConceal = 0
augroup END
