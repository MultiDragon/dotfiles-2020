if !has("python3")
  finish
endif

function! mediawiker#StartMW()
  py3file ~/.config/nvim/parts/plugins/MWWrapper.py
endfunc

function! mediawiker#OpenMW(name)
  enew
  execute 'python3 mw_get_page("' . a:name . '")'
  execute 'file! ' . a:name
  set ro
  set filetype=mediawiki
endfunc

function! mediawiker#SaveMW(text)
  execute 'python3 mw_save_page("' . a:text . '")'
endfunc

command! -nargs=0 MWstart call mediawiker#StartMW()
command! -nargs=1 MWe call mediawiker#OpenMW(<f-args>)
command! -nargs=1 Mw call mediawiker#SaveMW(<f-args>)
