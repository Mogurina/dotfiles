return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  
  -- 1. グローバルなキーバインド（Diffviewの起動や終了）
  keys = {
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: Current File History" },
  },

  opts = {
    hooks = {
      diff_buf_win_enter = function()
        vim.opt_local.foldenable = false
      end,
    },
    
    -- 2. Diffviewの画面内でのローカルなキーバインド
    keymaps = {
      disable_defaults = false, -- デフォルトのキーバインドを活かすか（trueで全リセット）
      
      -- 差分を表示しているウィンドウ（右側のメイン画面など）での設定
      view = {
        { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
      },
      
      -- 左側のファイル一覧パネルでの設定
      file_panel = {
        { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
        { "n", "l", "<cmd>DiffviewFocusFiles<CR>", { desc = "Focus files" } },
        -- デフォルトでは <tab> でファイル間の移動などが割り当てられていますが、
        -- ここで上書き・追加が可能です。
      },
      
      -- ファイルの履歴（FileHistory）パネルでの設定
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
      },
    },
  },
}
