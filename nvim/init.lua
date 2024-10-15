-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.helplang = 'ja', 'en'
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = true --端までコードが届いた際に折り返す
vim.opt.termguicolors = true


--keymap
local keymap = vim.keymap
keymap.set('i','jk','<ESC>')
keymap.set('v','jk','<ESC>')
keymap.set('t','jk','<C-\\><C-n>')

keymap.set('n','tt','<cmd>belowright new<CR><cmd>terminal<CR>',{silent=true})
keymap.set('n','tx','<cmd>terminal<CR>',{silent=true})
vim.cmd('autocmd TermOpen * :startinsert')
vim.cmd('autocmd TermOpen * setlocal norelativenumber')
vim.cmd('autocmd TermOpen * setlocal nonumber')


-- 画面分割
keymap.set('n', 'sv', ':split<Return><C-w>w')
keymap.set('n', 'ss', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

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
plugins = require('plugins')
require('lazy').setup(plugins)


--color
vim.cmd[[colorscheme tokyonight]]


--telescope
vim.api.nvim_set_keymap(
  "n",
  "ff",
  ":Telescope find_files<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "fg",
  ":Telescope live_grep<CR>",
  { noremap = true }
)
local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = { ["<esc>"] = actions.close },
            n = { ["q"] = actions.close },
        },
        layout_strategy = 'vertical'
    }
}


-- coc settings
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)


--treesitter settings
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
-- ここでハイライトしたい言語を指定しておくと、起動時にインストールされます
  ensure_installed = {"python","vim","dockerfile","fish","typescript","tsx","javascript","json","lua","gitignore","bash","astro","markdown","css","scss","yaml","toml","vue","php","html"},
  highlight = {
    enable = true, -- ハイライトを有効化
    additional_vim_regex_highlighting = false, -- catpuucin用
    disable = {},
  },
　indent ={
　　enable =true,--言語に応じた自動インデントを有効化
  　disable ={"html"},-- htmlのインデントだけ無効化
　},
  autotag = {
    enable = true,
  },
}
