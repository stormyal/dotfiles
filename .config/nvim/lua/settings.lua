print("loading settings")

vim.o.number = true -- line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.ignorecase = true -- case sensitivity when searching
vim.o.smartcase = true -- if search contains upper case, it becomes case sensitive
vim.o.wrap = true -- line wrap
vim.o.linebreak = true -- don't split words when wrapping
vim.o.breakindent = true -- follow the indented space of the wrapped line
vim.o.expandtab = true -- pressing tab inserts whitespaces instead
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.scrolloff = 4 -- offset when scrolling
vim.o.hlsearch = true -- highlight search results
vim.o.termguicolors = true -- 24 bit colors
vim.o.autoread = true -- update files on external updates
vim.o.clipboard = "" -- no clipboard syncing
vim.o.updatetime = 1000 -- ui update rate

print("settings loaded")
