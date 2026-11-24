return{
		{
			"zbirenbaum/copilot.lua",
			event = "VeryLazy",
			cmd = "Copilot",
			config = function()
				require("copilot").setup({
					suggestion = {enabled = false,auto_trigger = false},
					panel = {enabled = false},
					copilot_node_command = 'node'
				})
			end,
		},
		{ "nvim-lua/plenary.nvim",
			event = "VeryLazy",
		}, -- for curl, log wrapper
}
