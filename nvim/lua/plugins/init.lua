local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- core
    use 'nvim-lua/plenary.nvim'
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('plugins.cmp')
      end
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('plugins.lspconfig')
      end
    }
    use {
      'onsails/lspkind.nvim',
      config = function()
        require('lspkind')
      end
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
        end,
    })
    -- icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup({ default = true; })
      end
    }

    use {
      'tzachar/cmp-tabnine',
      run='./install.sh'
    }
    use('onsails/lspkind-nvim')

    -- fzf
    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require('plugins.telescope')
      end
    }

    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.nvim-tree')
      end
    }

    -- snippets
    use {
      'L3MON4D3/LuaSnip',
      after = 'friendly-snippets',
      config = function()
        require('luasnip/loaders/from_vscode').load({
          paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
        })
      end
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    use {
      'TimUntersberger/neogit',
      config = function()
        require('neogit').setup()
      end
    }

    -- colorschemas
    use 'gruvbox-community/gruvbox'
    use 'joshdick/onedark.vim'

    -- statusbar
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('plugins.lualine')
      end
    }

    use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      config = function()
        require('plugins.bufferline')
      end
    }

    -- utils
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use {
      'windwp/nvim-autopairs',
      config = function()
        require("nvim-autopairs").setup()
      end
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('plugins.nvim-colorizer')
      end
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  -- packer config
  log = { level = 'info' },
  config = {
    display = {
      prompt_border = 'single',
    },
    profile = {
      enable = true,
      threshold = 0,
    },
  },
}
