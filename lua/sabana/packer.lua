-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Golang
    use 'fatih/vim-go'

    use { "ibhagwan/fzf-lua",
      -- optional for icon support
      requires = { "nvim-tree/nvim-web-devicons" }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
        require("telescope").load_extension "frecency"
        end,
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }

    use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
    }

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use { 'leoluz/nvim-dap-go',
        requires = {
            'nvim-neotest/nvim-nio'
        }
    }
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- Theme
    use { 'catppuccin/nvim',
        as = 'catppuccin',
        transparent_background = true,
    }
    use "EdenEast/nightfox.nvim"
    use "tjdevries/colorbuddy.nvim"

    --devicons
    use 'kyazdani42/nvim-web-devicons'

    -- Todo comments
    -- use 'folke/todo-comments.nvim'

    -- grammar checking
    use 'rhysd/vim-grammarous'

    -- Nvim tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
      }

    -- Getting gud
    use 'ThePrimeagen/vim-be-good'

    -- Code screenshots
    use "ellisonleao/carbon-now.nvim"

    -- Tmux integration
    use { "christoomey/vim-tmux-navigator",
        lazy = true
    }
end)
