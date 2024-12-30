return {
	'akinsho/toggleterm.nvim', 
	version = "*", 
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<leader>t]],
			hide_numbers = true,
			autochdir = false,
			shade_terminals = false,
			start_in_insert = true,
			insert_mappings = false,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,

			float_opts = {
				border = "curved",
				winblend = 0,
				title_pos = "center",
			},
		})
		
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({cmd="lazygit",hidden=true})
	

		function _lazygit_toggle()
			lazygit:toggle()
		end
		vim.api.nvim_set_keymap("n","<leader>g","<cmd>lua _lazygit_toggle()<CR>",{noremap=true,silent=true})
	end,
}
