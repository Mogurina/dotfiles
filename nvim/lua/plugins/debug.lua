return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- DAP UI の初期化とフック設定
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- キーマップの設定
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>c', dap.continue, { desc = 'DAP Continue' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'DAP Terminate' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  },
	{
    "mfussenegger/nvim-dap-python",
    ft = "python", -- Pythonファイルを開いた時だけ読み込む
    dependencies = {
      "mfussenegger/nvim-dap", -- dap本体が先に読み込まれることを保証する
    },
    config = function()
      -- uv等の仮想環境からPythonパスを探す関数
      local function get_python_path()
        local is_windows = vim.fn.has("win32") == 1
        local python_bin = is_windows and "/.venv/Scripts/python.exe" or "/.venv/bin/python"
        
        -- カレントディレクトリを確認
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. python_bin) == 1 then
          return cwd .. python_bin
        end

        -- 親ディレクトリを確認
        local parent = vim.fn.fnamemodify(cwd, ":h")
        if vim.fn.executable(parent .. python_bin) == 1 then
          return parent .. python_bin
        end

        -- 見つからない場合のフォールバック
        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
      end

      -- パスを解決してセットアップ
      local python_path = get_python_path()
      if vim.fn.executable(python_path) == 1 then
        require("dap-python").setup(python_path)
      end
    end,
  },
}
