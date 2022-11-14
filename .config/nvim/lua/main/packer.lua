vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- themes
  use('folke/tokyonight.nvim')

  -- nvim-lua/plenary.nvim
  use('nvim-lua/plenary.nvim')

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use('nvim-treesitter/nvim-treesitter', {
    event = "BufReadPre",
    run = ':TSUpdate',
  })

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
      require("main.outline").setup()
    end,
  }

  -- https://github.com/nvim-telescope/telescope.nvim
  use{
    'nvim-telescope/telescope.nvim',
    config = function()
      require("main.telescope").setup()
    end,
  }

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

  -- code documentation

  -- CMP
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("main.cmp").setup()
    end,
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "danymat/neogen"
    },
  }

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("main.lsp") -- setup()?
    end,
  })

  -- DAP
  -- https://github.com/mfussenegger/nvim-dap
  use('mfussenegger/nvim-dap')
  -- https://github.com/rcarriga/nvim-dap-ui
  use("rcarriga/nvim-dap-ui")

  -- Golang
  -- https://github.com/fatih/vim-go
  -- use {'fatih/vim-go', run = ':GoUpdateBinaries'}

  -- Java
  -- https://github.com/mfussenegger/nvim-jdtls
  --use {
  --  'mfussenegger/nvim-jdtls',
  --  ft = 'java'
  --}
end)
