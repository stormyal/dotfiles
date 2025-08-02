local function colorscheme_object(LINK, NAME)
    return {
        LINK,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme ]] .. NAME)
        end,
    }
end


return {
    -- colorscheme_object("folke/tokyonight.nvim", "tokyonight")
    -- colorscheme_object("Shatur/neovim-ayu", "ayu-dark")
    colorscheme_object("Shatur/neovim-ayu", "ayu-light")
    -- colorscheme_object("danishprakash/vim-yami", "yami"),
    -- colorscheme_object("bettervim/yugen.nvim", "yugen"),
    -- colorscheme_object("Lokaltog/vim-distinguished", "distinguished")
}
