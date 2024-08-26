-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    checker = { enabled = false },
    spec = {
        {
            "Shatur/neovim-ayu",
            config = function()
                -- load the colorscheme here
                vim.cmd([[colorscheme ayu-dark]])
            end,
        },
        {
            'maxmx03/solarized.nvim',
            lazy = false,
            priority = 1000,
            -- config = function()
            --   vim.o.background = 'dark' -- or 'light'
            --
            --   vim.cmd.colorscheme 'solarized'
            -- end,
        },
        -- { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                -- calling `setup` is optional for customization
                require("fzf-lua").setup({ 'telescope', fzf_colors = false })
            end
        },













        { 'stevearc/oil.nvim',      dependencies = { "nvim-tree/nvim-web-devicons" } },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        -- {
        --   "NeogitOrg/neogit",
        --   dependencies = {
        --     "nvim-lua/plenary.nvim",         -- required
        --     "sindrets/diffview.nvim",        -- optional - Diff integration
        --
        --     -- Only one of these is needed, not both.
        --     -- "nvim-telescope/telescope.nvim", -- optional
        --     "ibhagwan/fzf-lua",              -- optional
        --   },
        --   config = true
        -- },
        { 'lewis6991/gitsigns.nvim' },
        -- { 'nvim-tree/nvim-tree.lua' },
        { 'sindrets/diffview.nvim' },
        { 'MagicDuck/grug-far.nvim' },
        {
            'f-person/auto-dark-mode.nvim',
            opts = {
                update_interval = 1000,
                set_dark_mode = function()
                    vim.api.nvim_set_option("background", "dark")
                    vim.cmd("colorscheme ayu-dark")
                end,
                set_light_mode = function()
                    vim.api.nvim_set_option("background", "light")
                    vim.cmd("colorscheme solarized")
                end,
            },
        },

        -- {
        --     'stevearc/aerial.nvim',
        --     opts = {},
        --     -- Optional dependencies
        --     dependencies = {
        --        "nvim-treesitter/nvim-treesitter",
        --        "nvim-tree/nvim-web-devicons"
        --     },
        --   },



        -- LSP stuff
        {
            "williamboman/mason.nvim"
        },
        {
            "williamboman/mason-lspconfig.nvim"
        },

        { 'neovim/nvim-lspconfig' },



        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
            },
            -- ---@param opts cmp.ConfigSchema
            -- opts = function(_, opts)
            --   table.insert(opts.sources, { name = "emoji" })
            -- end,
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },
        {
            "kylechui/nvim-surround",
            version = "*", -- Use for stability; omit to use `main` branch for the latest features
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        },


        {
            "nvim-treesitter/nvim-treesitter"
        },



        {
            'tzachar/local-highlight.nvim',
            config = function()
                require('local-highlight').setup()
            end
        },


        {
            "windwp/nvim-ts-autotag"
        },

        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
        },
        {
            "pogyomo/winresize.nvim",
        },
        {
            "pogyomo/submode.nvim",
            lazy = true,
            -- (recommended) specify version to prevent unexpected change.
            -- version = "6.0.0",
        },


        {
            -- UFO folding
            {
                "kevinhwang91/nvim-ufo",
                dependencies = {
                    "kevinhwang91/promise-async",
                    {
                        "luukvbaal/statuscol.nvim",
                        config = function()
                            local builtin = require("statuscol.builtin")
                            require("statuscol").setup({
                                relculright = true,
                                segments = {
                                    { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                                    { text = { "%s" },                  click = "v:lua.ScSa" },
                                    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                                },
                            })
                        end,
                    },
                },
                event = "BufReadPost",
                opts = {
                    provider_selector = function()
                        return { "treesitter", "indent" }
                    end,
                },

                init = function()
                    vim.keymap.set("n", "zR", function()
                        require("ufo").openAllFolds()
                    end)
                    vim.keymap.set("n", "zM", function()
                        require("ufo").closeAllFolds()
                    end)
                end,
            },
            -- Folding preview, by default h and l keys are used.
            -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
            -- On second press the preview will be closed and fold will be opened.
            -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
            { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
        },


        {
            "karb94/neoscroll.nvim"
        }

    },


    --
    -- {
    --     'neovim/nvim-lspconfig'
    --
    -- },
    install = {
        colorscheme = { "ayu" }
    },


})
