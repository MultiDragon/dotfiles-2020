"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2020 Wizzerinus
"=============================================================================

set nocompatible
set hidden

" Load Dein
set runtimepath+=~/.config/nvim-dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim-dein')
	call dein#begin('~/.config/nvim-dein')
	call dein#add('~/.config/nvim-dein/repos/github.com/Shougo/dein.vim')

	" Autocompletion
	call dein#add('sirver/ultisnips')
	call dein#add('Shougo/deoplete.nvim')
		" call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
	call dein#add('tpope/vim-surround')
	call dein#add('tpope/vim-commentary')
	call dein#add('neomake/neomake')
	call dein#add('autozimu/languageclient-neovim', { 'rev': 'next', 'build': 'bash install.sh' })
	call dein#add('junegunn/fzf')

	" Working with FS, buffers, etc
	call dein#add('Shougo/defx.nvim')
		call dein#add('kristijanhusak/defx-git')
		call dein#add('kristijanhusak/defx-icons')
	call dein#add('Shougo/deol.nvim')
	call dein#add('vim-airline/vim-airline')
	call dein#add('moll/vim-bbye')
	call dein#add('airblade/vim-rooter')
	call dein#add('kien/ctrlp.vim')

	" Style
	call dein#add('ayu-theme/ayu-vim')

	" Improved search & highlighting
	call dein#add('luochen1990/rainbow')
	call dein#add('RRethy/vim-illuminate')
	call dein#add('wellle/context.vim')

	" Version Control
	call dein#add('tpope/vim-fugitive')
	call dein#add('sodapopcan/vim-twiggy')
	call dein#add('kristijanhusak/vim-create-pr')
	call dein#add('tpope/vim-dadbod')

	" Language Support
	call dein#add('vim-python/python-syntax', { 'on-ft': 'python' })
	call dein#add('deoplete-plugins/deoplete-jedi', { 'on-ft': 'python' })
	call dein#add('numirias/semshi', { 'on-ft': 'python' })
	call dein#add('lervag/vimtex', { 'on-ft': 'latex' })
	call dein#add('alvan/vim-php-manual', { 'on-ft': 'php' })
	call dein#add('lvht/phpcd.vim', { 'on-ft': 'php', 'build': 'composer install' })
	call dein#add('chikamichi/mediawiki.vim', { 'on-ft': 'mediawiki' })
	call dein#add('artur-shaik/vim-javacomplete2', { 'on-ft': 'java' })

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on

source ~/.config/nvim/parts/init.vim
" set runtimepath+=~/.config/nvim/discord.nvim

" Add RTP for project path
try
	source ~/Projects/.metadata/append.vim
catch /^Vim\%((\a\+)\)\=:E484/
endtry

syntax enable
