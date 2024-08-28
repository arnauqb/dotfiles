return {
    {"nvim-treesitter/nvim-treesitter"},
    {"neovim/nvim-lspconfig"},
	{"kien/ctrlp.vim"},
	{"averms/black-nvim"},
	{"jpalardy/vim-slime"},
	{"vim-test/vim-test"},
    {"github/copilot.vim"},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		"AstroNvim/astrotheme",
		config = true,
	},
    {'loctvl842/monokai-pro.nvim'},
    {'NLKNguyen/papercolor-theme'},
    {'ellisonleao/gruvbox.nvim'},
    {'sainnhe/gruvbox-material'},
    {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'lukas-reineke/lsp-format.nvim'},
	{"preservim/vimux"},
    {"christoomey/vim-tmux-navigator"},
    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = true,
    },
    {"rebelot/heirline.nvim"},
    {"tpope/vim-surround"},
    {"lervag/vimtex"},
    {"JuliaEditorSupport/julia-vim"},
    {"vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
            rocks = { "magick" },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
    },
    {'jmbuhr/otter.nvim'},
    {'hrsh7th/nvim-cmp'},
    {'quarto-dev/quarto-nvim'},
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
        opts = {
          -- add any opts here
        },
        dependencies = {
          "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
          "stevearc/dressing.nvim",
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          --- The below is optional, make sure to setup it properly if you have lazy=true
          {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
              file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
          },
          --- For image pasting support
          {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {},
          }
        },
    }
}
