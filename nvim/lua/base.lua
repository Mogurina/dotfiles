-- encodin0
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.foldmethod = "indent" --インデント基準で折りたたむ
--vim.opt.foldcolumn = "1" --折りたたみの状態を表示
vim.opt.foldlevel = 99 --折りたたみを開いた状態で開く
--vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.mouse = "a"
vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.helplang = 'ja', 'en'
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = true --端までコードが届いた際に折り返す
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.deprecate = function() end -- disable deprecate warnings

-- 外部からファイルを変更されたら反映する
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})
