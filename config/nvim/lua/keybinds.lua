-- file shortcuts
vim.keymap.set('n', '<leader>ee', ":e ~/.config/nvim/init.lua<cr>")
vim.keymap.set('n', '<leader>es', ":e ~/.config/nvim/lua/settings.lua<cr>")
vim.keymap.set('n', '<leader>ek', ":e ~/.config/nvim/lua/keybinds.lua<cr>")
vim.keymap.set('n', '<leader>ep', ":e ~/.config/nvim/lua/plugins/<cr>")
vim.keymap.set('n', '<leader>et', ":e ~/.config/nvim/lua/plugins/colorscheme.lua<cr>")
vim.keymap.set('n', '<leader>el', ":e ~/.config/nvim/lua/lazyinit.lua<cr>")
vim.keymap.set('n', '<leader>et', ":e ~/.tmux.conf")
vim.keymap.set('n', '<leader>en', ":Oil ~/notes/code/v/<cr>")

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

-- single press of < and > to shift line(s)
vim.keymap.set('n', '>', '>>', { noremap = true, silent = true })
vim.keymap.set('n', '<', '<<', { noremap = true, silent = true })
-- stay in visual mode after shifting line(s)
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- when yanking, copy to clipboard
-- vim.keymap.set('v', '<leader>y', '"+y')
-- vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', 'y', '"+y')
vim.keymap.set('v', 'd', '"+d')
vim.keymap.set('n', 'yy', '"+yy')

-- change current directory to current file
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<cr>')

-- type • faster
vim.keymap.set('i', '<A-8>', '•', { noremap = true, silent = true })
vim.keymap.set('n', 'r<A-8>', 'r•', { noremap = true, silent = true })

-- move lines faster
vim.keymap.set('n', '<c-n>', 'ddp')
vim.keymap.set('n', '<c-p>', 'ddkP')

-- FZF LUA HANDLE SESSIONS

--
-- plugins init
--
vim.keymap.set('n', '<leader>l', ":Lazy<cr>")
vim.keymap.set('n', '<leader>/', ":Oil<cr>")
vim.keymap.set('n', "<leader>t", ":Neotree toggle right<cr>")
vim.keymap.set('n', '<leader>f', ":FzfLua live_grep<cr>")
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")
vim.keymap.set('n', '<leader>b', ":FzfLua buffers<cr>")

-- persisted.nvim
-- vim.keymap.set('n', '<leader>ss', ':SessionSave ') 
-- vim.keymap.set('n', '<leader>sl', ':SessionSearch<cr>') 
-- vim.keymap.set('n', '<leader>sr', ':SessionRestore ') 
-- vim.keymap.set('n', '<leader>sd', ':SessionDelete ') 

-- zen-node.nvim
vim.keymap.set('n', '<leader>z', ":ZenMode<cr>")


-- fzf-lua
vim.keymap.set({ "i" }, "<C-x><C-f>",
function()
    require("fzf-lua").complete_file({
        cmd = "rg --files",
        winopts = { preview = { hidden = true } }
    })
end, { silent = true, desc = "Fuzzy complete file" })


-- vim.keymap.set('n', '<leader>sl',
-- function()
--     local sessions = require('persistence').select()  
--     require'fzf-lua'.fzf_exec(sessions, {
--         actions = {
--             -- Use fzf-lua builtin actions or your own handler
--             ['default'] = require'fzf-lua'.actions.file_edit,
--             ['ctrl-y'] = function(selected, opts)
--                 print("selected item:", selected[1])
--                 (:SessionDelete selected[1])
--             end
--         }
--     })
-- end,  { silent = true}) 
