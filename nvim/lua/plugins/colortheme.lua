return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				--terminal_colors = true,
				style = {
					comments = {italic = true},
					keywords = {italic = true},
					functions = {},
					variables = {},
					sidebars = "transparent",
					floats = "transparent",
				},
				--sidebars = {"qf"},
				day_brightness = 0.4,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = true,
			

				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = none,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = c.bg_dark,
					}
					hl.TelescopePromptBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.PreProc={
						fg = c.yellow500,
					}
				end,
			})
		end,
	},
	{
		'olivercederborg/poimandres.nvim',
			lazy = false,
			priority = 1000,
			config = function()
				require('poimandres').setup {
					-- leave this setup function empty for default config
					-- or refer to the configuration section
					-- for configuration options
					bold_vert_split = false, -- use bold vertical separators
					dim_nc_background = false, -- dim 'non-current' window backgrounds
					disable_background = true, -- disable background
					disable_float_background = false, -- disable background for floats
					disable_italics = false, -- disable italics
				}
			
			require("notify").setup({
				background_colour = "#000000",
			})
			end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			on_highlights = function(hl, c)
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
					fg = c.green,
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
