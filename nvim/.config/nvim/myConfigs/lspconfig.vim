" >> Lsp key bindings
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K         <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> g[        <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> g]        <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>\ <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga        <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga        <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs        <cmd>Lspsaga signature_help<CR>
" Tab Complete
inoremap <expr> <Tab>       pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>     pumvisible() ? "\<C-p>" : "\<S-Tab>"



""""""""""""""""""""""""""""""
""""" Telescope bindings """""
""""""""""""""""""""""""""""""

" Builtin functions
nnoremap <space>e <cmd>lua require'telescope.builtin'.builtin{}<CR>

" most recently used files
nnoremap <space>r <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap <space><Tab> <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <space>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <space>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <space>gf <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <space>f <cmd>lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <space>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" Registers
nnoremap <space>rr <cmd>lua require'telescope.builtin'.registers{}<CR>

" pick color scheme
nnoremap <space>c <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

" Pick man pages
nnoremap <space>m <cmd>lua require'telescope.builtin'.man_pages{}<CR>

" Spell suggestion
nnoremap <space>z <cmd>lua require'telescope.builtin'.spell_suggest{}<CR>
