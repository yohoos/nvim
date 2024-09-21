-- More natural splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autoindent = true -- should be on by default anyways
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true -- highlight search results throughout file
vim.opt.ignorecase = true -- Search case insensitive...
vim.opt.smartcase = true -- ...but not when search pattern cnotains upper case characters
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.fileformats = "unix,dos,mac"
vim.opt.swapfile = false -- is off by default, may not keep this on

-- KeyMappings for navigation
vim.api.nvim_set_keymap('n', "<C-J>", "<C-W><C-J>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<C-K>", "<C-W><C-K>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<C-L>", "<C-W><C-L>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<C-H>", "<C-W><C-H>", { noremap = true, silent = false })

vim.api.nvim_set_keymap('i', "<C-j>", "<Down>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', "<C-k>", "<Up>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', "<C-l>", "<Right>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', "<C-h>", "<Left>", { noremap = true, silent = false })

-- KeyMappings for adding newlines
vim.api.nvim_set_keymap('n', "<S-Enter>", "<Esc>o", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', "<C-Enter>", "<Esc>O", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', "<S-Enter>", "<Esc>o", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', "<C-Enter>", "<Esc>O", { noremap = true, silent = false })

-- Color configs
vim.cmd[[ hi Pmenu ctermbg=green ctermfg=black ]]
vim.cmd[[ hi PmenuSel ctermbg=cyan ctermfg=black ]]

