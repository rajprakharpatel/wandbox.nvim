if exists('g:loaded_wandbox') | finish | endif

" expose vim commands and interface here
" nnoremap <Plug>PlugCommand :lua require(...).plug_command()<CR>

let s:save_cpo = &cpo
set cpo&vim

nnoremap <Plug>helloWorld <cmd>lua require("wandbox").helloWorld()<CR>

let g:loaded_wandbox = 1

let &cpo = s:save_cpo
unlet s:save_cpo
