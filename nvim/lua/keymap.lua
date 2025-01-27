--keymap
local keymap = vim.keymap
keymap.set('i','jk','<ESC>')
keymap.set('v','jk','<ESC>')
keymap.set("n","F","<C-f>")
keymap.set("n","B","<C-b>")


-- 画面分割
vim.keymap.set('n', '<Leader>sv', ':split<Return><C-w>w')
vim.keymap.set('n', '<Leader>s', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
vim.keymap.set('n', '<Leader>sh', '<C-w>h')
vim.keymap.set('n', '<Leader>sk', '<C-w>k')
vim.keymap.set('n', '<Leader>sj', '<C-w>j')
vim.keymap.set('n', '<Leader>sl', '<C-w>l')

