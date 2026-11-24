return {
	{ "williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup()
			local registry = require("mason-registry")
			local packages = {
				"gopls",
				"pyright",
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
		end,
	},
	-- 2. Blink.cmp (補完・シグネチャ・ゴーストテキストを全て統合)
  {
    "saghen/blink.cmp",
    version = "*",
		event = { "InsertEnter", "BufReadPre", "BufNewFile" },
    dependencies = {
      "zbirenbaum/copilot.lua", -- Copilot本体 (事前にsetupが必要な場合があります)
      "giuxtaposition/blink-cmp-copilot", -- Blink用のCopilotブリッジ
    },
    opts = {

      -- ユーザー定義のキーマップをBlink向けに翻訳
      keymap = {
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>']   = { 'select_next', 'snippet_forward', 'fallback' },
        ['<C-l>']   = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>']   = { 'hide' },
        ['<CR>']    = { 'accept', 'fallback' },
      },
      
      -- ゴーストテキスト（experimental.ghost_textの代わり）
      completion = {
				list = {
					-- 自動的に選択・挿入させない
					selection = { preselect = false, auto_insert = false },
				},
        ghost_text = { enabled = true },
        menu = {
					border = "rounded",
					winhighlight = 'FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
				},
        documentation = { window = { border = "rounded" } },
      },

      -- lsp_signature.nvim と cmp-nvim-lsp-signature-help の代わり
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },

      -- 使用するソース (LSP, Copilot, パス, バッファ, スニペットが標準装備)
      sources = {
        default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100, -- Copilotの提案を上に表示したい場合の調整
            async = true,
          },
        },
      },
    }
	},



}
