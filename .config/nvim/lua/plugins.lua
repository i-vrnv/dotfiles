vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- SYNTAX --
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = { {'nvim-lua/plenary.nvim'} },
    run = ':TSUpdate',
    config = function()
      require("main.treesitter").setup()
    end,
  }

  -- VIEW --
  -- https://github.com/folke/tokyonight.nvim
  use('folke/tokyonight.nvim')

  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    after = 'nvim-treesitter',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('main.lualine').setup()
    end,
  }

  -- https://github.com/akinsho/bufferline.nvim 
  use {
    'akinsho/nvim-bufferline.lua',
    event = 'BufReadPre',
    wants = 'nvim-web-devicons',
    config = function()
      require('main.bufferline').setup()
    end,
  }

  -- GIT ---
  -- https://github.com/TimUntersberger/neogit
  use {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    module = { "neogit" },
    config = function()
      require('main.neogit').setup()
    end,
  }

  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    wants = 'plenary.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('main.gitsigns').setup()
    end,
  }

  -- NAV --
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
    end,
  }

  -- https://github.com/simrat39/symbols-outline.nvim
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('main.outline').setup()
    end,
  }

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('main.telescope').setup()
    end,
    requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" }
    }
  }

  -- EDIT --
  -- https://github.com/windwp/nvim-autopairs
  use {
    'windwp/nvim-autopairs',
    wants = 'nvim-treesitter',
    module = { 'nvim-autopairs.completion.cmp', 'nvim-autopairs' },
    config = function()
      require('main.autopairs').setup()
    end,
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    config = function()
      require('main.lsp').setup()
    end,
  }

  -- DAP
  -- https://github.com/mfussenegger/nvim-dap
  -- https://github.com/rcarriga/nvim-dap-ui
  use {
    "mfussenegger/nvim-dap",
    -- opt = true,
    -- module = { "dap" },
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
      --{ "mfussenegger/nvim-dap-python", module = { "dap-python" } },
    },
    config = function()
      require("main.dap").setup()
    end,
  }

  -- Golang
  use {
    "ray-x/go.nvim",
    ft = { "go" },
    requires = {
      "ray-x/guihua.lua"
    },
    config = function()
      require("go").setup()
    end,
    disable = true
  }
end)
