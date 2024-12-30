return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
	config = function()
		require("render-markdown").setup({
			heading = {
				enabled = true,
				sign = false,
				position = "inline",
				icons = { '󰼏 ', '󰎨 ' },
			},
			code = {
				enabled = true,
				width = "block",
				min_width = 45,
				left_pad = 2,
				language_pad = 2,
			}
		})
	end,
}

