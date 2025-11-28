return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			on_highlights = function(hl, c)
				hl.LineNr = {-- line numbers color
					fg = c.fg_dark,
				}
				-- set telescope-bg transparent
        hl.TelescopeNormal = {
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            fg = c.blue,
        }
				hl.TelescopePromptTitle = {
					bg = none,
					fg = c.orange,
				}
				hl.TelescopePromptNormal = {
					fg = c.fg_dark,
				}
				hl.TelescopePromptBorder = {
					--fg = c.fg_dark,
					fg = c.orange,
				}
				hl.TelescopePreviewTitle = {
					bg = none,
					fg = c.green,
				}
				hl.TelescopePreviewBorder = {
					bg = none,
					fg = c.green,
				}
				hl.TelescopeResultsTitle = {
					bg = none,
					fg = c.bule,
				}
				hl.TelescoopResultsBorder = {
					bg = none,
					fg = c.green,
				}
			end,
			style = {
				comments = {italic = true},
				keywords = {italic = true},
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
