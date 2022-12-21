vim.keymap.set('n', '<leader>r', ":w<CR>:exec '!python3' shellescape(@%, 1)<CR>", { silent = false })
-- vim.keymap.set('n', '<leader>R', ":w<CR>:term '!python3 -i' shellescape(@%, 1)<CR>", { silent = false })
vim.keymap.set('n', '<leader>R', ":w<CR>:vsp | :term python3 -i %<CR>G$i", { silent = false })


