return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  opts = {
    defaults = {
    },
    pickers = {
      find_files = {
        hidden = true
      }
    },
    extensions = {
    }
  }
}
