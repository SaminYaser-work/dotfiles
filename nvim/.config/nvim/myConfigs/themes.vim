" Themes
set termguicolors
" set bg=dark
" source $HOME/.config/nvim/themes/onedark.vim
" source $HOME/.config/nvim/themes/codedark.vim
" colorscheme gruvbox

lua <<EOF
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox8]])
EOF

" set cursorline
" set cursorcolumn
" highlight CursorLine ctermbg=#BDC3C7 cterm=bold guibg=#2b2b2b
" highlight CursorColumn ctermbg=#BDC3C7 cterm=bold guibg=#2b2b2b

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
" if &diff
"     highlight! link DiffText MatchParen
" endif
