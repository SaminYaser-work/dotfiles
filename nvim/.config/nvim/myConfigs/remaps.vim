" Use CTRL-S for saving, also in Insert mode
    noremap <C-S> :update<CR>
    vnoremap <C-S> <C-C>:update<CR>
    inoremap <C-S> <C-O>:update<CR>

" Shortcutting split navigation, saving a keypress
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
    noremap <silent> <C-Left> :vertical resize +3<CR>
    noremap <silent> <C-Right> :vertical resize -3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
    map <Leader>th <C-w>t<C-w>H
    map <Leader>tv <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
    set fillchars+=vert:\

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	" map <leader>S :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader><leader>p :!opout <c-r>%<CR><CR>

" Navigate buffer with tab
    nnoremap <Tab> :bnext<CR>
    nnoremap <S-Tab> :bprevious<CR>

" AsyncRun terminal
    map <F9> :cd %:p:h<CR>:AsyncRun st -e ./%<<CR>

" Open Startify
    map <leader>S :Startify<CR>

" Use tab to navigate buffers in vimwiki
    nnoremap <C-n> :<Plug>VimwikiNextLink<CR>
    nnoremap <C-p> :<Plug>VimwikiPrevLink<CR>

" Vim surround shortcut
    map <leader>s ysiw

" Close buffer
    map <leader>x :bd<CR>

" Move highlighted text
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

" Search next/prev is centered
    nnoremap n nzzzv
    nnoremap N Nzzzv

" Cursor always stays in the middle
    " set so=999
    map j jzz
    map k kzz
    autocmd InsertEnter * norm zz

" Prettier format
    map <leader>p :PrettierAsync<CR>
