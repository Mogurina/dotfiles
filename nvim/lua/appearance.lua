--colo0
--vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[colorscheme tokyonight-night]]




--透過処理
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- blink.cmp の枠線の色
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE", fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE", fg = "#7aa2f7" })

-- snacks.nvim (picker) の枠線の色
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "NONE", fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { bg = "NONE", fg = "#bb9af7" })
