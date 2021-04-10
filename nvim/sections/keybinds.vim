" Kee Bindings
" ============

" FZF commands
" ------------
" Git Files
nnoremap <Leader>. :GitFiles! --cached --others --exclude-standard<CR>
" Relative Files
nnoremap <Leader>f :Files!<CR>
" Ripgrep
nnoremap <Leader>g :Rg!<CR>
" Command All
nnoremap <Leader>ca :Commands!<CR>
" Command History
nnoremap <Leader>ch :History:!<CR>
" History File
nnoremap <Leader>hf :GV!<CR>
" History All
nnoremap <Leader>ha :GV<CR>

" Fern
" ----

noremap <Leader>t :Fern . -drawer -toggle -reveal=% -width=35<CR>

" Terminal
" --------
nnoremap <Leader>tr :terminal<CR>
" Map Esc to terminal's Esc
au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
au FileType fzf tunmap <buffer> <Esc>

" Wiki
" ----
nnoremap ]w :WikiLinkNext<CR>
nnoremap [w :WikiLinkPrev<CR>

" Spellcheck
" ----------
" Bind <C-w> to automatically correct the previous word in insert & normal mode.
inoremap <C-w> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-w> i<c-g>u<Esc>[s1z=`]a<c-g>u<Esc>

" Lightline
" ---------
" Manage buffers via lightline.

" Switch to buffer.
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Delete buffer.
nmap <Leader>d1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>d2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>d3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>d4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>d5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>d6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>d7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>d8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>d9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>d0 <Plug>lightline#bufferline#delete(10)

" Quickfix
" --------

function! OpenQuickfixList()
  if empty(getqflist())
    return
  endif

  let s:prev_val = ""
  for d in getqflist()
      let s:curr_val = bufname(d.bufnr)
      if (s:curr_val != s:prev_val)
          "echo s:curr_val
          exec "edit " . s:curr_val
      end
      let s:prev_val = s:curr_val
  endfor
endfunction

" Open All
nmap <Leader>ea :call OpenQuickfixList()<CR>
