return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 5000,
	},
	config = function()
		local notify = require("notify")
		notify.setup()
		vim.notify = notify
	end,
}
