local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'windwp/nvim-ts-autotag' -- Auto closing tags
    use 'windwp/nvim-autopairs' -- Auto closing brackets
    use {
        'nvim-telescope/telescope.nvim', -- File finder
        requires = { 'nvim-lua/plenary.nvim', opt = true } -- Lua utils and grep utils
    }
    use {
        'nvim-telescope/telescope-file-browser.nvim', -- File manipulation for Telescope
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'romgrk/barbar.nvim', requires = 'nvim-tree/nvim-web-devicons'} -- Tabs
    use {'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons', tag = 'nightly'} -- Directory Tree 
    use { 
        'glepnir/lspsaga.nvim',    -- LSP UI for different functionalities
        branch = 'main',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics, code actions, etc injections via Lua
end)
