local map = vim.keymap.set

-- change leader key to space
vim.g.mapleader = " "

-- change localleader key to \
vim.g.maplocalleader = "\\"

local nop = '<nop>'

-- arrows are unvimlike
map({ 'n', 'i' }, '<up>', nop, { desc = "Makes 'up' key do nothing" })
map({ 'n', 'i' }, '<down>', nop, { desc = "Makes 'down' key do nothing" })
map({ 'n', 'i' }, '<left>', nop, { desc = "Makes 'left' key do nothing" })
map({ 'n', 'i' }, '<right>', nop, { desc = "Makes 'right' key do nothing" })

-- change key for leaving insert mode to jk
map({ 'n', 'i' }, '<Esc>', nop, { desc = "Makes 'esc' key do nothing" })
map('i', 'jk', '<Esc>', { desc = 'Makes jk leave insert mode' })

-- spell
map('n', '<leader>f', '1z=', { desc = 'Gives spelling suggestion' })
map('n', '<leader>sc', function()
    vim.opt.spell = not vim.opt.spell:get()
end, { desc = 'Toggles spell on/off' })

-- tabs
map('n', '<leader>tt', function() vim.api.nvim_command('tabnew') end, { desc = 'Creates a new tab after the current one' })
map('n', '<leader>tp', function() vim.api.nvim_command('-tabnew') end, { desc = 'Creates a new tab before the current one' })
map('n', '<leader>tf', function() vim.api.nvim_command('0tabnew') end, { desc = 'Creates a new tab before the first one' })
map('n', '<leader>tl', function() vim.api.nvim_command('$tabnew') end, { desc = 'Creates a new tab after the last one' })
map('n', '<leader>n', function() vim.api.nvim_command('tabnext') end, { desc = 'Goes to next tab' })
map('n', '<leader>p', function() vim.api.nvim_command('tabprevious') end, { desc = 'Goes to previous tab' })

-- buffer
map('n', '<leader>bt', function() vim.api.nvim_command('enew') end, { desc = 'Creates a new buffer' })
map('n', '<leader>bn', function() vim.api.nvim_command('bn') end, { desc = 'Goes to next buffer' })
map('n', '<leader>bp', function() vim.api.nvim_command('bp') end, { desc = 'Goes to previous buffer' })
map('n', '<leader>bc', function() vim.api.nvim_command('bd') end, { desc = 'Closes current buffer' })

-- create splits
map('n', '<leader>ss', '<c-w>s', { desc = 'Creates horizontal split' })
map('n', '<leader>v', '<c-w>v', { desc = 'Creates vertical split' })

-- navigate splits
map('n', '<leader>h', '<c-w>h', { desc = 'Goes to split to the left of current one' })
map('n', '<leader>l', '<c-w>l', { desc = 'Goes to split to the right of current one' })
map('n', '<leader>k', '<c-w>k', { desc = 'Goes to split above the current one' })
map('n', '<leader>j', '<c-w>j', { desc = 'Goes to split below the current one' })

-- resize splits
map('n', '<leader>>', '<c-w>>', { desc = "Increases split's width" })
map('n', '<leader><', '<c-w><', { desc = "Decreases split's width" })
map('n', '<leader>+', '<c-w>+', { desc = "Increases split's height" })
map('n', '<leader>-', '<c-w>-', { desc = "Decreases split's height" });

-- open and source init.lua file
-- TODO not so useful... change it to maybe open folder ~/.config/nvim/lua
-- TODO see https://github.com/nvim-lua/plenary.nvim/blob/master/lua/plenary/reload.lua
map('n', '<leader>ev', function()
    vim.api.nvim_command('vsplit ' .. vim.env.MYVIMRC);
end, { desc = 'Opens init.lua in a new split' })
map('n', '<leader>sv', function()
    for name, _ in pairs(package.loaded) do
        package.loaded[name] = nil
    end
    vim.api.nvim_command('luafile ' .. vim.env.MYVIMRC);
    print('Sourced luafile.lua!')
end, { desc = 'Sources init.lua' })

-- folding
map('n', ',', 'za', { desc = 'Toggles folding' })
map('n', 'zO', 'zR', { desc = 'Opens all folds' })
map('n', 'zC', 'zM', { desc = 'Closes all folds' })
map('n', 'zc', 'zc', { desc = 'Closes current fold' })
map('n', 'zf', 'mzzMzvzz', { desc = 'Closes all folds except the current one' })

-- terminal mode
-- TODO needs improvements
map('t', 'jk', "<c-\\><c-n>", { desc = 'Exits terminal mode' })
map('n', '<leader>ot', function() vim.api.nvim_command('edit term://fish') end, { desc = 'Opens terminal in current window' })

-- wow very magic search
map('n', '/', '/\\v', { desc = 'wow so much magic search' })
