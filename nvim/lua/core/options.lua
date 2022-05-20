local opt = vim.opt

shell = vim.opt.shell:get()
if shell:sub(-#"fish") == "fish" then
    vim.opt.shell = 'sh'
end

-- don't make a backup before overwriting a file
opt.backup = false
opt.writebackup = false

-- keep sawp files in one location
opt.directory = { vim.env.HOME .. '/.config/nvim/tmp//', '.' }

-- undo (set undo folder, file, and level)
opt.undofile = true
opt.undodir = { vim.env.HOME .. '/.config/nvim/undodir'}
opt.undolevels = 2000
opt.undoreload = 20000

-- do not highlight all search results
opt.hlsearch = false

-- start highlight of search while typing
opt.incsearch = true

-- case-insensitive searching
opt.ignorecase = true

-- bcase-sensitive if expression contains a capital letter
opt.smartcase = true

-- disable mouse
opt.mouse = ''

-- make vimbuffer the same as your computer
opt.clipboard = 'unnamedplus'

-- display incomplete commands
opt.showcmd = true

-- intuitive backspacing
opt.backspace = {'indent', 'eol', 'start'}

-- show hybrid line number
opt.number = true
opt.relativenumber = true

-- set size of width of column where number line appears
opt.numberwidth = 2

-- highlight text line of the cursor
-- opt.cursorline = true

-- set tab and shift, and convert tab to space
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- handle multiple buffers better
opt.hidden = true

-- enhanced command line completion
opt.wildmenu = true

-- highlight ruler at column 80
opt.colorcolumn = '80'

-- turn off line wrapping
opt.wrap = false

-- show 5 lines of context around the cursor
opt.scrolloff = 5

-- set the terminal's title
opt.title = true

-- set terminal's title to filename
opt.titlestring = '%t'

-- set spell options
opt.spell = false
opt.spelllang = 'en_us'

-- enable true colors support
opt.termguicolors = true

-- set background to dark
opt.background = 'dark'

-- folding
opt.foldlevelstart = 50
opt.foldmethod = 'indent'

