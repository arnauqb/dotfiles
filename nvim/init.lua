-- python path
vim.g.python3_host_prog = '/Users/arnull/miniconda3/bin/python'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("plugins")


-- global clipboard
vim.opt.clipboard = "unnamedplus"

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set hidden buffer
vim.opt.hidden = true

-- Set mouse mode
vim.opt.mouse = "a"

-- Set search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set tab and indent configuration
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true


-- Set color scheme
vim.cmd('colorscheme monokai-pro')
-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('set background=light')


-- keybindings

-- vim-test
vim.api.nvim_set_keymap('n', '<leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':TestVisit<CR>', { noremap = true, silent = true })
vim.g["test#strategy"] = "vimux"
vim.g.VimuxOrientation = "v"
vim.api.nvim_set_keymap('n', '<Leader>vl', ':VimuxRunLastCommand<CR>', { noremap = true })


-- vim-slime
vim.g.slime_target = "tmux"
vim.api.nvim_set_keymap('n', '<C-c><C-x>', ':%SlimeSend<CR>', { noremap = true })
vim.cmd([[let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}]])

--black
vim.api.nvim_set_keymap('n', '<leader>b', ':call Black()<CR>', { noremap = true, silent = true })




-- change tabs
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast<CR>', { noremap = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- -- chatgpt
-- map("n", "<Leader>ad", ":ChatGPTRun docstring <CR>", { silent = true })
-- map("n", "<Leader>ab", ":ChatGPTRun fix_bugs <CR>", { silent = true })



-- language server
require'lspconfig'.pyright.setup{}
