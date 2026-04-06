local capabilities = require('blink.cmp').get_lsp_capabilities()

return {
  cmd = { "pyright-langserver", "--stdio" },
  capabilities = capabilities,
  
  root_markers = { "pyproject.toml", ".git", ".venv" },
  
  on_init = function(client)
    -- 今開いているファイルのディレクトリパスを取得
    local current_file_path = vim.fn.expand("%:p:h")
    
    -- 現在の階層から親ディレクトリへ向かって（upward = true）".venv" を探す
    local venv_path = vim.fs.find(".venv", {
      path = current_file_path,
      upward = true,
      type = "directory",
    })[1]

    if venv_path then
      local is_win = vim.fn.has("win32") == 1
      local python_path = is_win and (venv_path .. "/Scripts/python.exe") or (venv_path .. "/bin/python")
      
      -- 見つけた .venv 内に Python 実行ファイルがあればPyrightにセット
      if vim.fn.filereadable(python_path) == 1 then
        client.config.settings.python.pythonPath = python_path
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

