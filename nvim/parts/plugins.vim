" DeFX
augroup NERD
	autocmd!
	autocmd VimEnter * call plugins#DefxStart()
	autocmd FileType defx call plugins#DefxSettings()
augroup END

function plugins#DefxStart()
	Defx -split=vertical -direction=botright -columns=git:indent:indent:icons:filename -winwidth=40
endfunction

function plugins#DefxOpen(context)
	execute "normal \<C-w>w"
	execute "edit " . a:context.targets[0]
endfunction

function plugins#OpenClose()
	if defx#is_directory()
		call defx#call_action('open_or_close_tree')
	else
		call defx#call_action('call', 'plugins#DefxOpen')
	endif
endfunction

function plugins#DefxSettings()
	nnoremap <silent> <CR> :call plugins#OpenClose()<CR>
	nnoremap <silent> n :call defx#call_action('new_file')<CR>
	nnoremap <silent> dq :call defx#call_action('remove')<CR>
	nnoremap <silent> R :call defx#redraw()<CR>
	nnoremap <silent> m :call defx#call_action('rename')<CR>
endfunction

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_sources', { '_': ['around', 'buffer', 'file', 'member'] })

" UltiSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = "/home/wizzerinus/.config/nvim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"

" Rooter
let g:rooter_patterns = ['info.yaml', '.git/']
let g:rooter_change_directory_for_non_project_files = 'current'

" CtrlP
let g:ctrlp_working_path_mode = 0

" VimDiscord
let g:discord_fts_blacklist = ['help', 'defx']

" Neomake
augroup AUTOCOMP
	autocmd!
	autocmd BufRead,BufWrite,BufNewFile * Neomake
augroup END

" Language Server
let g:LanguageClient_serverCommands = {
	\ 'javascript': ['/home/wizzerinus/.nvm/versions/node/v12.10.0/bin/javascript-typescript-stdio'],
	\ }
nnoremap <F6> :call LanguageClient_contextMenu()<CR>

