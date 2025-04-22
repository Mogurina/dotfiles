--keymap
local keymap = vim.keymap
keymap.set('i','jk','<ESC>')
keymap.set('v','jk','<ESC>')
keymap.set("n","F","<C-f>")
keymap.set("n","B","<C-b>")

keymap.set("n","<Leader>c",":CopilotChatToggle<Return>")

-- 画面分割
keymap.set('n', '<Leader>sv', ':split<Return><C-w>w')
keymap.set('n', '<Leader>s', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
keymap.set('n', '<Leader>sh', '<C-w>h')
keymap.set('n', '<Leader>sk', '<C-w>k')
keymap.set('n', '<Leader>sj', '<C-w>j')
keymap.set('n', '<Leader>sl', '<C-w>l')

--　インデントで折り畳み
keymap.set("n", "<Tab>", "zc")
keymap.set("n", "<S-Tab>", "zo")
keymap.set("n", "<Leader><Tab>", "zM")
keymap.set("n", "<Leader><S-Tab>", "zR")
