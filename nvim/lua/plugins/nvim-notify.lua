return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		timeout = 5000,
	},
	config = function()
		local notify = require("notify")
		notify.setup()
		vim.notify = notify
	end,
}
