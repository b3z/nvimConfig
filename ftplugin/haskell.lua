 vim.keymap.set('n', '<leader>r', ":w<CR>:exec '!ghci' shellescape(@%, 1)<CR>", { silent = true })
 vim.keymap.set('n', '<leader>R', ":w<CR>:exec '!ghc' shellescape(@%, 1)<CR>", { silent = true })
