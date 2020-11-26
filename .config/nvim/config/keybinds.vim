" Key Bindings
" ============

" Builtin Vim stuff
set pastetoggle=<F2>
nnoremap <Leader>p <F2>

" FZF commands
nnoremap <Leader>. :GitFiles! --cached --others --exclude-standard<CR>
nnoremap <Leader>f :Files!<CR>
nnoremap <Leader>g :Rg!<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines!<CR>
nnoremap <Leader>c :Commands!<CR>
nnoremap <Leader>C :History:!<CR>
nnoremap <Leader>h :GV!<CR>
nnoremap <Leader>H :GV<CR>

" NERDTree
nnoremap <Leader>t :NERDTreeToggleVCS<CR>
nnoremap <Leader>T :NERDTreeFind<CR>
