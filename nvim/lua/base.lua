-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
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

-- 画面分割
vim.keymap.set('n', 'sv', ':split<Return><C-w>w')
vim.keymap.set('n', 'ss', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')


-- 外部からファイルを変更されたら反映する
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})
