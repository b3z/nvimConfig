local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function() return require("packer.util").float { border = "rounded" } end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }
  use { "VDuchauffour/neodark.nvim" }
  use { "iamcco/markdown-preview.nvim" }
  use { "lervag/vimtex" }
  use { "kylechui/nvim-surround" }
  use { "mbbill/undotree" }
  use { "f-person/auto-dark-mode.nvim" }
  use { "ekickx/clipboard-image.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }
  --  use {"Darazaki/indent-o-matic"}
  --  use {"rcarriga/nvim-notify"}
  use { "stevearc/dressing.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/bufferline.nvim" }
  -- use {"onsails/lspkind.nvim"}
  use { "famiu/bufdelete.nvim" }
  use { "nvim-tree/nvim-tree.lua" }
  --  use {"p00f/nvim-ts-rainbow"}
  --  use {"windwp/nvim-ts-autotag"}
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "nvim-treesitter/nvim-treesitter" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "williamboman/mason.nvim" }
  use { "L3MON4D3/LuaSnip" }
  --  use {"WhoIsSethDaniel/mason-tool-installer.nvim"}
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { "lewis6991/gitsigns.nvim" }
  use { "NvChad/nvim-colorizer.lua" }
  use { "windwp/nvim-autopairs" }
  use { "numToStr/Comment.nvim" }
  --  use {"lukas-reineke/indent-blankline.nvim"}
  -- use {"declancm/cinnamon.nvim"}
  use { "max397574/better-escape.nvim" }

  use { "junegunn/fzf" }
  use { "junegunn/fzf.vim" }
  use { "mfussenegger/nvim-jdtls" }
  use { "akinsho/toggleterm.nvim" }

  use {"sonph/onehalf"}

  use {
    "puremourning/vimspector",
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    config = function() require("user.vimspector").setup() end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
