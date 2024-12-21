return {
	'neoclide/coc.nvim',branch="release",
	config = function()
		-- coc settings
		local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
		vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', opts)
		vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)
	end
}
