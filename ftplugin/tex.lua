 -- vim.keymap.set('n', '<leader>r', ":VimtexCompile<cr> :VimtexView<cr>", { silent = true })
 vim.keymap.set('n', '<leader>r', ":VimtexCompile<cr>:exec '!zathura' '%<.pdf&;disown'<CR>:redraw!<cr>", { silent = true })
