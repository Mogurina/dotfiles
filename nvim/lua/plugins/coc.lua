

return {
	'neoclide/coc.nvim',branch="release",
	config = function()
		-- coc settings
		local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
		vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', opts)
		vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)
		vim.b.coc_root_patterns = {'.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs','tailwind.config.ts','tailwind.config.tsx'}
	end
}
