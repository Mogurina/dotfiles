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
				day_brightness = 0.7,
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
						bg = c.bg_dark,
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
		"folke/tokyonight.nvim", 
		lazy = false, 
		priority = 1000, 
		opts = {
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 ,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

		end,
	},
	{

		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Enable transparent background
				transparent = true,

				-- Enable italics comments
				italic_comments = false,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,

				-- Modern borderless telescope theme - also applies to fzf-lua
				borderless_telescope = false,

				-- Set terminal colors used in `:terminal`
				terminal_colors = false,

				-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
				cache = false,

				theme = {
					variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
					saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
					highlights = {
						-- Highlight groups to override, adding new groups is also possible
						-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

						-- Example:
						Comment = { fg = "#696969", bg = "NONE", italic = true },

						-- Complete list can be found in `lua/cyberdream/theme.lua`
					},

					-- Override a highlight group entirely using the color palette
					overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
						-- Example:
						return {
							Comment = { fg = colors.green, bg = "NONE", italic = true },
							["@property"] = { fg = colors.magenta, bold = true },
						}
					end,

					-- Override a color entirely
					colors = {
						-- For a list of colors see `lua/cyberdream/colours.lua`
						-- Example:
						bg = "#000000",
						green = "#00ff00",
						magenta = "#ff00ff",
					},
				},

				-- Disable or enable colorscheme extensions
				extensions = {
					telescope = true,
					notify = true,
					mini = true,
				},
			})
		end,
	},
}
