
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

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gl :Glog<CR>:copen<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gb :Gblame<CR>

nmap [c :cprevious
nmap ]c :cnext
nmap [C :cfirst
nmap ]C :clast

autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


" vim: set sw=2 ts=2 :
