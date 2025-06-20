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
	-- Space g でLazygit起動する場合
  vim.keymap.set("n", "GG", function()
    vscode.action("lazygit-vscode.toggle")
  end)

	--oil for vscode settings
	-- space o で起動する場合
	vim.keymap.set("n", "<space>o", function()
		vscode.action("oil-code.open")
	end)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "oil",
		callback = function(event)
			-----------------------------------------------
			-- Oil.Codeのタブが開かれたときだけ設定するキーマップ
			-----------------------------------------------
			local opts = { buffer = event.buf, noremap = true, silent = true }
			vim.keymap.set("n", "<CR>", function()
				vscode.action("oil-code.select")
			end, opts)
			vim.keymap.set("n", "<C-CR>", function()
				vscode.action("oil-code.selectVertical")
			end, opts)
			-- 水平方向に展開するコマンドはないので複数コマンドを同期で連続させる
			vim.keymap.set("n", "<C-s>", function()
				vscode.call("workbench.action.splitEditorDown")
				vscode.call("oil-code.selectTab")
				vscode.call("workbench.action.previousEditorInGroup")
				vscode.call("workbench.action.closeActiveEditor")
			end, opts)

			vim.keymap.set("n", "-", function()
				vscode.action("oil-code.openParent")
			end, opts)
			vim.keymap.set("n", "_", function()
				vscode.action("oil-code.openCwd")
			end, opts)
			vim.keymap.set("n", "<C-l>", function()
				vscode.action("oil-code.refresh")
			end, opts)
		end,
	})

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
