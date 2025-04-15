return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons", opts = {} },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    opts = {
        default_file_explorer = true,
        delete_to_trash = false,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        cleanup_delay_ms = false,
        view_options = {
            show_hidden = true,
            natural_order = true,
            -- is_always_hidden = function(name, _)
            --     return name == '..' or name == '.git'
            -- end,
        },
        win_options = {
            wrap = true,
        },

        use_default_keymaps = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
            ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
            ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
            ["gp"] = "actions.preview",
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
    },
}
