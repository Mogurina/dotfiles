--vim.g['emmet_html5'] = false
vim.g['user_emmet_install_global'] = false

vim.g['user_emmet_settings'] = {
  variables = {
    lang = 'ja'
  }
}
--vim.g['user_emmet_leader_key'] = '<tab>'
vim.g['user_emmet_expandabbr_key'] = '<tab>'
vim.g['user_emmet_mode'] = 'n'

local config = function()
	vim.api.nvim_create_autocmd('FileType', {
		pattern = { 'vue', 'html', 'css', 'typescriptreact',"typescript","javascript","javascriptreact"},
		command = 'EmmetInstall',
		group = vim.api.nvim_create_augroup("emmetInstall", { clear = true }),
	})
end

local emmet = {
	'mattn/emmet-vim',
	config = config
}

return emmet
