vim.g.mapleader = ' '
-- local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>r', ':GrugFar<CR>')
vim.keymap.set('n', '<leader>R', ":lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%'), search = vim.fn.expand('<cword>') } })<CR>")
-- vim.keymap.set('n', '<leader>o', builtin.find_files)
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")
vim.keymap.set('n', '<leader><s-o>', ":lua require('oil').open()<cr>")
-- vim.keymap.set('n', '<leader>f', function()
--   builtin.grep_string{
--     path_display = { 'smart' },
--     only_sort_text = true,
--     word_match = "-w",
--     search = '',
--   }
-- end)
vim.keymap.set('n', '<leader>f', ":FzfLua live_grep<cr>")
vim.keymap.set('n', '<leader>F', ":FzfLua grep_cword<cr>")
vim.keymap.set('n', '<leader>f', ":lua require('fzf-lua').grep_project()<cr>")
vim.keymap.set('n', '<leader>b', "FzfLua buffers<cr>")
vim.keymap.set('n', '<leader>h', "FzfLua helptags<cr>")

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

vim.keymap.set('n', '<leader>ez', ':e ~/.zshrc<CR>')
vim.keymap.set('n', '<leader>ee', ':e ~/.config/nvim/init.lua<CR>')
-- vim.keymap.set('n', '<leader>es', ':e ~/.config/nvim/lua/config/settings.lua<CR>')
vim.keymap.set('n', '<leader>ek', ':e ~/.config/nvim/lua/config/keybinds.lua<CR>')
vim.keymap.set('n', '<leader>ep', ':e ~/.config/nvim/lua/config/lazy.lua<CR>')

vim.keymap.set('n', '<leader>ec', ':e ~/code<CR>')
vim.keymap.set('n', '<leader>en', ':e ~/notes<CR>')
vim.keymap.set('n', '<leader>e?', ':e ~/notes/code/vim_cheatsheet.md<CR>')


local function create_new_note()
  local notes_dir = vim.fn.expand("~/notes/inbox")
  if vim.fn.isdirectory(notes_dir) == 0 then
    vim.fn.mkdir(notes_dir, "p")
  end
  local date_format = os.date("%Y%m%d%H%M")
  local file_path = notes_dir .. "/" .. date_format .. ".md"
  vim.cmd("edit " .. file_path)
end
_G.create_new_note = create_new_note
vim.api.nvim_set_keymap('n', '<leader>nn', ':lua create_new_note()<CR>', { noremap = true, silent = true })

