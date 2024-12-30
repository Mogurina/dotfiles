return {
	"nvim-tree/nvim-tree.lua",
	version = "*",lazy = false,
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function() 
		--nvim-tree setting
		require("nvim-tree").setup({
		  sort = {
			sorter = "case_sensitive",
		  },
		  view = {
			width = 30,
		  },
		  renderer = {
			group_empty = true,
		  },
		  filters = {
			dotfiles = true,
		  },
		})
		vim.api.nvim_set_keymap(
		'n', '<leader>f', ':NvimTreeToggle<CR>',
		{silent=true}
		)
	end,
}
