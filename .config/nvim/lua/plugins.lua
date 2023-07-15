return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- https://github.com/nvim-lua/plenary.nvim 
  use('nvim-lua/plenary.nvim')

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("main.treesitter").setup()
    end,
  }

  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  use {'nvim-treesitter/nvim-treesitter-context'}

  -- https://github.com/folke/tokyonight.nvim
  use('folke/tokyonight.nvim')
  use {'catppuccin/nvim', as = 'catppuccin'}

  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    after = 'nvim-treesitter',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
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

  -- https://github.com/TimUntersberger/neogit
  use {
    "TimUntersberger/neogit",
    cmd = 'Neogit',
    module = {'neogit'},
    requires = {
         'nvim-lua/plenary.nvim',
         'sindrets/diffview.nvim'
    },
    config = function()
      require('main.neogit').setup()
    end,
  }

  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    'lewis6991/gitsigns.nvim',
    wants = 'plenary.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('main.gitsigns').setup()
    end,
  }

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('main.neotree').setup()
    end,
  }

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('main.telescope').setup()
    end,
    requires = {
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-ui-select.nvim'}
    }
  }

  use {'junegunn/fzf', run = './install --all' }

  -- https://github.com/windwp/nvim-autopairs
  use {
    'windwp/nvim-autopairs',
    wants = 'nvim-treesitter',
    module = {'nvim-autopairs.completion.cmp', 'nvim-autopairs'},
    config = function()
      require('main.autopairs').setup()
    end,
  }

  use {
    "mbbill/undotree",
    config = function()
      require('main.undotree').setup()
    end,
  }

  use {
    'echasnovski/mini.comment',
    branch = 'stable',
    config = function()
      require('main.comment').setup()
    end,
  }

  use {
    'theprimeagen/harpoon',
    config = function()
      require('main.harpoon').setup()
    end,
  }
  --use("github/copilot.vim")

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
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
  }

  -- DAP
  -- https://github.com/mfussenegger/nvim-dap
  use {
    'mfussenegger/nvim-dap',
    -- module = {'dap'},
    requires = {
      -- https://github.com/rcarriga/nvim-dap-ui
      {'rcarriga/nvim-dap-ui'},
      {'leoluz/nvim-dap-go'},
      {'theHamsta/nvim-dap-virtual-text'},
      {'nvim-telescope/telescope-dap.nvim'},
    },
    config = function()
      require('main.dap').setup()
    end,
  }

  -- Golang
  use {
    'ray-x/go.nvim',
    requires = {
      'ray-x/guihua.lua'
    },
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    config = function()
      require('go').setup()
    end,
  }

  -- Java
  -- https://github.com/mfussenegger/nvim-jdtls
  --use {
    --  'mfussenegger/nvim-jdtls',
    --  ft = 'java'
    --}

end)
