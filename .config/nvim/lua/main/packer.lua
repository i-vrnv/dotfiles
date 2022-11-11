vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- themes
  use('folke/tokyonight.nvim')

  -- https://github.com/nvim-lualine/lualine.nvim
  use({
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    after = "nvim-treesitter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },


    config = function()
      require("main.lualine").setup()
    end,
  })

  -- Buffer line
  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    config = function()
      require("main.bufferline").setup()
    end,
  }

  -- nvim-lua/plenary.nvim
  use('nvim-lua/plenary.nvim')

  -- https://github.com/TimUntersberger/neogit
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("main.neogit").setup()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    -- event = "BufReadPre",
    wants = "plenary.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("main.gitsigns").setup()
    end,
  }
  -- A tree like view for vim
  -- https://github.com/simrat39/symbols-outline.nvim
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("main.outline")
    end,
  }

  -- https://github.com/nvim-telescope/telescope.nvim
  use{
    'nvim-telescope/telescope.nvim',
    config = function()
      require("main.gitsigns").setup()
    end,
}

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use('nvim-treesitter/nvim-treesitter', {
    event = "BufReadPre",
    run = ':TSUpdate',
  })

  -- Auto pairs
  -- https://github.com/windwp/nvim-autopairs
  use {
    "windwp/nvim-autopairs",
    wants = "nvim-treesitter",
    module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
    config = function()
      require("main.autopairs").setup()
    end,
  }

  -- Golang
  -- https://github.com/fatih/vim-go
  -- use {'fatih/vim-go', run = ':GoUpdateBinaries'}

  -- Java
  -- https://github.com/mfussenegger/nvim-jdtls
  use {
    'mfussenegger/nvim-jdtls',
    ft = 'java'
  } 


  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  -- MIGRATE TO MASON 
  -- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/mason.lualine
  -- https://github.com/williamboman/nvim-lsp-installer/discussions/876
  use("williamboman/nvim-lsp-installer")

  use {
    "neovim/nvim-lspconfig", 
    config = function()
      require("main.lsp").setup()
    end,
  } 

  -- set in a good hierarcy 
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use {
    "danymat/neogen",
    config = function()
      require("main.neogen").setup()
    end,
    -- cmd = { "Neogen" },
    module = "neogen",
    disable = false,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("main.cmp").setup()
    end,
  }
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")



  -- DAP
  -- https://github.com/mfussenegger/nvim-dap
  use('mfussenegger/nvim-dap')
  -- https://github.com/rcarriga/nvim-dap-ui
  use("rcarriga/nvim-dap-ui") 
end)
