vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- themes
    use("folke/tokyonight.nvim")

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
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
        config = function()
            require("main.neogit").setup()
        end,
    }

    -- https://github.com/nvim-telescope/telescope.nvim
    use('nvim-telescope/telescope.nvim')

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })

    -- Golang
    -- https://github.com/fatih/vim-go
    -- use {'fatih/vim-go', run = ':GoUpdateBinaries'}

    -- Java
    use('mfussenegger/nvim-jdtls')

    -- ???
    use("simrat39/symbols-outline.nvim")

    -- autocompletion(cmp) & LSP
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
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- DAP
    -- https://github.com/mfussenegger/nvim-dap
    use('mfussenegger/nvim-dap')
    -- https://github.com/rcarriga/nvim-dap-ui
    use("rcarriga/nvim-dap-ui") 
end)
