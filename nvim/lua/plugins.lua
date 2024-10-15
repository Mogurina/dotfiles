return {
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = function() require('lualine').setup() end },
	{'windwp/nvim-autopairs', event = 'InsertEnter'}, --文字の挿入を伴うプラグインは'InsertEnter'を指定する。
	{'j-hui/fidget.nvim', event = 'LspAttach'}, --LSPと連動するプラグインは'LspAttach'を指定する。
	{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',dependencies = { 'nvim-lua/plenary.nvim' }
    },	
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{'nvim-lua/plenary.nvim'},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
	{'neoclide/coc.nvim',branch="release"},
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	{ 'windwp/nvim-autopairs', event = "InsertEnter", opts = {}, },
	{"nvim-tree/nvim-tree.lua",version = "*",lazy = false,dependencies = {"nvim-tree/nvim-web-devicons"},config = function() require("nvim-tree").setup {} end,},
}
