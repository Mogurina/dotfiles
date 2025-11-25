return {
  "folke/snacks.nvim",
  priority = 1000,
	lazy = false,
	 --@type snacks.Config
	opts = {
		picker = {
			-- your picker configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		dashboard = {
      -- Lainの雰囲気に合わせたカラー設定（後述のハイライト設定と連動）
      preset = {
				-- ここが重要：デフォルトの keys を Lain仕様で上書きします
        keys = {
          { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.picker.files()" },
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
