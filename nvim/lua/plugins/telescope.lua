return {
    'nvim-telescope/telescope.nvim', 
	tag = '0.1.5',
	dependencies = { 
		'nvim-lua/plenary.nvim'
	},
	config = function()
		--telescope
		vim.api.nvim_set_keymap(
		  "n",
		  "ff",
		  ":Telescope find_files<CR>",
		  { noremap = true }
		)

		vim.api.nvim_set_keymap(
		  "n",
		  "fg",
		  ":Telescope live_grep<CR>",
		  { noremap = true }
		)

		local actions = require("telescope.actions")
		require("telescope").setup {
			defaults = {
				mappings = {
					i = { ["<esc>"] = actions.close },
					n = { ["q"] = actions.close },
				},
				--layout_strategy = 'vertical'
				path_display = {"truncate"},--display short file path 
				layout_strategy = 'horizontal',
				winblend = 0,
			}
		}
	end
}
