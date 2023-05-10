return {
    {"nvim-treesitter/nvim-treesitter"},
    {"neovim/nvim-lspconfig"},
	{"kien/ctrlp.vim"},
	{"averms/black-nvim"},
	{"jpalardy/vim-slime"},
	{"vim-test/vim-test"},
	{"github/copilot.vim"},
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		"AstroNvim/astrotheme",
		config = true,
	},
	{"preservim/vimux"},
    {"christoomey/vim-tmux-navigator"},
    {
    'crispgm/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    config = true,
    },
    {"rebelot/heirline.nvim"},
}
