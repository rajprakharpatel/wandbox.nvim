if exists('g:loaded_wandbox') | finish | endif

" expose vim commands and interface here
" nnoremap <Plug>PlugCommand :lua require(...).plug_command()<CR>

let s:save_cpo = &cpo
set cpo&vim
let g:loaded_wandbox = 1
nnoremap <Plug>WandboxRun <cmd>lua require("wandbox").run()<CR>

command! -range=0 -nargs=* -complete=customlist,Complete_wandboxrun WandboxRun lua require('wandbox').run(<q-args>)

function Complete_wandboxrun(A,L,P) abort
	let LuaComplete_wandboxrun = luaeval('require("wandbox.util").complete_wandboxrun')
	return LuaComplete_wandboxrun(a:A,a:L,a:P)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
