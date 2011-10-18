" File:         C596.vim
" Created:      2010 Mar 04
" Last Change:  2010 May 09
" Rev Days:     1
" Author:	Andy Wokula <anwoku@yahoo.de>

" :KeepView {cmd}
"
" wraps another command (= the argument) with
"   :let save_view = winsaveview()
"   :" command ...
"   :call winrestview(save_view)
"
" Goodies:
" - nesting is possible, restoring will only be done for the outer-most
"   invocation
" - handles error situations

com! -nargs=* -complete=command KeepView
    \ try| call s:SaveView()| exec <q-args>
    \| finally| call s:RestoreView()| endtry

if !exists("s:vist")
    let s:vist = {'depth': 0}
endif

func! s:SaveView()
    if s:vist.depth == 0
	let s:vist.view = winsaveview()
    endif
    let s:vist.depth += 1
endfunc

func! s:RestoreView()
    if s:vist.depth == 1
	call winrestview(s:vist.view)
	unlet s:vist.view
    endif
    let s:vist.depth -= 1
endfunc
