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

      -- 1. DAP UI の初期化とフック設定
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- === 【新規追加】uvによるdebugpy環境の自動構築ロジック ===
      local is_windows = vim.fn.has("win32") == 1
      -- ~/.local/share/nvim/debugpy-env (Neovimのデータディレクトリ内) に作成します
      local env_path = vim.fn.stdpath("data") .. "/debugpy-env"
      local debugpy_path = is_windows 
        and env_path .. "/Scripts/python"
        or env_path .. "/bin/python"

      -- 指定パスに python が存在しない場合のみ作成処理を行う
      if vim.fn.executable(debugpy_path) ~= 1 then
        vim.notify("uv: Creating debugpy virtual environment...", vim.log.levels.INFO)
        
        -- 仮想環境の作成
        local venv_cmd = string.format("uv venv %s", env_path)
        vim.fn.system(venv_cmd)
        
        -- debugpyのインストール
        local install_cmd = string.format("uv pip install --python %s debugpy", env_path)
        vim.fn.system(install_cmd)
        
        -- エラーハンドリング
        if vim.v.shell_error ~= 0 then
          vim.notify("uv: Failed to install debugpy.", vim.log.levels.ERROR)
        else
          vim.notify("uv: debugpy installed successfully!", vim.log.levels.INFO)
        end
      end
      -- =======================================================

      -- 2. アダプターの定義 (自動作成された python パスを使用)
      dap.adapters.python = function(cb, config)
        if config.request == 'attach' then
          local port = (config.connect or config).port
          local host = (config.connect or config).host or '127.0.0.1'
          cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = { source_filetype = 'python' },
          })
        else
          cb({
            type = 'executable',
            command = debugpy_path, -- ここで上記のパスが使われます
            args = { '-m', 'debugpy.adapter' },
            options = { source_filetype = 'python' },
          })
        end
      end

      -- 3. 実行設定の定義 (uv の .venv 対応)
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            -- uv仮想環境の自動認識
            if vim.env.VIRTUAL_ENV then
              return vim.env.VIRTUAL_ENV .. (is_windows and "/Scripts/python" or "/bin/python")
            end

            local cwd = vim.fn.getcwd()
            local venv_python = cwd .. (is_windows and "/.venv/Scripts/python" or "/.venv/bin/python")
            if vim.fn.executable(venv_python) == 1 then
              return venv_python
            end

            return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
          end,
        },
      }

      -- 4. キーマップの設定
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>c', dap.continue, { desc = 'DAP Continue' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'DAP Terminate' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  }
}
