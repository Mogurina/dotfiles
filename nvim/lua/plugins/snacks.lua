
local dashboardImagePath = vim.fn.stdpath("config") .. "/lua/assets/lain.png"

-- dashboard で picker を開いて移動する際に発生するチラつきを防止する
local preventFlicker = function(handler)
  vim.schedule(function()
    Snacks.bufdelete()
  end)
  vim.schedule(function()
    -- ここの順番が逆だとno-neck-painがエラーになる
    vim.cmd([[:BarbarEnable]])
  end)
  vim.schedule(function()
    handler()
  end)
end


return {
  "folke/snacks.nvim",
	lazy=false,
	lazy = false,
	--@type snacks.Config
	opts = {

		picker = {
			enable=ture,
		},

		dashboard = {

      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find Files", action = function() preventFlicker(Snacks.picker.files) end,},
          { icon = " ", key = "r", desc = "Recent Files", action = function() preventFlicker(Snacks.picker.recent) end,},
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Live Grep", action = function() preventFlicker(Snacks.picker.grep) end,},
          { icon = " ", key = "c", desc = "System Config",action = function() preventFlicker(function() Snacks.picker.files({cwd = vim.fn.stdpath("config")}) end) end},
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy"},
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

			-- 2. ここで表示する順番（レイアウト）を決めます
      sections = {
				{
					section = "terminal",
					cmd = "chafa " .. dashboardImagePath .. " --size 52 --symbols vhalf; sleep .1",
					height = 30,
					padding = 2,
				},
				{
					pane=2,
					{ section = "header", padding = 5, color = "SnacksDashboardHeader" },
					-- ここで "keys" を指定すると、上で定義した preset.keys が表示されます
					-- デフォルトのメニューは表示されなくなります
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 5 },
					{ section = "startup", padding = 5 },
				},
      },
    },
	},

	keys = {
		{"<leader>d", function() Snacks.dashboard() end, desc = "Smart Find Files" },
		{"ff", function() Snacks.picker.files() end, desc = "Smart Find Files" },
		{"fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{"fg", function() Snacks.picker.grep() end, desc = "Smart Find Files" },
		{"fe", function() Snacks.picker.explorer() end, desc = "Smart Find Files" },
		{"fb", function() Snacks.picker.buffers(
			{
			win = {
				input = {
					keys={
						["dd"] = {"bufdelete",mode={"n","i"}},
					},
				},
			},
			}
		) end, desc = "Smart Find Files" },
	},
}
