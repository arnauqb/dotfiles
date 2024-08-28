if vim.g.vscode then
    
else

-- python path
vim.g.python3_host_prog = '/Users/arnull/miniconda3/envs/nvim/bin/python'

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
vim.g.maplocalleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

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
vim.cmd('colorscheme catppuccin-mocha')
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
require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
        print("formatting...")
        vim.lsp.buf.format { async = true }
        print("Formatting done!")
    end, opts)


    print("Language server started: " .. client.name)
end
require'lspconfig'.julials.setup{on_attach = on_attach}

-- image.nvim
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

require("image").setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "norg" },
    },
  },
  max_width = 200,
  max_height = 22,
  max_width_window_percentage = math.huge,
  max_height_window_percentage = math.huge,
  window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
})

-- quarto
require('quarto').setup{
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "r", "python", "julia", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = false,
    default_method = nil, -- 'molten' or 'slime'
    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                     -- Takes precedence over `default_method`
    never_run = { "yaml" }, -- filetypes which are never sent to a code runner
  },
  keymap = {
    -- set whole section or individual keys to `false` to disable
    hover = "K",
    definition = "gd",
    type_definition = "gD",
    rename = "<leader>lR",
    format = "<leader>lf",
    references = "gr",
    document_symbols = "gS",
  }
}
end
