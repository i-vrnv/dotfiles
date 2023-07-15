local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {

  -- https://github.com/nvim-lua/plenary.nvim 
  {'nvim-lua/plenary.nvim'},

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("main.treesitter").setup()
    end,
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  {'nvim-treesitter/nvim-treesitter-context'},

  -- https://github.com/folke/tokyonight.nvim
  {'folke/tokyonight.nvim'},

  -- https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },

  -- https://github.com/rose-pine/neovim
  {
	  'rose-pine/neovim',
	  name = 'rose-pine',
  },

  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function()
      require('main.lualine').setup()
    end,
  },

  -- https://github.com/akinsho/bufferline.nvim 
  {
    'akinsho/nvim-bufferline.lua',
    event = 'BufReadPre',
    config = function()
      require('main.bufferline').setup()
    end,
  },

  -- https://github.com/TimUntersberger/neogit
  {
    "TimUntersberger/neogit",
    cmd = 'Neogit',
    module = {'neogit'},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('main.neogit').setup()
    end,
  },

  -- https://github.com/tpope/vim-fugitive
  use {
    "tpope/vim-fugitive",
    config = function()
      require('main.fugitive').setup()
    end,
  }

  -- https://github.com/lewis6991/gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('main.gitsigns').setup()
    end,
  },

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('main.neotree').setup()
    end,
  },

  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('main.telescope').setup()
    end,
    dependencies = {
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      {'nvim-telescope/telescope-ui-select.nvim'}
    }
  },

  {
    'junegunn/fzf',
    build = './install --all',
    enabled = true,
  },

  -- https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    module = {'nvim-autopairs.completion.cmp', 'nvim-autopairs'},
    config = function()
      require('main.autopairs').setup()
    end,
  },

  -- https://github.com/mbbill/undotree
  {
    "mbbill/undotree",
    config = function()
      require('main.undotree').setup()
    end,
  },

  {
    'echasnovski/mini.comment',
    branch = 'stable',
    config = function()
      require('main.comment').setup()
    end,
  },

  {
    'theprimeagen/harpoon',
    config = function()
      require('main.harpoon').setup()
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('main.copilot').setup()
    end,
    dependencies = {
      {'zbirenbaum/copilot-cmp'},
    },
    enabled = true,
  },

  -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    opts = {
      debug = false,
    },
    config = function()
      require('main.copilot-chat').setup()
    end,
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'ray-x/cmp-treesitter'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    config = function()
      require('main.lsp').setup()
    end,
  },

  -- DAP
  -- https://github.com/mfussenegger/nvim-dap
  {
    'mfussenegger/nvim-dap',
    -- module = {'dap'},
    dependencies = {
      -- https://github.com/rcarriga/nvim-dap-ui
      {"nvim-neotest/nvim-nio"},
      {'rcarriga/nvim-dap-ui'},
      {'leoluz/nvim-dap-go'},
      {'theHamsta/nvim-dap-virtual-text'},
      {'nvim-telescope/telescope-dap.nvim'},
    },
    config = function()
      require('main.dap').setup()
    end,
  },

  -- Golang
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua'
    },
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    config = function()
      require('go').setup( {
        -- lsp_codelens = false,
      })
    end,
    enabled = true
  },

  -- Java
  -- https://github.com/mfussenegger/nvim-jdtls
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    enabled = false
  }
}

local opts = {
  ui = {
    border = "rounded",
  }
}

require("lazy").setup(plugins, opts)



