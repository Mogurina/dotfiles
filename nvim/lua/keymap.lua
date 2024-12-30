--keymap
local keymap = vim.keymap
keymap.set('i','jk','<ESC>')
keymap.set('v','<leader>jk','<ESC>')
keymap.set('t','<leader>jk','<C-\\><C-n>')

--keymap.set('n','tt','<cmd>belowright new<CR><cmd>terminal<CR>',{silent=true})
--keymap.set('n','tx','<cmd>terminal<CR>',{silent=true})
--vim.cmd('autocmd TermOpen * :startinsert')
--vim.cmd('autocmd TermOpen * setlocal norelativenumber')
--vim.cmd('autocmd TermOpen * setlocal nonumber')



