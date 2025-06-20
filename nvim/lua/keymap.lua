-- lua/keymaps.lua
if vim.g.vscode then
  local vscode = require("vscode")

  -- 前後の変更点(Git)に移動
  vim.keymap.set("n", "<space>j", function()
    vscode.action("workbench.action.editor.nextChange")
  end)
  vim.keymap.set("n", "<space>k", function()
    vscode.action("workbench.action.editor.previousChange")
  end)

  --------------------------------------------------------------
  -- VSCodeのsettings.jsonにも設定が必要 (Neovim以外のタブの切り替え)
  --------------------------------------------------------------
  -- 左のタブへ移動
  vim.keymap.set("n", "<Space>l", function()
    vscode.action("workbench.action.nextEditorInGroup")
  end)
  -- 右のタブへ移動
  vim.keymap.set("n", "<Space>h", function()
    vscode.action("workbench.action.previousEditorInGroup")
  end)
  -- 現在のタブを閉じる
  vim.keymap.set("n", "<Space>q", function()
    vscode.action("workbench.action.closeActiveEditor")
  end)
  -- 現在のタブ以外をすべて閉じる
  vim.keymap.set("n", "<space>w", function()
    vscode.action("workbench.action.closeOtherEditors")
  end)

  -- fold/unfold
  vim.keymap.set("n", "zc", function()
    vscode.action("editor.fold")
  end)
  vim.keymap.set("n", "zo", function()
    vscode.action("editor.unfold")
  end)
end


if not vim.g.vscode then
	-- Neovimのキーマップ設定
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
end
