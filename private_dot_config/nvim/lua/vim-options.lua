vim.cmd(":cd ~/.config")

vim.cmd("set colorcolumn=80")
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrap = true
vim.o.linebreak = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set scrolloff=10")
vim.cmd("set clipboard^=unnamedplus,unnamed")
vim.cmd.colorscheme("catppuccin-latte")



--vim.cmd([[
-- highlight CursorLine guibg=#FEFEFE guifg=#4C4F69
--]])
