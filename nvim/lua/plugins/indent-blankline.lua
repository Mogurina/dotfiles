return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      -- ご希望の「点（ドット）」を設定します
      char = "·", 

      -- よく使われる他の記号の例（お好みでコメントアウトを外して試してください）
      --char = "┊", 
      -- char = "│",
      -- char = "▏",
    },
    scope = {
      -- 現在カーソルがあるインデントの範囲をハイライトするかどうか
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
}
