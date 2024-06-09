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
	{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
	config = function()
      vim.g.mkdp_auto_close = true
      vim.g.mkdp_open_to_the_world = false
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_browser = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
      vim.g.mkdp_echo_preview_url = true
      vim.g.mkdp_page_title = "${name}"
    end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		requires = {
		'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require("nvim-tree").setup()
		end
	},
}
