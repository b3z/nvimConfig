local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", "Q", "<NOP>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "WW", ":w<CR>", opts)
keymap("n", "<leader><Tab>", ":bnext<CR>", opts)
keymap("n", "<leader><S-Tab>", ":bprev<CR>", opts)
-- keymap("n", "<leader><S-Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>fn", ":enew<CR>", opts)
keymap("n", "<leader><left>", ":vertical resize +10<cr>", opts)
keymap("n", "<leader><right>", ":vertical resize -10<cr>", opts)

keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<leader>u", ":UndotreeToggle<cr><cmd>UndotreeFocus<cr>", opts)
keymap("n", "<leader>q", ":Bdelete<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>o", ":NvimTreeFocus<cr>", opts)
keymap("n", "<leader>t", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>s", ":Telescope live_grep<cr>", opts)

-- Insert --
keymap("i", "hh", "<ESC>", opts)


-- Visual --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--keymap("v", "p", '"_dP', opts)

-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

