return {
	"nvim-treesitter/nvim-treesitter", 
	cond=true,
	build = ":TSUpdate",
	config = function()
		--treesitter settings
		local status, treesitter = pcall(require, "nvim-treesitter.configs")
		if (not status) then return end

		treesitter.setup {
		-- ここでハイライトしたい言語を指定しておくと、起動時にインストールされます
		  ensure_installed = {"go","python","vim","fish","typescript","tsx","javascript","json","lua","gitignore","bash","astro","markdown","css","scss","yaml","toml","vue","php","html"},
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

	end
}
