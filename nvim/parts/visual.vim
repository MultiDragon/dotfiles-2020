" Concealment and code folding.
set conceallevel=2
set foldenable
set foldmethod=syntax

" Do not convert tabs to spaces, save with trailing newline, other code style.
set noexpandtab
set tabstop=4
set shiftwidth=4
set fixendofline

" Wild Menu, autocompletion of files.
set wildmenu
set wildignore=*.o,*.out,*.pyc,*.aux,*.pdf,*.log,*/.git/

" Show current line number.
set cursorline
set number relativenumber
set scrolloff=2

" Show matching brackets.
set showmatch

" Disable beep.
set noerrorbells novisualbell

" Wrap lines.
set wrap
set tw=135
set formatoptions-=t

" Set color scheme.
let ayucolor="dark"
set termguicolors
colorscheme ayu

" Show tab list.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" Automatic indentation.
set smartindent

" Ignore cases when searching.
set ignorecase
set smartcase

" Search next occasion when searching again.
set incsearch

" Regular Expressions.
set magic
