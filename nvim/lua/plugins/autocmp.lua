return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("mason").setup()

			local registry = require("mason-registry")
			local packages = {
				"gopls",
				"typescript-language-server",
				"jedi-language-server",
				"css-lsp",
				"html-lsp",
			}

			registry.refresh(function ()
				for _, pkg_name in ipairs(packages) do
					local pkg = registry.get_package(pkg_name)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end)

			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server)
					local opt = {
						-- -- Function executed when the LSP server startup
						-- on_attach = function(client, bufnr)
							--   local opts = { noremap=true, silent=true }
							--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
							--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
							-- end,
							capabilities = require('cmp_nvim_lsp').default_capabilities(
							vim.lsp.protocol.make_client_capabilities()
							)
						}
						require("lspconfig")[server].setup(opt)
					end,
				})
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				require('lspconfig').cssls.setup({
					capabilities=capabilities,
					settings = {
						css = {
							lint = {
								unknownAtRules = 'ignore',
							},
						},
					},
				})
			end,
		},
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/vim-vsnip",
			},
			config = function()
				local cmp = require("cmp")

				cmp.setup({
					window = {
						completion = cmp.config.window.bordered({winhighlight="Normal:PopMenu,FloatBorder:None,CursorLine:Visual,Search:None"}),
						documentation = cmp.config.window.bordered({
							border = "rounded",
							winhighlight="Normal:PopMenu,FloatBorder:None,CursorLine:Visual,Search:None"}),
					},
					completion = {
						completion = "menu,menuone,noinsert",
					},
					snippet = {
						expand = function(args)
							vim.fn["vsnip#anonymous"](args.body)
						end,
					},
					sources = {
						{ name = "nvim_lsp" },
						{ name = "nvim_lsp_signature_help"},
						{ name = "buffer" },
						{ name = "path" },
					},
					mapping = cmp.mapping.preset.insert({
						["<S-TAB>"] = cmp.mapping.select_prev_item(),
						["<TAB>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
						['<C-l>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm { select = true },
					}),
					experimental = {
						ghost_text = true,
					},
				})
				--cmp.setup.cmdline(":", {
					--	completion = {
						--		completeopt = "menu,menuone,noinsert,noselect",
						--	},
						--})
					end,
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "LspAttach",
			opts = {
				bind = true,
				floating_window = false,
				handler_opts = {
					border = "rounded"
				},
				transparency = 10,
			},
			config = function(_, opts) require'lsp_signature'.on_attach(opts) end
		}
}


