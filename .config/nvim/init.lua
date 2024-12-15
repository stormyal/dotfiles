local o = vim.opt
o.number = true
o.relativenumber = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.wrap = true
o.linebreak = true
o.breakindent = true
-- o.breakindentopt = 'shift:8'
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.autoindent = true
o.smartindent = true
o.smarttab = true
vim.o.list = false
vim.o.listchars = "space:·,tab:>-,trail:~,extends:>,precedes:<,nbsp:+"
vim.o.showbreak = "--->"

o.clipboard = "unnamed,unnamedplus"
o.termguicolors = true
o.scrolloff = 3
o.splitright = true
o.splitbelow = true
-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
-- o.foldmethod = "expr"
-- vim.opt.foldexvim.o.foldcolumn = 'auto:9'pr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtvim.o.foldcolumn = 'auto:9'ext = "v:lua.vim.treesitter.foldtext()"
-- o.foldcolumn = "0"
-- o.foldtext = ""
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 3

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.cmd("set foldopen-=block") -- skip over folds
-- vim.cmd("set foldfix") -- skip over folds
-- vim.o.foldfix = true
-- vim.cmd([[hi FoldColumn guifg=red]])
vim.cmd([[autocmd ColorScheme * hi FoldColumn guifg=#333333]])



-- vim.o.statuscolumn = '%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }'
-- vim.api.nvim_exec([[
-- .o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
--   augroup SaveFolds
--     autocmd!
--     autocmd BufWinLeave * mkview
--     autocmd BufWinEnter * silent! loadview
--   augroup END
-- ]], false)
--

o.updatetime = 50

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[ lua vim.lsp.buf.format() ]],

})

require("config.lazy")
require("config.keybinds")

-- TODO: TROUBLESHOOT!
--
-- vim.api.nvim_set_hl(0, "CurSearch", { bg = "blue", fg="red", underline = true, bold = false })
-- vim.cmd('highlight CurSearch guifg=red guibg=blue')
-- vim.autocommands = {
--   {
--     { "ColorScheme" },
--     {
--       pattern = "*",
--       callback = function()
--         -- see ':h nvim_set_hl' for more options
--         vim.api.nvim_set_hl(0, "CurSearch", { bg = "#282828", underline = true, bold = false })
--       end,
--     },
--   },
-- }

-----------------------------
require('ayu').setup({
    mirage = false,
    terminal = true,
})

-- require("aerial").setup({
--   -- optionally use on_attach to set keymaps when aerial has attached to a buffer
--   on_attach = function(bufnr)
--     -- Jump forwards/backwards with '{' and '}'
--     vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
--     vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
--   end,
-- })
-- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

require("oil").setup({
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    use_default_keymaps = false,
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

vim.opt.termguicolors = true

require('gitsigns').setup {
    signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    on_attach                    = function(bufnr)
        local gitsigns = require('gitsigns')


        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
        map('n', '<leader>htb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>hd', gitsigns.diffthis)
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        map('n', '<leader>htd', gitsigns.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

require("neo-tree").setup({
    filesystem = {
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        follow_current_file = { enabled = true },
        follow_current_file = true
        -- hijack_netrw_behavior = "open_default"
    },

})

local function fire_git_event()
    require("neo-tree.events").fire_event(require("neo-tree.events").GIT_EVENT)
end

vim.api.nvim_create_autocmd("TabEnter", {
    pattern = "*",
    callback = fire_git_event,
    -- command = "NvimTreeRefresh",
})

vim.g.maplocalleader = ','
require('grug-far').setup({});












---------------------------
-- LSP STUFF
-- -----------------------
-- vim.lsp.start_client({
--   name = 'my-server-name',
--   cmd = {'lua-language-server'},
--   root_dir = vim.fs.dirname(vim.fs.find({'pyproject.toml', 'setup.py'}, { upward = true })[1]),
-- })
--

-- require'lspconfig'.lua_ls.setup{}
-- local lspconfig = require('lspconfig')
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "cssls", "gopls", "html", "htmx", "tsserver" },
})

-- keep the lsp gutter open so it doesn't change width of window
o.signcolumn = "yes"

require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            format = {
                enable = true,
                -- Put format options here
                -- NOTE: the value should be STRING!!
                defaultConfig = {
                    -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
                    indent_style = "space",
                    indent_size = "4",
                }
            },
        }
    }
}


-- Disable LSP messages but keep letters on the left
-- vim.diagnostics.config({ virtual_text = false })

require 'lspconfig'.tsserver.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.cssls.setup {
    capabilities = capabilities,
}

require 'lspconfig'.html.setup {
    -- settings = {
    --     html = {
    --         format = {
    --             templating = true,
    --             wrapLineLength = 120,
    --             wrapAttributes = 'auto',
    --         },
    --         hover = {
    --             documentation = true,
    --             references = true,
    --         },
    --     },
    -- },
}

require 'lspconfig'.gopls.setup {}

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-/>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' },
}, {
  { name = 'buffer' },
})
})
require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('nvim-autopairs').setup({})

cmp.event:on(
    'confirm_done',
    require('nvim-autopairs.completion.cmp').on_confirm_done()

)


require('nvim-autopairs').setup({})






require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "html", "lua", "vim", "vimdoc", "luadoc", "markdown", "javascript", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    -- auto_install = true,

    -- List of parsers to ignore installing (or "all")
    -- ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        -- disable = function(lang, buf)
        --     local max_filesize = 100 * 1024 -- 100 KB
        --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --     if ok and stats and stats.size > max_filesize then
        --         return true
        --     end
        -- end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<cr>", -- set to `false` to disable one of the mappings
            node_incremental = "<tab>",
            scope_incremental = "<cr>",
            node_decremental = "<s-tab>",
        },
    },
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = '<CR>',
    --         scope_incremental = '<CR>',
    --         node_incremental = '<TAB>',
    --         node_decremental = '<S-TAB>',
    --     },
    -- },
}


require('local-highlight').setup({
    -- file_types = { 'go', 'cpp' }, -- If this is given only attach to this
    -- OR attach to every filetype except:
    disable_file_types = { 'tex' },
    hlgroup = 'DiffText',
    cw_hlgroup = nil,
    -- Whether to display highlights in INSERT mode or not
    insert_mode = false,
    min_match_len = 1,
    max_match_len = math.huge,
    highlight_single_match = true,
})





require('nvim-ts-autotag').setup({
    opts = {
        -- Defaults
        enable_close = true,         -- Auto close tags
        enable_rename = true,        -- Auto rename pairs of tags
        enable_close_on_slash = true -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    -- per_filetype = {
    --   ["html"] = {
    --     enable_close = false
    --   }
    -- }
})



local submode = require("submode")
local resize = require("winresize").resize
submode.create("WinResize", {
    mode = "n",
    enter = "<Leader>w",
    leave = { "q", "<ESC>", "<Leader>w" },
    default = function(register)
        register("h", function() resize(0, 2, "left") end)
        register("j", function() resize(0, 1, "down") end)
        register("k", function() resize(0, 1, "up") end)
        register("l", function() resize(0, 2, "right") end)
    end,
})

require('ufo').setup({



    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
})


-- require "lsp_signature".setup({
--
--
-- })
-- vim.keymap.set({ 'n' }, '<C-k>', function()
--     require('lsp_signature').toggle_float_win()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })
--
-- vim.keymap.set({ 'n' }, '<Leader>k', function()
--     vim.lsp.buf.signature_help()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })
--

-- require('neoscroll').setup({ mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' } })

-- add border to popups
local _border = "single"
-- local _border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)
vim.diagnostic.config {
    virtual_text = false,
    float = {
        header = false,
        border = _border,
    }
}


local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        -- tsx = 'rainbow-tags-react',
        tsx = 'rainbow-parens',

    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        -- 'RainbowDelimiterCyan',
        -- 'RainbowDelimiterRed',
    },
}


require('ts_context_commentstring').setup {
    enable_autocmd = false,
}
require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
-- require('hologram').setup {
--     auto_display = true -- WIP automatic markdown image display, may be prone to breaking
-- }
