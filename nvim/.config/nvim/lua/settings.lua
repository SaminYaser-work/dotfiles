-- WIP

local o = vim.o
local bo = vim.bo
local wo = vim.wo

    o.title = true
    o.nohlsearch = true
    o.noshowmode = true
    o.noshowcmd = true
    o.noruler = true
    o.notimeout = true
    o.nocompatible = true
    o.syntax = true
    o.encoding = 'utf8'
    o.linebreak = true
    o.mouse = 'a'
    o.go = 'a'
    o.laststatus = 0

    wo.number = true
    wo.relativenumber = true
    wo.linebreak = true

-- Lazy redraw
    wo.lazyredraw = true

    o.tabstop = 4
    bo.tabstop = 4
    o.shiftwidth = 4
    bo.shiftwidth = 4
    o.softtabstop = 0
    bo.softtabstop = 0
    o.expandtab = true
    bo.expandtab = true
    o.smarttab = true


    set clipboard+=unnamedplus

-- Some basics:
	nnoremap c "_c
	filetype plugin on
-- Enable autocompletion:
	set wildmode=longest,list,full
-- Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

-- spell languages
    o.spelllang = 'en'
    bo.spelllang = 'en'
-- Spell-check set to <leader>o, 'o' for 'orthography':
	-- map <leader>o :setlocal spell! spelllang=en_us<CR>
-- Tab complete spellcheck
    -- set complete+=kspell

-- Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    o.splitbelow = true
    o.splitright = true

-- Disable unused plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
--    "spellfile_plugin",
--    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
