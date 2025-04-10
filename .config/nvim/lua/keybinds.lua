vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>ee', ":e ~/.config/nvim/init.lua<cr>")
vim.keymap.set('n', '<leader>es', ":e ~/.config/nvim/lua/settings.lua<cr>")
vim.keymap.set('n', '<leader>ek', ":e ~/.config/nvim/lua/keybinds.lua<cr>")
vim.keymap.set('n', '<leader>ep', ":e ~/.config/nvim/lua/plugins/<cr>")
vim.keymap.set('n', '<leader>et', ":e ~/.config/nvim/lua/plugins/colorscheme.lua<cr>")
vim.keymap.set('n', '<leader>el', ":e ~/.config/nvim/lua/config/lazy.lua<cr>")
vim.keymap.set('n', '<leader>en', ":e ~/notes/v/<cr>")

vim.keymap.set('n', '<leader>l', ":Lazy<cr>")
vim.keymap.set('n', '<leader>/', ":Oil<cr>")
vim.keymap.set('n', "<leader>t", ":Neotree toggle right<cr>")
vim.keymap.set('n', '<leader>f', ":FzfLua live_grep<cr>")
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")

-- split panes
vim.keymap.set('n', '<c-/>', ':split<CR>', { silent = true })
vim.keymap.set('n', '<c-\'>', ':vsplit<CR>', { silent = true })

-- window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- < and > to navigate buffers 
vim.keymap.set('n', '<c-,>', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-.>', ':bnext<CR>', { noremap = true, silent = true })

-- when yanking, copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

-- change current directory to current file
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- window resize mode
-- require("submode").create("WindowResize", {
--     mode = "n",
--     enter = "<leader>W",
--     leave = { "q", "<esc>" },
--     default = function(register)
--         register("h", "
