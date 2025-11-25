return {
  "folke/snacks.nvim",
  priority = 1000,
	lazy = false,
	--@type snacks.Config
	opts = {

		picker = {enable=ture},

		dashboard = {

      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.picker.files()" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Live Grep", action = ":lua Snacks.picker.grep()" },
          { icon = " ", key = "c", desc = "System Config",action = function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end},
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

			-- 2. ここで表示する順番（レイアウト）を決めます
      sections = {
        { section = "header", padding = 2, color = "SnacksDashboardHeader" },
        -- ここで "keys" を指定すると、上で定義した preset.keys が表示されます
        -- デフォルトのメニューは表示されなくなります
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { section = "startup", padding = 2 },
      },
    },
	},

	keys = {
		{"ff", function() Snacks.picker.files() end, desc = "Smart Find Files" },
		{"fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{"fg", function() Snacks.picker.grep() end, desc = "Smart Find Files" },
		{"fe", function() Snacks.picker.explorer() end, desc = "Smart Find Files" },
	},

	-- ハイライトのカスタマイズ（赤や錆色を強調）
  config = function(_, opts)
    require("snacks").setup(opts)
    -- 色味（赤、濃いピンク、シアン）を定義
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#d20f39", bold = true }) 
    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#a9b1d6" })
    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#ff007c" })
    vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#565f89", italic = true })
    
    -- Terminalセクションの文字色（Copland OSの緑や白をイメージ）
    vim.api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = "#73daca" }) 
  end,
}
