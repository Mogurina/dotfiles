local capabilities = require('blink.cmp').get_lsp_capabilities()

return {
  cmd = { "pyright-langserver", "--stdio" },
  capabilities = capabilities,
  
  -- ① Neovim 0.11の標準機能で「プロジェクトの最上位（ルート）」を正しく認識させる
  root_markers = { ".venv", "pyproject.toml", ".git" },
  
  -- ② LSPが起動した瞬間に、そのプロジェクトの .venv を見つけてPyrightに強制的に教え込む
  on_init = function(client)
    local root = client.workspace_folders and client.workspace_folders[1].name
    if root then
      -- Windows環境特有のパス(Scripts)と、Mac/Linux環境(bin)の両方をカバー
      local is_win = vim.fn.has("win32") == 1
      local venv_python = is_win and (root .. "/.venv/Scripts/python.exe") or (root .. "/.venv/bin/python")
      
      -- .venv 内に Python の実行ファイルが見つかったら、それをPyrightに設定
      if vim.fn.filereadable(venv_python) == 1 then
        client.config.settings.python.pythonPath = venv_python
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
    end
    return true
  end,
  
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      }
    }
  }
}
