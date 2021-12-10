-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- 
return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language servers
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
	}

  -- julia
  use 'JuliaEditorSupport/julia-vim'

  -- fuzzy seaches
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
}
  use 'BurntSushi/ripgrep'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- tmux
  use 'christoomey/vim-tmux-navigator'
  use 'benmills/vimux'

  -- colorschemes
  use 'srcery-colors/srcery-vim'

  -- git
  use 'tpope/vim-fugitive'

  -- yaml
  use 'stephpy/vim-yaml'

  -- snippets
  use 'jpalardy/vim-slime'

  -- formatters
  use 'psf/black'
  use 'kdheepak/JuliaFormatter.vim'

  -- testing
  use 'vim-test/vim-test'

  -- latex 
  use 'lervag/vimtex'

end)
