-- Install packer.
local packerpath = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if not vim.loop.fs_stat(packerpath) then
    vim.fn.system {
        'git',
	    'clone',
	    '--depth=1',
	    'https://github.com/wbthomason/packer.nvim',
	    packerpath,
    }
    is_bootstrap = true
    vim.cmd.packadd('packer.nvim')
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'rose-pine/neovim', as = 'rose-pine'
  }

  use {
      'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}
  }

  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  if is_bootstrap then
      require('packer').sync()
  end

end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

