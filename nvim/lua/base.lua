-- encodin0
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.foldmethod = "indent" --インデント基準で折りたたむ
--vim.opt.foldcolumn = "1" --折りたたみの状態を表示
vim.opt.foldlevel = 99 --折りたたみを開いた状態で開く
--vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.mouse = "a"
vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.helplang = 'ja', 'en'
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = true --端までコードが届いた際に折り返す
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.deprecate = function() end -- disable deprecate warnings

-- 外部からファイルを変更されたら反映する
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

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
