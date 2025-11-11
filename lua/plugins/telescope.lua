return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    opts_extend = { 'spec' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
