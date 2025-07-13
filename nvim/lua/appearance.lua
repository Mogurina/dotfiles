--color
vim.cmd[[colorscheme solarized-osaka]]
--if not vim.g.vscode then
--	vim.cmd[[colorscheme poimandres]]
--end
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
