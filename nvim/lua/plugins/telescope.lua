return {
	{
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
				"fs",
				":Telescope smart_open<CR>",
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
	},
	{
	 "danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	}
}
