-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Golang
    use 'fatih/vim-go'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}

    use {
        "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require"telescope".load_extension("smart_open")
  end,
  requires = {
    {"kkharji/sqlite.lua"},
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
    { "nvim-telescope/telescope-fzy-native.nvim" },
  }
}

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
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
    use 'leoluz/nvim-dap-go'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
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

    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
        "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "helio",
          path = "~/vaults/work/helio",
        },
      },

      -- see below for full list of options 👇
    })
  end,
})
end)
