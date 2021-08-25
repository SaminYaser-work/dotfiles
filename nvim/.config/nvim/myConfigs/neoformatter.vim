" neoformatter
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_csharp = ['clangformat']


" Autoformat on save
augroup fmt
    autocmd!
    autocmd BufWritePre *.c,*.cpp,*.cs undojoin | Neoformat
augroup END

nnoremap <leader>p :Neoformat prettier<CR>
