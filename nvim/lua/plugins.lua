--plugin マネージャー
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



local neovim_plugins = {
	require("plugins.lualine"),
	require("plugins.nvim-autopairs"), --文字の挿入を伴うプラグインは'InsertEnter'を指定する。
	require("plugins.fidget"), --LSPと連動するプラグインは'LspAttach'を指定する。
	require("plugins.telescope"),--telescope	
	require("plugins.telescope-fzf"),--telescope
	require("plugins.plenary"),--telescope
	require("plugins.treesitter"),--シンタックスハイライト関係
	require("plugins.emmet"),
	require("plugins.highlight-colors"),
	require("plugins.nvim-notify"),
	require("plugins.noice"),
	require("plugins.toggleterm"),
	require("plugins.autocmp"),--補完機能
	require("plugins.colortheme"),
	require("plugins.hlchunk"),
	require("plugins.flash"),
}

require('lazy').setup(neovim_plugins)
