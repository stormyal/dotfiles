vim.g.mapleader = ' '
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', builtin.find_files)
vim.keymap.set('n', '<leader><s-o>', ':Oil<CR>')
vim.keymap.set('n', '<leader>f', function()
  builtin.grep_string{
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  }
end)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>h', builtin.help_tags)

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

vim.keymap.set('n', '<leader>ez', ':e ~/.zshrc<CR>')
vim.keymap.set('n', '<leader>ee', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>es', ':e ~/.config/nvim/lua/config/settings.lua<CR>')
vim.keymap.set('n', '<leader>ek', ':e ~/.config/nvim/lua/config/keybinds.lua<CR>')
vim.keymap.set('n', '<leader>ep', ':e ~/.config/nvim/lua/config/lazy.lua<CR>')

vim.keymap.set('n', '<leader>ec', ':e ~/code<CR>')
vim.keymap.set('n', '<leader>en', ':e ~/notes<CR>')
vim.keymap.set('n', '<leader>e?', ':e ~/notes/code/vim_cheatsheet.md<CR>')

vim.keymap.set('n', '<leader>t', ':Neotree right toggle<CR>')
