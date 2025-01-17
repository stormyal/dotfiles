vim.g.mapleader = ' '

-- split panes
vim.keymap.set('n', '<c-/>', ':split<CR>', { silent = true })
vim.keymap.set('n', '<c-\'>', ':vsplit<CR>', { silent = true })

-- window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.api.nvim_set_keymap('n', '<c-,>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-.>', ':bnext<CR>', { noremap = true, silent = true })

-- main shortcuts
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', '<leader>ez', ':e ~/.zshrc<CR>')
vim.keymap.set('n', '<leader>et', ':e ~/.tmux.conf<CR>')
vim.keymap.set('n', '<leader>ee', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>ek', ':e ~/.config/nvim/lua/config/keybinds.lua<CR>')
vim.keymap.set('n', '<leader>ep', ':e ~/.config/nvim/lua/config/lazy.lua<CR>')

vim.keymap.set('n', '<leader>t', ':Neotree right<CR>')
vim.keymap.set('n', '<leader>R',
    ":lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%'), search = vim.fn.expand('<cword>') } })<CR>")
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")
vim.keymap.set('n', '<leader><s-o>', ":lua require('oil').open()<cr>")

vim.keymap.set('n', '<leader>d', ":Diffview")
vim.keymap.set('n', '<leader>f', ":lua require('fzf-lua').grep_project()<cr>")
-- vim.keymap.set('n', '<leader>F', ":FzfLua grep_cword<cr>")
vim.keymap.set('n', '<leader>b', ":FzfLua buffers<cr>")

-- note
vim.api.nvim_set_keymap('n', '<leader>en', ':e ~/notes/v.md<cr>', { noremap = true, silent = true })

-- CMP code action
vim.api.nvim_set_keymap('n', '<leader>,', ':lua vim.lsp.buf.code_action<CR>', { noremap = true, silent = true })

-- lsp stuff
vim.keymap.set('n', '<leader>L', ':lua vim.lsp.buf.code_action()<CR>')

-- toggles
vim.keymap.set('n', '<leader><leader>h', ':nohl<CR>')
vim.api.nvim_set_keymap('n', '<leader><leader>w', ':set wrap!<CR>', { noremap = true, silent = true })


-- DIAGNOSTICS
vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    local u = config().underline
    local s = config().signs
    config {
        -- virtual_text = not vt,
        underline = not u,
        signs = not s,
    }
end, { desc = "toggle diagnostic" })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':DiagnosticToggle<CR>', { noremap = true, silent = true })
-- Use this if you want it to automatically show all diagnostics on the
-- current line in a floating window. Personally, I find this a bit
-- distracting and prefer to manually trigger it (see below). The
-- CursorHold event happens when after `updatetime` milliseconds. The
-- default is 4000 which is much too long
-- vim.cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
-- vim.o.updatetime = 300

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
    'n', '<Leader>l', ':lua vim.diagnostic.open_float()<CR>',
    { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
    'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
    { noremap = true, silent = true }
)
-- -- Go to prev diagnostic (if there are multiple on the same line, only shows
-- -- one at a time in the floating window)
vim.api.nvim_set_keymap(
    'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
    { noremap = true, silent = true }
)


vim.api.nvim_create_user_command("HiddenCharactersToggle", function()
    vim.o.list = not vim.o.list
end, { desc = "toggle rendering of spaces, tabs, etc." })
vim.api.nvim_set_keymap('n', '<leader><leader>c', ':HiddenCharactersToggle<CR>', { noremap = true, silent = true })


-- zen mode
local function zen_mode()
    require('zen-mode').toggle({
        window = {
            width = .5,
            options = {
                signcolumn = "no",      -- disable signcolumn
                number = false,         -- disable number column
                relativenumber = false, -- disable relative numbers
                cursorline = false,     -- disable cursorline
                -- cursorcolumn = false, -- disable cursor column
                foldcolumn = "0",       -- disable fold column
                -- list = false, -- disable whitespace characters
            },
        },
        plugin = {
            tmux = { enabled = false }
        }

    })
end
vim.keymap.set('n', '<leader>z', zen_mode)






--
-- -- WINDOW RESIZE mode
-- -- Define a global variable to track the window mode state
-- _G.window_mode_active = false
--
-- -- Function to toggle window resize mode
-- function ToggleWindowResizeMode()
--     if _G.window_mode_active then
--         _G.window_mode_active = false
--         print("Exited Window Resize Mode")
--     else
--         _G.window_mode_active = true
--         print("Entered Window Resize Mode")
--     end
-- end
--
-- -- Keybinding to enter window resizing mode with <Space>W
-- vim.keymap.set('n', '<Space>w', function() ToggleWindowResizeMode() end)
--
-- -- Conditional mappings for window resizing
-- vim.keymap.set('n', 'k', function()
--     if _G.window_mode_active then
--         vim.cmd('resize -2')
--     else
--         vim.cmd('normal! h')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'j', function()
--     if _G.window_mode_active then
--         vim.cmd('resize +2')
--     else
--         vim.cmd('normal! j')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'h', function()
--     if _G.window_mode_active then
--         vim.cmd('vertical resize +2')
--     else
--         vim.cmd('normal! k')
--     end
-- end, { silent = true })
--
-- vim.keymap.set('n', 'l', function()
--     if _G.window_mode_active then
--         vim.cmd('vertical resize -2')
--     else
--         vim.cmd('normal! l')
--     end
-- end, { silent = true })
--
-- -- Exit window resizing mode with <Esc>
-- vim.keymap.set('n', '<Esc>', function()
--     if _G.window_mode_active then
--         _G.window_mode_active = false
--         print("Exited Window Resize Mode")
--     else
--         vim.cmd('normal! <Esc>')
--     end
-- end, { silent = true })
