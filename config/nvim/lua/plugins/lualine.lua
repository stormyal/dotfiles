return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = function()
    local custom_ayu = require('lualine.themes.ayu_dark')
    custom_ayu.normal.c.bg = 'None'

      return {
          options = {
              icons_enabled = true,
              -- theme = custom_ayu,
              theme = 'auto',
              section_separators = '',
              component_separators = '',
              disabled_filetypes = {
                  statusline = {},
                  winbar = {},
              },
              ignore_focus = {},
              always_divide_middle = true,
              always_show_tabline = true,
              globalstatus = false,
              refresh = {
                  statusline = 100,
                  tabline = 100,
                  winbar = 100,

                  refresh_time = 16,
                  events = {
                      'WinEnter',
                      'BufEnter',
                      'BufWritePost',
                      'SessionLoadPost',
                      'FileChangedShellPost',
                      'VimResized',
                      'Filetype',
                      'CursorMoved',
                      'CursorMovedI',
                      'ModeChanged',
                  },
              }
          },
          sections = {
            lualine_a = {'', },
            lualine_b = { 'filename' },
            lualine_c = { 'branch', 'diff', 'diagnostics' },
            -- lualine_x = { 'encoding', 'fileformat', 'filetype'},
            lualine_x = { 'filetype'},
            lualine_y = {'location', },
            -- lualine_z = {'tabs', 'windows', 'lsp_status'},
            lualine_z = {},
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename', 'diagnostics'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
      }
  end,
}
