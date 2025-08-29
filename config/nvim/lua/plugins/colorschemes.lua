return {
    { "Shatur/neovim-ayu" },
    { "ellisonleao/gruvbox.nvim" },
    -- { "sainnhe/everforest" },
    { "MetriC-DT/balance-theme.nvim" },
    {
        "miikanissi/modus-themes.nvim",
        config = function()
            require("modus-themes").setup({
                -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
                -- `auto` will automatically set style based on background set with vim.o.background
                style = "auto",
                variant = "default",              -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
                transparent = false,              -- Transparent background (as supported by the terminal)
                dim_inactive = false,             -- "non-current" windows are dimmed
                hide_inactive_statusline = false, -- Hide statuslines on inactive windows. Works with the standard **StatusLine**, **LuaLine** and **mini.statusline**
                line_nr_column_background = true, -- Distinct background colors in line number column. `false` will disable background color and fallback to Normal background
                sign_column_background = true,    -- Distinct background colors in sign column. `false` will disable background color and fallback to Normal background
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = false },
                },
                on_highlights = function(highlights, colors)
                    highlights.IlluminatedWordText = { underline = true, fg = "#000000"}
                    highlights.IlluminatedWordRead = { underline = true, fg = "#000000" }
                    highlights.IlluminatedWordWrite = { underline = true, fg = "#000000" }
                end,
            })
        end

    }
}
