vim.opt.termguicolors = true
require("bufferline").setup{}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', ']b', '<cmd>BufferLineCycleNext<CR>', opts)
map('n', '[b', '<cmd>BufferLineCyclePrev<CR>', opts)
