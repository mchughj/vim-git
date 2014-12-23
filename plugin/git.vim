"
" Plugin for integration with git
"
" Maintainer: Jason McHugh <mchughj@fb.com>
" Created: 2013 Oct 16

" See the doc file for information about this file.

" ----------------------------------------------------------------
" Maps
" ----------------------------------------------------------------
nmap <Leader>ge :edit ~/.vim/bundle/vim-git/plugin/git.vim<CR>
nmap <Leader>gE :new ~/.vim/bundle/vim-git/plugin/git.vim<CR>
nmap <Leader>gh :help git<CR>

nmap <Leader>gs :Gstatus<CR>:only<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gL :only<cr>Glog -- %<CR>:copen<CR>
nmap <Leader>gl :only<cr>Glog<CR>:copen 4<CR>
nmap <Leader>gc :call <SID>GitCommitWithConfirm("")<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gn :Gedit<CR>
nmap <Leader>ga :call <SID>GitCommitWithConfirm("--amend")<CR>
nmap <Leader>gA :call <SID>GitCommitWithConfirm("--amend --reuse-message=HEAD")<CR>
nmap <Leader>gq :call <SID>CleanUpWindows()<CR>
nmap <Leader>gi :call <SID>ShowChangesetForHead(1)<CR>

nmap [c :cprevious<CR>
nmap ]c :cnext<CR>
nmap [C :cfirst<CR>
nmap ]C :clast<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

function! <SID>CleanUpWindows()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
        \ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
    echom "Not in diff view."
    return
  endif

  windo diffoff

  " close current buffer if alternate is not fugitive but current one is
  if bufname('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'
    if bufwinnr("#") == -1
      b #
      bd #
    else
      bd
    endif
  else
    bd #
  endif
  :Gedit
endfunction

  
function! <SID>ShowChangesetForHead( maximize )
  exec ":Git! log --stat -n 1"
  if a:maximize == 0
    exec ":resize 20"
  else
    exec ":resize"
  endif
endfunction


function! <SID>GitCommitWithConfirm( commitParams )
  if confirm( "Do commit with parameters: " . a:commitParams, "No\nYes") != 1
    exec ":Gcommit ". a:commitParams
  endif
endfunction

" vim: set sw=2 ts=2 :
