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
        }
    },
}
