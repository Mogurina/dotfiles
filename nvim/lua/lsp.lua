--ビルトインlsp設定
-- 1. ファイルタイプと起動するLSPサーバーの「対応表」を作る
-- （1つの言語で複数のLSPを起動できるように、配列 { } にしています）
local lsp_map = {
  python     = { "pyright" },
  css        = { "cssls" },
  go         = { "gopls" },
  typescript = { "ts_ls" },
  html       = { "html" },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(lsp_map),
  callback = function(args)
    local lang = args.match
    local servers = lsp_map[lang]
    
    if servers then
      for _, server in ipairs(servers) do
        -- 【追加1】作成した lua/lsp/〜.lua の設定を読み込む
        local ok, config = pcall(require, "lsp." .. server)
        
        if ok then
          -- 【追加2】Neovim本体に「このサーバー名には、この設定を使ってね」と登録
          vim.lsp.config(server, config)
          
          -- その上でLSPを有効化する
          vim.lsp.enable(server)
        else
          -- 万が一ファイルが見つからない時の警告
          vim.notify("LSP設定ファイルが見つかりません: " .. server, vim.log.levels.WARN)
        end
      end
    end
  end,
})
