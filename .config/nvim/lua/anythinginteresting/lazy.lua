require('lazy').setup({
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim', version = '0.1.1',
    dependencies = {
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-fzf-native.nvim',
    }
  }
})
