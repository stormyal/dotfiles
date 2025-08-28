return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}},
    },
    lazy = false,
    init = function()
        vim.g.neotree = {
            auto_close = true,

            auto_open = false,
            auto_update = true,
            update_to_buf_dir = true,
        }
    end,
    opts = {
        close_if_last_window = true,
        filesystem = {
            group_empty_dirs = true,
            use_libuv_file_watcher = true,
            follow_current_file = {
                enabled = true
            },
            hijack_netrw_behavior = "disabled",

            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
            },
        },
        hijack_netrw_behavior = "disabled",
    },
}
