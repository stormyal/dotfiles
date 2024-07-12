-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "Shatur/neovim-ayu",
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
        require("fzf-lua").setup({'telescope', fzf_colors = false })
      end
    },













    { 'stevearc/oil.nvim', dependencies = { "nvim-tree/nvim-web-devicons" } },
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

    {'neovim/nvim-lspconfig'},



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
  -- automatically check for plugin updates
  checker = { enabled = true },
})
