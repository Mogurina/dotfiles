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

        local ok, config = pcall(require, "lsp." .. server)
        
        if ok then

          vim.lsp.config(server, config)
          
          vim.lsp.enable(server)

        else
          vim.notify("LSP設定ファイルが見つかりません: " .. server, vim.log.levels.WARN)
        end
      end
    end
  end,
})
