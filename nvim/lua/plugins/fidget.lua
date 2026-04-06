return {
	'j-hui/fidget.nvim', 
	event = 'LspAttach',
	opts = {
		display = {
			render_limit = 3,
			done_ttl = 2,
		},
	},
} --LSPと連動するプラグインは'LspAttach'を指定する。

